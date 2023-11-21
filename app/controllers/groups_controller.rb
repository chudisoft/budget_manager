class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:edit, :update, :destroy]

  def index
    @groups = current_user.groups
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
