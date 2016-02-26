Rails.application.routes.draw do
  get 'fights/create'

  get 'fights/show'

  get 'fights/new'

  scope "(:locale)", locale: /en|pl/ do
    root to: 'homepage#index'
    devise_for :users

    resources :fighters
    get 'fights/select_fighters', to: 'fights#select_fighters', as: 'select_fighters'
    resources :fights, only: [:new, :create, :show]
  end
end
