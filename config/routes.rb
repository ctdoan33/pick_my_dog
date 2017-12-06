Rails.application.routes.draw do

  root 'surveys#index'

  get 'result' => 'surveys#result'

  get 'shelter/:dog_id/:location' => 'surveys#shelter'

  get 'shelters/:id' => 'surveys#shelters'

  get 'dog_api/all' => 'dog_apis#all'

  get 'dog_api/breed/:breed' => 'dog_apis#breed'

  get 'dog_api/size/:size' => 'dog_apis#size'

  get 'dog_api/group/:group' => 'dog_apis#group'

  get 'dog_api/origin/:origin' => 'dog_apis#origin'

  get 'dog_api/role/:role' => 'dog_apis#role'
end
