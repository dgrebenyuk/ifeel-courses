class ApplicationController < ActionController::Base
  rescue_from ActionController::ParameterMissing do |exception|
    render plain: exception.message, status: :unprocessable_entity
  end
end
