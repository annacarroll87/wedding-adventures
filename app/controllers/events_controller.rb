class EventsController < ApplicationController
  
  def index
  	@event = Event.new
  	@events = Event.all
	end

  def new
	  @event = Event.new
	end

	def create
    @event = Event.new(event_params)
		@event.save!
		@events = Event.all 
		render :index
	end

	def show
    load_show
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to action: 'index'
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to action:'index'
	end

	def create_snipit
		@snipit = Snipit.new(snipit_params)
		@event = Event.find(params[:id])
		@snipit.update(event: @event)
		load_and_render_show
	end

	def destroy_snipit
    @snipit = Snipit.find(params[:snipit])
    @snipit.destroy!
    load_and_render_show
  end

	private

	def event_params
    params.require(:event).permit(:name, :description, :image)
	end

	def snipit_params
		params.require(:snipit).permit(:description, :image)
	end

	def load_show
		@event = Event.find(params[:id])
    @events = Event.all
    @snipit = Snipit.new
    @snipits = Snipit.all
    @snipits = @event.snipits
	end

	def load_and_render_show
    load_show
    redirect_to action: :show
  end

end