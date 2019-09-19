class ApplicationController < ActionController::Base
  before_action :require_login

  def redirect_js(path)
    render :js => "window.location.href = '#{path}'"
  end

end
