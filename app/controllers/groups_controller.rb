class GroupsController < BaseController
  def index
    groups = Group.all
    render json: Group.serialize(groups), status: :ok 
  end

  def show
    group = Group.find(params[:id])
    render json: group.to_hash, status: :ok
  end

  def create
    group = Group.new(group_params)

    response = if group.save
      { json: { message: I18n.t("group.created"), group: group }, status: :ok }
    else
      { json: { message: I18n.t("group.error_creating") }, status: :unprocessable_entity }
    end

    render response
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
