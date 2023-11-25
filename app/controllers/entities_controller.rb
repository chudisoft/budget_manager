class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :set_entity, only: [:edit, :update, :destroy]

  def index
    pp @group.entities
    @entities = @group.entities
  end

  def new
    @entity = @group.entities.build
  end

  def edit
    # Renders edit form for a specific entity within the group
  end

  def create
    @entity = @group.entities.new(entity_params)
    @entity.author = current_user
    # @entity.group = @group

    if @entity.save
      redirect_to group_entities_path(@group), notice: 'Entity was successfully created.'
    else
      pp @entity.errors
      render :new
    end
  end

  def update
    if @entity.update(entity_params)
      redirect_to group_entities_path(@group), notice: 'Entity was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @entity.destroy
    redirect_to group_entities_path(@group), notice: 'Entity was successfully destroyed.'
  end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
    rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Group not found'
  end

  def set_entity
    @entity = @group.entities.find(params[:id])
  end

  def entity_params
    # params.require(:entity).permit(:name, :amount)
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
