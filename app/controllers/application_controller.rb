class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper# module will be accessible in each controller
end
