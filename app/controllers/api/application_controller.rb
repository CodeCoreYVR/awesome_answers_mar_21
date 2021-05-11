class Api::ApplicationController < ApplicationController
  # Use this controller to share methods among only the api controllers.

  # When making POST, PATCH, and DELETE requests to controllers, 
  # the rails authenticity token will be provided. This isn't
  # needed for public HTTP apis, so we'll skip it.
  skip_before_action(:verify_authenticity_token)

  private

  def authenticate_user!
    unless current_user.present?
      render(
        json: { status: 401 },
        status: 401, # Unauthorized
      )
    end
  end
end
