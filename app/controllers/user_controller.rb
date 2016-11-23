class UserController < ApplicationController
respond_to :json
   
  # GET /users.json
  def index
    @users = User.all
    render json: @users
  end
 def show
 	    @user = User.find_by(macaddress: params[:macaddress])
    	render json: @user
 end
  # POST /users.json
 def create
    if User.exists?(user_params)
      render json: {'status': 'same'}
    else
       @user = User.new(user_params)
       if @user.save
      render json: {'status': 'success'}
       else
       render json: {'status':'error', 'errors':@user.errors}
       end
    end
  end
  def new
  	@user=User.new
  end 
  # PATCH/PUT /users/1.json
  def update
   if @user.update(user_params)
    respond_with({'status':'success'})
   else
    respond_with({'status':'error'})
   end
  end

 
  # DELETE /users/1.json
  def destroy
   @user.destroy
   respond_with({'status':'User deleted'})
  end
 
  def user_params
   params.require(:user).permit(:macaddress)
  end

end
