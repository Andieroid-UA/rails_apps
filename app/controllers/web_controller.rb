class WebController < ApplicationController
  def bootstrap
    render json: {
      current_user: UserBlueprint.render_as_json(@current_user, view: :me),
    }, status: :ok
  end
end
