module RedirectOnBack
  # This module is automatically included into all controllers.
  module ControllerAdditions

    def redirect_on_back_to(to_path)
      if to_path && params && (token = params[:_usec]).present?
        cookies["redirect_#{token}"] = to_path
      else
        false
      end
    end
  end

end

