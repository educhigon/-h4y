class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # @route_prefix = request.path_parameters[:controller]
  # in the `application_controller.rb`

end
