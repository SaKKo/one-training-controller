class ApplicationController < ActionController::API
  rescue_from OneAuthenticationError, with: :rescue_authentication_error
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_record_invalid

  def rescue_authentication_error(exception)
    render json: { success: false, error: exception.message }, status: 401 and return
  end

  def rescue_not_found(exception)
    render json: { success: false, error: exception.message }, status: :not_found and return
  end

  def rescue_record_invalid(exception)
    render json: { success: false, error: exception.message }, status: :bad_request and return
  end
end
