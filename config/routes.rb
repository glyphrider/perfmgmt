Rails.application.routes.draw do
  root 'direct_reports#redirect'
  resources :direct_reports do
    resources :meetings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
