# frozen_string_literal: true

class ApplicationController < ActionController::Base
end

RSpec.describe ApplicationController, type: :controller do
  before do
    I18n.locale = I18n.default_locale
  end

  controller do
    include RailsSetLocale

    def index
      head :ok
    end
  end

  context 'when there is locale in session' do
    before do
      @request.session[:locale] = :el
    end

    it 'is used to set the current locale' do
      get :index

      expect(I18n.locale).to eq(:el)
    end
  end

  context 'when there is not locale in session' do
    before do
      @request.session[:locale] = nil
    end

    context 'when http accept language defines any of the available locales' do
      before do
        @request.headers['HTTP_ACCEPT_LANGUAGE'] = 'el, en-GB, en-US;q=0.9, en;q=0.8'
      end

      it 'is used to set the current locale' do
        get :index

        expect(I18n.locale).to eq(:el)
      end

      it 'the finally selected locale is saved into session' do
        get :index

        expect(session[:locale]).to eq(:el)
      end
    end

    context 'when http accept language defines a locale which is not amongst the available' do
      before do
        @request.headers['HTTP_ACCEPT_LANGUAGE'] = 'fr'

        raise "'fr' should not be part of the available locales" if I18n.available_locales.include?(:fr)
      end

      it 'we set the current locale to whatever the default locale is' do
        default_locale = I18n.default_locale

        get :index

        expect(I18n.locale).to eq(default_locale)
      end

      it 'the finally selected locale is saved into session' do
        default_locale = I18n.default_locale

        get :index

        expect(session[:locale]).to eq(default_locale)
      end
    end

    context 'when http accept language does not define any locale' do
      before do
        @request.headers['HTTP_ACCEPT_LANGUAGE'] = nil
      end

      it 'we set the current locale to whatever the default locale is' do
        default_locale = I18n.default_locale

        get :index

        expect(I18n.locale).to eq(default_locale)
      end

      it 'the finally selected locale is saved into session' do
        default_locale = I18n.default_locale

        get :index

        expect(session[:locale]).to eq(default_locale)
      end
    end

    # TODO: We need more cases that would take into account the
    # current user and their locale preferences. or any URL that includes locale maybe
  end
end
