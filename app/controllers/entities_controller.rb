# This controller handles operations related to entities.
# Entities represent certain objects within the system.
# It handles CRUD operations for entities.
class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entity, only: %i[edit update destroy]
  before_action :set_group

  def index
    # @entities = Entity.where(author_id: current_user.id)
    @entities = @group.entities.where(author_id: current_user.id)
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params.except(:group_ids)) # Exclude group_ids from regular attributes
    @entity.group_ids = entity_params[:group_ids] # Assign group_ids separately

    @entity.author_id = current_user.id

    if @entity.save
      redirect_to group_entities_path(@group), notice: 'Entity was successfully created.'
    else
      pp @entity.errors
      render :new
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @entity = @group.entities.find(params[:id])
  end

  def update
    # @entity.group_ids = entity_params[:group_ids] # Assign group_ids separately
    if @entity.update(entity_params)
      redirect_to group_entities_path(@group), notice: 'Entity was successfully updated.'
    else
      pp @entity.errors
      render :edit
    end
  end

  def destroy
    @entity = Entity.find(params[:id])
    EntityGroup.where(entity_id: @entity.id).delete_all
    @entity.destroy
    redirect_to group_entities_path(@group), notice: 'Entity was successfully destroyed.'
  end

  private

  def set_entity
    @entity = Entity.find_by(id: params[:id], author_id: current_user.id)
    redirect_to group_entities_path(@group), alert: 'Entity not found' if @entity.nil?
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, group_ids: [])
  end
end
