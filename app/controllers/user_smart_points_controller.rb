class UserSmartPointsController < ApplicationController
  before_action :set_user_smart_point, only: [:show, :edit, :update, :destroy]

  # GET /user_smart_points
  # GET /user_smart_points.json
  def index
    @user_smart_points = UserSmartPoint.all
    render json: @user_smart_points
  end

  # GET /user_smart_points/1
  # GET /user_smart_points/1.json
  def show

  end
  def maps
    user = User.first.macaddress
    if (user==nil)
      render text: "No hay usuarios"
    else
      @spmacs=UserSmartPoint.where(user_mac: user).collect{|x| x.spoint_mac}
      @points=SmartPoint.where(macaddress: @spmacs)
      @hash = Gmaps4rails.build_markers(@points) do |point, marker|
        marker.lat point.lat
        marker.lng point.long
        marker.infowindow point.name
      end
    end
  end

  # GET /user_smart_points/new
  def new
    @user_smart_point = UserSmartPoint.new
  end

  # GET /user_smart_points/1/edit
  def edit
  end

  # POST /user_smart_points
  # POST /user_smart_points.json
  def create
    @user_smart_point = UserSmartPoint.new(user_smart_point_params)

    respond_to do |format|
      if @user_smart_point.save
        format.html { redirect_to @user_smart_point, notice: 'User smart point was successfully created.' }
        format.json { render :show, status: :created, location: @user_smart_point }
      else
        format.html { render :new }
        format.json { render json: @user_smart_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_smart_points/1
  # PATCH/PUT /user_smart_points/1.json
  def update
    respond_to do |format|
      if @user_smart_point.update(user_smart_point_params)
        format.html { redirect_to @user_smart_point, notice: 'User smart point was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_smart_point }
      else
        format.html { render :edit }
        format.json { render json: @user_smart_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_smart_points/1
  # DELETE /user_smart_points/1.json
  def destroy
    @user_smart_point.destroy
    respond_to do |format|
      format.html { redirect_to user_smart_points_url, notice: 'User smart point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_smart_point
      @user_smart_point = UserSmartPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_smart_point_params
      params.require(:user_smart_point).permit(:user_mac, :spoint_mac, :date)
    end
end
