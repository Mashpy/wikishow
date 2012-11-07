class ActorsController < ApplicationController

	def index
		#@actors = Actor.search(params[:search], params[:page])
		@actors = Actor.page(params[:page]).search(params[:search])
		respond_to do |format|
			format.js
			format.html
		end
	end

	def show
		@actor = Actor.find(params[:id])
	end

end
