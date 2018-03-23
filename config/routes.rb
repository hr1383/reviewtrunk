Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root to: 'welcomes#index'

resources :sites


# get '/pages/pay', :to=>'pages#pay'

get '/payment', :to=>'pages#payment'
# get '/thanks', :to=>'pages#thanks'
post '/sites/pay', :to=>'sites#pay'
post 'pages/signup', :to=>'pages#signup'

resources :pages , only: [:index]

get 'demo_thanks', :to=>'welcomes#demo_thanks'
get 'policy', :to=>'welcomes#policy'
resources :welcomes, only: [:index]

end
