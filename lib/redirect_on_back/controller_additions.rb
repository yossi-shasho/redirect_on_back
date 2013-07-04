module RedirectOnBack

  # This module is automatically included into all controllers.
  module ControllerAdditions
    module ClassMethods

      def redirect_on_back(to_path)
        if to_path && params && (token = params[:_usec]).present?
          cookies["redirect_#{token}"] = to_path
        else
          false
        end
      end
    end

  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include RedirectOnBack::ControllerAdditions
  end
end