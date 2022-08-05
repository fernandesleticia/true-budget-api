class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    return register_success if resource.persisted?
    
    register_failed
  end

  def register_success
    render json: { message: 'Registered successfully.' }
  end

  def register_failed
    render json: { message: 'Register failed.' }
  end
end
