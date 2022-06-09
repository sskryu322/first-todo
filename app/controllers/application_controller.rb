class ApplicationController < ActionController::Base
  before_action :basic_auth
  include SessionsHelper

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |_username, password|
      ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
