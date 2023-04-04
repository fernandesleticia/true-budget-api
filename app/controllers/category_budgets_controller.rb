class CategoryBudgetsController < BaseController
  def show
    category_budget = CategoryBudget.find_by(id: params[:id])

    render json: category_budget.to_hash, status: :ok
  end

  def index
    category_budgets = CategoryBudget.all
    render json: CategoryBudget.serialize(category_budgets), status: :ok
  end

  def create
    category_budget = CategoryBudget.new(create_params)

    response = if category_budget.save
      { json: { message: I18n.t("category_budget.created"), category: category_budget }, status: :ok }
    else
      { json: { message: I18n.t("category_budget.error_creating") }, status: :unprocessable_entity }
    end

    render response
  end

  private

  def create_params
    params
      .require(:category_budget)
      .permit(:category_id)
  end
end
