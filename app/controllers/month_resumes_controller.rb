class MonthResumesController < BaseController
  def show
    month_resume = MonthResume.find_by(id: params[:id])

    render json: month_resume.to_hash, status: :ok
  end

  def index
    month_resumes = MonthResume.all
    render json: MonthResume.serialize(month_resumes), status: :ok
  end

  def create
    month_resume = MonthResume.new(create_params)

    response = if month_resume.save
      { json: { message: I18n.t("month_resume.created"), month_resume: month_resume }, status: :ok }
    else
      { json: { message: I18n.t("month_resume.error_creating") }, status: :unprocessable_entity }
    end

    render response
  end

  private

  def create_params
    params
      .require(:month_resume)
      .permit(:month)
  end
end
