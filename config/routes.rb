Rails.application.routes.draw do

  root 'surveys#index'

  get 'result' => 'surveys#result'

  
end
