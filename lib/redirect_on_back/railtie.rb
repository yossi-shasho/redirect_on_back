module RedirectOnBack
  class Railtie < Rails::Railtie
    initializer 'redirect_on_back.form' do
      module ActionView::Helpers::FormHelper

        module ActionView::Helpers::FormTagHelper
          alias_method :orig_extra_tags_for_form, :extra_tags_for_form

          def extra_tags_for_form(html_options)
            orig_tags = orig_extra_tags_for_form(html_options)
            if !disable_redirect_on_back(html_options) && is_internal_action?(html_options['action'] || '/')
              orig_tags << "<input name='_usec' type='hidden' value='#{Time.now.usec}' />".html_safe
            end
            orig_tags
          end

          def disable_redirect_on_back(html_options)
            html_options.try(:[], :data).try(:delete, :disable_redirect_on_back)
          end

          def is_internal_action?(action)
            (action =~ /^\//) != nil  # form action starts with '/'
          end
        end
      end
    end
  end
end