class SnipitsController < ApplicationController
	
	

	def create
		@snipit = Snipit.create(snipit_params)
		render event_path(@snipit.event)
	end

	def edit 
	end 

	def destroy
		@snipit = Snipit.find(params[:id])
		@snipit.destroy
	end

	private

	def snipit_params
		params.require(:snipit).permit(:description, :image)
	end

end