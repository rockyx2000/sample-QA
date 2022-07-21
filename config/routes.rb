Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "questions#index"
  resources :questions do
    resources :answers

  get "/answer/form/:question_id" => "answers#answers_form", as: :get_form 
  end
end
