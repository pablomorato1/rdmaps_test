class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :null_session

  layout :layout_by_resource

  private

  def layout_by_resource
    devise_controller? ? "devise" : "application"
  end
end
