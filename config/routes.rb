Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  root "homes#index"

  resources :subjects

  resources :exams do
    resources :questions do
      resources :answers, only: [:new, :create, :edit, :update, :destroy]
      collection do
        get 'question_type'
        get 'all_questions'
      end
  
      get 'new_text_question', on: :new, to: 'questions#new_text_question'
    end
  end
end
