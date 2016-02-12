Rails.application.routes.draw do
  scope "(:locale)", locale: /en|pl/ do
    get '/:locale' => 'home#index'
    root to: 'home#index'
  end
end
