Rails.application.routes.draw do
  root 'site#index'

  get '/about' => 'site#about'
  get '/privacy' => 'site#privacy'
  get '/terms' => 'site#terms'
  get '/contact' => 'inquiries#new'
  post '/contact' => 'inquiries#create'
end
