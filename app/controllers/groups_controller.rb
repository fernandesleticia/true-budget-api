class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def create
    @group = Group.new(params)
    @group.save
  end
end
