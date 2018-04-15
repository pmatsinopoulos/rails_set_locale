# frozen_string_literal: true

class ApplicationController < ActionController::Base
end

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      head :ok
    end
  end

  it 'x' do
    get :index

    expect(response.status).to eq(200)
  end
end
