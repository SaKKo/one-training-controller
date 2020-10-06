class Api::V1::AppController < ApplicationController
  before_action :check_api_token

  def check_api_token
    if request.headers["x-api-token"] != Rails.application.credentials[:secret_key_base]
      raise OneAuthenticationError.new("Invalid token")
    end
  end
end
