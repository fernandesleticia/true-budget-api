class CategoryPolicy
  def initialize(user, category)
    @user = user
    @category = category
  end

  def show?
    true
  end

  def index?
    true
  end

  def create?
    false
  end
end
