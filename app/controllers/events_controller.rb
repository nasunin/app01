class EventsController < ApplicationController
	before_action :signed_in_user

	def show
		@event = Event.find(params[:id])
	end

	def new
    @event = Event.new
	end

  def create
  	@user = current_user
  	#				User.find_by(email_for_index: params[:email_for_index])
    @event = Event.new(event_params)
		@event.usercd = @user.usercd
		@event.branchnum = 1

    if @event.save
      flash[:success] = "event controller create flash"
      redirect_to @event
    else
      render 'new'
    end
  end

	def update
	end

	def search
	end

  private
    def event_params
      params.require(:event).permit(:subject, :description, :typeno,
      	:key1, :key2, :key3, :key4, :key5, :usercd, :branchnum, :imageid,
      	:public_date, :end_date, :prefecturecd)
    end
end
