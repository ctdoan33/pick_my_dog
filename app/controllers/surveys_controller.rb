class SurveysController < ApplicationController
  

  def index
  	#renders Survey (main) page

# PETFINDER API :
#   	API Key
# f34ee08273312bdea551fefa54ad6426
# API Secret
# 37975bcc692575b169c4c2ea3d442d74

  end

  def result

  	#render the Dog Info page!
  	flash[:errors] = []

  	if params[:zip].length == 5
  		@location = params[:zip]

  	elsif (params[:city].length > 1) && params[:state]
  		@location = params[:city] +" "+ params[:state]

  	else 

  		flash[:errors].push("You must fill out either **zip code** OR **city and state**") 
  	end


  	unless params[:size] && params[:activity] && params[:grooming] && params[:friendly] && params[:novice]
  		
  		flash[:errors].push("You must fill out each entry") 
  	end


  	#binding.pry

  	unless flash[:errors].empty?
  		redirect_to '/'
  	end





  	@dogs = Survey.all

  	if params[:novice] == "true"
  		@dogs= @dogs.where(novice: true)
  	end

  	if params[:friendly] == "true"
  		@dogs= @dogs.where(friendly: true)
  	end
  	match_strength = 2


  	temp = @dogs.where(size: params[:size])
  	unless temp.empty?
  		@dogs = temp
  		match_strength = 3

		temp = @dogs.where(activity: params[:activity])
		unless temp.empty?
			@dogs = temp
			match_strength = 4

			temp = @dogs.where(grooming: params[:grooming])
			unless temp.empty?
				@dogs = temp
				match_strength = 5
			end
		end
  	end


  	@dog = @dogs.first
  	# use a switch statement to build your string!

  	case match_strength
  	when 5
  		@match = "Perfect Match! Your survey scored a 5/5 match for #{ @dog.breed}!"
  	when 4
  		@match = "Good Match! Your survey scored a 4/5 match for #{ @dog.breed}!"
  	when 3 
  		@match = "O.K. Match! Your survey scored a 3/5 match for #{ @dog.breed}!"
  	when 2
  		@match = "Shaky Match! Your survey scored a 2/5 match for #{ @dog.breed}!"
  	end 


  		
  	# API Call for Animal Photos

  		response = RestClient::Request.execute(
	  		method: 'get',
	  		url: "https://dog.ceo/api/breed/#{@dog.pic_name}/images/random"
	  			)

  		@hash = ActiveSupport::JSON.decode(response) 
  			


  end

  def shelter
  	#display shelter template
  	@dog = Survey.find(params[:dog_id])

  	response = RestClient::Request.execute(
  			method: 'get',
  			url: "http://api.petfinder.com/pet.find?key=f34ee08273312bdea551fefa54ad6426&location=#{params[:location]}&breed=#{@dog.shelter_name}&count=10&format=json")

  	@pets = ActiveSupport::JSON.decode(response)['petfinder']['pets']['pet']

  	if !@pets
      flash[:notice] = "Bummer!! Currently no shelter information for this dog breed :( "
    end

  end

  def shelters
  	response = RestClient::Request.execute(
  		method: 'get',
  		url: "http://api.petfinder.com/shelter.get?key=f34ee08273312bdea551fefa54ad6426&id=#{params[:id]}&format=json")
  	@shelter = ActiveSupport::JSON.decode(response)['petfinder']['shelter']
  	render json: @shelter
  end

end
