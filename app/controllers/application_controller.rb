class ApplicationController < ActionController::Base
  before_action :require_login
  

  private
    def not_authenticated
      raise ActiveRecord::RecordNotFound
    end
end
