class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entity, only: [:edit, :update, :destroy]

  def index
    @entities = current_user.entities
  end

  def new
    @entity = current_user.entities.build
  end

  def edit
    # Renders edit form for specific entity
  end

  def create
    @entity = current_user.entities.build(entity_params)
    if @entity.save
      redirect_to entities_path, notice: 'Entity was successfully created.'
    else
      render :new
    end
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
    @entity = current_user.entities.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
