require 'adwords_api'

class ApplicationController < ActionController::Base

  #before_filter :authenticate
  #protect_from_forgery

  private

  # Returns the API version in use.
  def get_api_version()
    return :v201402
  end

  # Returns currently selected account.
  def selected_account()
    @selected_account ||= '483-503-3883'
    return @selected_account
  end

  # Sets current account to the specified one.
  def selected_account=(new_selected_account)
    @selected_account = new_selected_account
    session[:selected_account] = @selected_account
  end

  # Checks if we have a valid credentials.
  def authenticate()
    token = session[:token]
    redirect_to login_prompt_path if token.nil?
    return !token.nil?
  end

  # Returns an API object.
  def get_adwords_api()
    @api ||= create_adwords_api()
    return @api
  end

  # Creates an instance of AdWords API class. Uses a configuration file and
  # Rails config directory.
  def create_adwords_api()
    
  end
end
