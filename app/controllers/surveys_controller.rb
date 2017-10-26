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
  		location = params[:zip]

  	elsif (params[:city].length > 1) && params[:state]
  		location = params[:city] + params[:state]

  	else 

  		flash[:errors].push("You must fill out either **zip code** OR **city and state**") 
  	end


  	if params[:housing] && params[:activity_level] && params[:grooming] && params[:other_pets] && params[:food]
  		

  	else

  		flash[:errors].push("You must fill out each entry") 
  	end


  	#binding.pry

  	unless flash[:errors].empty?
  		redirect_to '/'
  	end



  	
  	# use a switch statement to build your string!

  	unless @dog # if no dog returned
  		match_strength = 0;
  	end 


  	case match_strength
  	when 5
  		@match = "Perfect Match! Your survey scored a 5/5 match for #{ @dog.breed}!"
  	when 4
  		@match = "Good Match! Your survey scored a 4/5 match for #{ @dog.breed}!"
  	when 3 
  		@match = "O.K. Match! Your survey scored a 3/5 match for #{ @dog.breed}!"
  	when 2
  		@match = "Shaky Match! Your survey scored a 2/5 match for #{ @dog.breed}!"
  	else
  		@match = "Sorry! We tried (seriously...)! But your results did not match from our pool of pups. Good luck in your doggie search."
  	end 


  	if @dog 
  	#if dog obj returned, save its breed name to a variable 'name'. Make API call with var name interpolated into it. Grab random image of that breed.

  		if @dog.breed == "Chihuahua"
  			name = "chihuahua"
  		elsif @dog.breed == "Boston Terrier"
  			name = "bulldog/boston"
  		elsif @dog.breed == "Pomeranian"
  			name = "pomeranian"
  		elsif @dog.breed == "Boxer"
  			name = "boxer"
  		elsif @dog.breed == "Schnauzer"
  			name = "schnauzer/giant"
  		elsif @dog.breed == "Mastiff"
  			name = "mastiff/bull"
        elsif @dog.breed == "Cardigan Welsh Corgi"
  			name = "corgi/cardigan"
  		elsif @dog.breed == "German Shepherd"
  			name = "germanshepherd"
  		elsif @dog.breed == "Bloodhound"
  			name = "hound/blood"
  		elsif @dog.breed == "Coonhound"
  			name = "coonhound"
  		elsif @dog.breed == "Dashund"
  			name = "dachshund"
  		end


  		
  	# API Call for Animal Photos

  		response = RestClient::Request.execute(
	  		method: 'get',
	  		url: "https://dog.ceo/api/breed/#{name}/images/random"
	  			)

  		@hash = ActiveSupport::JSON.decode(response) 
  			

  	# API Call for SHELTER PETS

  		shelters = RestClient::Request.execute(
  			method: 'get',
  			url: "http://api.petfinder.com/pet.find?key=f34ee08273312bdea551fefa54ad6426&breed=#{name}")

  		# http://api.petfinder.com/pet.find?key=f34ee08273312bdea551fefa54ad6426&location=95110&breed=Chihuahua&format=json
  		# # give us pet name/breed/pics
  		# #shelter id too

  		# CA2251

  		# http://api.petfinder.com/shelter.get?key=f34ee08273312bdea551fefa54ad6426&id=CA2251



  		
  	end

  end

  def shelter
  	#display shelter template
  end


end
