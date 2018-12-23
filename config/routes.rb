Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
    resources :buildings do
      resources :rooms, except: [:index]
    end
    resources :courses do
      member do
        post 'add_teacher'#, to: 'courses#add_teacher', as: 'add_teacher'
        delete 'remove_teacher/:teacher_id', to: 'courses#remove_teacher', as: 'remove_teacher'
        post 'add_student'
        delete 'remove_student/:student_id', to: 'courses#remove_student', as: 'remove_student'
      end
      resources :lessons
    end
    resources :teachers
    resources :students
    root to: 'dashboard#index'

  end

  #get 'buildings/:building_id/rooms', to: 'rooms#index', as: :rooms
  #get 'buildings/:building_id/rooms/:id', to: 'rooms#show', as: :room
  resources :buildings, only: [:index, :show] do
    resources :rooms, only: [:index, :show]
  end

  get 'contact', to: 'contact#index', as: 'contact'
  root to: 'buildings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
