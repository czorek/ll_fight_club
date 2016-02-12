Rails.application.routes.draw do
  scope "(:locale)", locale: /en|pl/ do
    root to: 'homepage#index'
  end
end
