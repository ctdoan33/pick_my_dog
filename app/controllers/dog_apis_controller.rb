class DogApisController < ApplicationController
	def all
		@all = DogApi.all
		render json: @all
	end

	def breed
		@breed = DogApi.find_by(breed: params["breed"])
		render json: @breed
	end

	def size
		@size = DogApi.where(size: params["size"])
		render json: @size
	end

	def group
		@group = DogApi.where(group: params["group"])
		render json: @group
	end

	def origin
		@origin = DogApi.where("origin LIKE ?", "%"+params["origin"]+"%")
		render json: @origin
	end

	def role
		@role = DogApi.where("role LIKE ?", "%"+params["role"]+"%")
		render json: @role
	end
end
