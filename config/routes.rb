Rails.application.routes.draw do
  get 'results/show'
  # ユーザー画面
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations',
  }
  scope '/' do
    root to: 'top#index'
  end

  resources :rooms do
    resources :messages
    resources :games, only: [:index, :show, :update] do
      resources :hands, only: [:new, :create]
      get 'result', to: 'results#show'
    end
  end

  # 管理画面
  devise_for :admin_users, path: :admin, controllers: {
    sessions: 'admin/admin_users/sessions',
    passwords: 'admin/admin_users/passwords',
  }
  namespace :admin do
    root to: 'admin_users#index'

    resources :admin_users do
      collection do
        get :password
        patch :password_update
      end
    end
    resources :users
  end

  # 送信メール (development only)
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
