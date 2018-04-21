# frozen_string_literal: true

require 'rails_set_locale/version'
require 'http_accept_language'

# All the functionality of this gem will be exposed
# using this module here.
#
module RailsSetLocale
  def self.included(base)
    base.before_action :set_locale
    base.include HttpAcceptLanguage::EasyAccess # unless base.included_modules.include?(HttpAcceptLanguage::EasyAccess)
    base.include InstanceMethods
  end

  module InstanceMethods
    def set_locale
      locale_to_set = session[:locale]

      if locale_to_set.blank?
        # try to get it from the HTTP ACCEPT LANGUAGE header
        locale_to_set = http_accept_language.compatible_language_from(I18n.available_locales)
      end

      locale_to_set = I18n.default_locale if locale_to_set.blank?

      I18n.locale = locale_to_set

      session[:locale] = locale_to_set
    end

    private :set_locale
  end
end
