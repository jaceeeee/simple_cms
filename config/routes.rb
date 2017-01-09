Rails.application.routes.draw do    

  root :to => 'public#index'
  
  get 'show/:permalink', :to => 'public#show', :as => 'public_show'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :subjects do
    member do
      get :delete
    end
  end
  
  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  resources :admin_users, :except => [:show] do
    member do
      get :delete
    end
  end

  get 'welcome/index'
  get 'welcome/hello'

  get 'gobble/home'

  # match 'demo/index', :to => 'demo#index', :via => :get
  get 'demo/index'
  # match 'demo/hello', :to => 'demo#hello', :via => :get
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/sais'

  get 'demo/escape_output'
  # default routing 
  # may change in later versions
  # get '/:controller(/:action(/:id))'
  # or
  # match '/:controller(/:action(/:id))', :via => :get

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
