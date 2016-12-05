class SmartPointController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token

  # GET /users.json
  def index
    @sp = SmartPoint.all
    render json: @sp
  end
 def show
 	@sp = SmartPoint.find_by(macaddress: params[:macaddress])
    render json: @sp
 end
  # POST /users.json
 def create
    if SmartPoint.exists?(:macaddress => params[:macaddress])
      #UserSmartPoint.create(:user_mac => params[:user_mac], :spoint_mac =>params[:macaddress], :date => DateTime.now)
      render json: {'status': 'same'}
    else
        @sp = SmartPoint.new()
        @sp.macaddress= params[:macaddress]
        @sp.name= params[:name]
   #     @sp.lat= params[:lat]
    #    @sp.long= params[:long]
        if @sp.save
       #   @usp=UserSmartPoint.new
        #  @usp.user_mac=params[:user_mac]
         # @usp.spoint_mac=params[:macaddress]
          #@usp.date=DateTime.now
          #if @usp.save
            render json: {'status': 'success punto y user punto'}
        #  else 
         #   render json: {'status':'error', 'errors':@user.errors}
          #end
        else
          render json: {'status':'error', 'errors':@user.errors}
        end
    end
  end
  def new
  	@sp=SmartPoint.new
  end 


end
