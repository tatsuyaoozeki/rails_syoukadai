Rails.application.routes.draw do
  # get '/contacts', to:'contacts#index'
  resources :contacts
  # get '/blogs',blog.to:'blogs#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
