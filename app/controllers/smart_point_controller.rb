class SmartPointController < ApplicationController
respond_to :json
   
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
    if SmartPoint.exists?(sp_params)
      render json: {'status': 'same'}
    else
       @sp = SmartPoint.new(sp_params)
       if @sp.save
      render json: {'status': params}
       else
       render json: {'status':'error', 'errors':@user.errors}
       end
    end
   UserSmartPoint.create(:user_mac => params[:smart_point][:user_mac], :spoint_mac =>params[:smart_point][:macaddress], :date => DateTime.now)
  end
  def new
  	@sp=SmartPoint.new
  end 
  def getUserMacAddress
    params.require(:smart_point).permit(:user_mac)
  end
  def getSPMacAddres
    params.require(:smart_point).permit(:macaddress)
  end
  def sp_params
   params.require(:smart_point).permit(:macaddress,:name,:lat,:long)
  end

end
