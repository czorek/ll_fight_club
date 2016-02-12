Rails.application.routes.draw do
  scope "(:locale)", locale: /en|pl/ do
    get '/:locale' => 'homepage#index'
    root to: 'homepage#index'
  end
end
