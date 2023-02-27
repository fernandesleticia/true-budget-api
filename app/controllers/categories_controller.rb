class CategoriesController < BaseController
  def show
    category = Category.find_by(id: params[:id])

    render json: category.to_hash, status: :ok
  end

  def index
    categories = Category.all
    render json: Category.serialize(categories), status: :ok
  end

  def create
    category = Category.new(create_params)

    response = if category.save
      { json: { message: I18n.t("category.created"), category: category }, status: :ok }
    else
      { json: { message: I18n.t("category.error_creating") }, status: :unprocessable_entity }
    end

    render response
  end

  private

  def create_params
    params
      .require(:category)
      .permit(:name, :group_id)
  end
end
