class ApplicationController < ActionController::Base
  layout :custom_layout

  private
  def custom_layout
    user_signed_in? ? "application" : "devise"
  end
end