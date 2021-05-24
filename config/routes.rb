Rails.application.routes.draw do
  root "static_pages#home"#/static_pages/home
  get 'static_pages/help'
  get 'static_pages/about'

  
  
  # For details on the DSL available within sthis file, see https://guides.rubyonrails.org/routing.html
end
