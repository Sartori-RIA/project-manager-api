# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    resources :projects do
      scope module: :projects do
        resources :activities
      end
      collection do
        get 'search' => 'projects#search'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
