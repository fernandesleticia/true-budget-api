# frozen_string_literal: true

class BasePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
  end

  def show?
  end

  def new?
  end

  def create?
  end

  def edit?
  end

  def update?
  end

  def destroy?
  end
end