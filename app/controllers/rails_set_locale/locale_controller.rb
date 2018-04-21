# frozen_string_literal: true

require_dependency 'rails_set_locale/application_controller'

module RailsSetLocale
  class LocaleController < ApplicationController
    # GET "/set_locale?locale=XX&return_back_to=XXXXX"
    def set_locale
      new_locale = params[:locale].to_sym
      I18n.locale = new_locale
      session[:locale] = new_locale
      redirect_to params[:return_back_to]
    end
  end
end
