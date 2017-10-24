class SurveysController < ApplicationController
  def index
  	#renders Survey (main) page
  end

  def result

  	#render the Dog Info page!

  	if params[:other_pets] == 'Yes'

  		@dog = Dog.find_by(size: params[:housing], energy_needs: params[:activity_level], grooming_per_month: params[:grooming], pet_compatibility: params[:other_pets], feed_cost_weekly: params[:food])

  		match_strength = 5;



  		unless @dog
	  		@dog = Dog.find_by(size: params[:housing], grooming_per_month: params[:grooming], pet_compatibility: params[:other_pets], feed_cost_weekly: params[:food])

	  		match_strength = 4;

  		#removed energy needs (for more looser match-- if none found)

  		end

  		unless @dog 
  			@dog = Dog.find_by(size: params[:housing], grooming_per_month: params[:grooming], pet_compatibility: params[:other_pets])
  			match_strength = 3;
  		# removed another param: feed costs (for more looser match-- if none found)
	  	end

	  	unless @dog
	  		@dog = Dog.find_by(size: params[:housing], pet_compatibility: params[:other_pets])
	  		match_strength = 2;
	  	end

  	else #no other pets at home, then search without that parameter (because it doesn't matter yes/no pet friendly):

  		@dog = Dog.find_by(size: params[:housing], energy_needs: params[:activity_level], grooming_per_month: params[:grooming], feed_cost_weekly: params[:food])

  		match_strength = 5;

  		unless @dog
  			@dog = Dog.find_by(size: params[:housing], grooming_per_month: params[:grooming], feed_cost_weekly: params[:food])

  			match_strength = 4;
  		end

  		unless @dog 
  			@dog = Dog.find_by(size: params[:housing], grooming_per_month: params[:grooming])

  			match_strength = 3;
  		end

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



  		response = RestClient::Request.execute(
	  		method: get,
	  		url: "https://dog.ceo/api/breed/#{name}/images/random"
	  			)
  			
  	end

  end
end
