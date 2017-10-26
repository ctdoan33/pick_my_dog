Rails.application.routes.draw do

  root 'surveys#index'

  get 'result' => 'surveys#result'

  get 'shelter' => 'surveys#shelter'

  
end
