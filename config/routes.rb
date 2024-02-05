Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "schools#index"

  resources :students, only: [:create, :index, :show] do
    post 'students',  to:'students#create'
  end

  resources :schools, only: [:index, :show, :create, :update, :destroy] do
    resources :classes, only: [:index, :show, :create, :update, :destroy] do
      get 'students', to: 'classes#get_class_students', on: :member
    end
  end
end
