Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root to: 'welcomes#index'

resources :sites
resources :pages , only: [:index]
resources :welcomes, only: [:index]

get '/payment', :to=>'pages#payment'
post 'pages/signup', :to=>'pages#signup'

post '/sites/pay', :to=>'sites#pay'

get 'demo_thanks', :to=>'welcomes#demo_thanks'
get 'policy', :to=>'welcomes#policy'
get 'rlt', :to=>'welcomes#rlt'
get 'lt', :to=>'welcomes#lt'

get '/reviews/:id', :to=>'reviews#show'
end
