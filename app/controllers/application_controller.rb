class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(item)
    stored_location_for(item) || items_path
  end
end
