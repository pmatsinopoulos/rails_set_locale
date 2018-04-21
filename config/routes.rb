# frozen_string_literal: true

RailsSetLocale::Engine.routes.draw do
  root to: 'locale#set_locale'
end
