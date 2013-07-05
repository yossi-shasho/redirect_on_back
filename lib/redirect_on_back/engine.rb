module RedirectOnBack
  class Engine < Rails::Engine
    initializer 'redirect_on_back controller extensions includes' do
      ActionController::Base.send(:include, RedirectOnBack::ControllerAdditions)
    end
  end
end