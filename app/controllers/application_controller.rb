class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate
  protect_from_forgery with: :null_session

  protected

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      @_current_user ||= ApiKey.active.find_by(access_token: token)&.user
    end
    binding.pry
  end

  def current_user
    @_current_user
  end

  def set_access_token!(user)
    api_key = user.activate_api_key!
    response.headers['AccessToken'] = api_key.access_token
  end
end
