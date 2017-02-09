Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, controllers: {sessions: "users/sessions",
    registrations: "users/registrations"}

  root to: "home#index"

  resources :answers do
    post '/up_vote', to: 'answers#up_vote'
    post '/down_vote', to: 'answers#down_vote'
  end

  resources :questions do
    post '/up_vote', to: 'questions#up_vote'
    post '/down_vote', to: 'questions#down_vote'
  end


  resources :comments do
    post '/up_vote', to: 'comments#up_vote'
    post '/remove_vote', to: 'comments#remove_vote'
  end


  resources :users do

  end
end
