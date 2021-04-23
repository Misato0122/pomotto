module UserSessionsHelper
  def sign_in(user)
    post '/api/session', params: { email: user[:email], password: "password" }
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end