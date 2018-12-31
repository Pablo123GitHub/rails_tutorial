Rails.application.routes.draw do
  root "static_charts#home"
  get 'static_charts/home'
  get 'static_charts/help'
  get 'static_charts/about'
  get 'static_charts/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
