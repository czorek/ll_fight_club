Rails.application.routes.draw do
  scope "(:locale)", locale: /en|pl/ do
    root to: 'homepage#index'
    devise_for :users
  end
end
