class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entity, only: [:edit, :update, :destroy]

  def index
    @entities = Entity.where(author_id: current_user.id)
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author_id = current_user.id

    if @entity.save
      redirect_to entities_path, notice: 'Entity was successfully created.'
    else
      render :new
    end
  end

  def edit
    # Renders edit form for a specific entity
  end

  def update
    if @entity.update(entity_params)
      redirect_to entities_path, notice: 'Entity was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @entity.destroy
    redirect_to entities_path, notice: 'Entity was successfully destroyed.'
  end

  private

  def set_entity
    @entity = Entity.find_by(id: params[:id], author_id: current_user.id)
    redirect_to entities_path, alert: 'Entity not found' if @entity.nil?
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
