class Api::V1::UsersController < Api::V1::AppController
  def index
    users = User.all
    render json: { success: true, users: users.as_json }
  end

  def create
    # params = { first_name: "", last_name: "" }
    user = User.new(first_name: params[:first_name], last_name: params[:last_name])
    user.save!
    render json: { success: true, user: user.as_json }, status: :created
  end

  def update
    user = User.find(params[:id])
    user.first_name = params[:first_name] if params[:first_name].present?
    user.last_name = params[:last_name] if params[:last_name].present?
    user.save!
    render json: { success: true, user: user.as_json }
  end
end
