class ActorsController < ApplicationController

	def index
		@actors = Actor.search(params[:search])

	end

	def show
		@actor = Actor.find(params[:id])
	end


end
