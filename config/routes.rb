Rails.application.routes.draw do

  root 'surveys#index'

  get 'result' => 'surveys#result'

  get 'shelter/:dog_id/:location' => 'surveys#shelter'

  get 'shelters/:id' => 'surveys#shelters'
end
