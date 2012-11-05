class ActorsController < ApplicationController

	def index
		@actors = Actor.order(:name)
	end

	def show
		@actor = Actor.find(params[:id])
	end


end
