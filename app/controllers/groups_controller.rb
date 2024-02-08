# This controller handles operations related to Groups.
# Groups represent certain objects within the system.
# It handles CRUD operations for Groups.
class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[edit update destroy]

  def index
    @groups = current_user.groups.includes(:entities)

    @groups = if params[:sort] == 'ancient'
                @groups.order(created_at: :asc)
              else # if params[:sort] == 'recent'
                @groups.order(created_at: :desc)
              end

    @group_entity_sums = {}
    @groups.each do |group|
      @group_entity_sums[group.id] = group.entities.sum(:amount)
    end
  end

  def new
    @group = current_user.groups.build
  end

  def edit
    # Renders edit form for specific group
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if current_user == @group.user # Ensure the current user owns the group
      @group.entities.destroy_all
      @group.destroy
      redirect_to groups_path, notice: 'Group was successfully removed.'
    else
      redirect_to groups_path, alert: "You don't have permission to remove this group."
    end
  end

  private

  def set_group
    @group = current_user.groups.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
