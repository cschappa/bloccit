Rails.application.routes.draw do

  devise_for :users
  
  resources :topics do 
    resources :posts, except: [:index] do
      #the following line is equivalent to post 'summary' => 'summaries#create'
      resources :summaries, only: [:create]
      get 'summary' => 'summaries#show'
      get 'summary/new' => 'summaries#new'
      
    end
  end

  get 'about' => 'welcome#about'



  root to: 'welcome#index'

end
