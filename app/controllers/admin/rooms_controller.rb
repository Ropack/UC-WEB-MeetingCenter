class Admin::RoomsController < Admin::AdminController
  before_action :set_admin_room, only: [:edit, :update, :destroy]

  # GET /admin/rooms/new
  def new
    @admin_room = Room.new(building_id: params[:building_id])
  end

  # GET /admin/rooms/1/edit
  def edit
  end

  # POST /admin/rooms
  # POST /admin/rooms.json
  def create
    p = admin_room_params
    p[:building_id] = params[:building_id]
    @admin_room = Room.new(p)

    respond_to do |format|
      if @admin_room.save
        format.html { redirect_to [:admin, @admin_room.building], notice: 'Room was successfully created.' }
        # format.json { render :show, status: :created, location: @admin_room.building }
      else
        format.html { render :new }
        # format.json { render json: @admin_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/rooms/1
  # PATCH/PUT /admin/rooms/1.json
  def update
    respond_to do |format|
      if @admin_room.update(admin_room_params)
        format.html { redirect_to [:admin, @admin_room.building], notice: 'Room was successfully updated.' }
        # format.json { render :show, status: :ok, location: @admin_room }
      else
        format.html { render :edit }
        # format.json { render json: @admin_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/rooms/1
  # DELETE /admin/rooms/1.json
  def destroy
    @admin_room.destroy
    respond_to do |format|
      format.html { redirect_to admin_building_path(params[:building_id]), notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_room
      @admin_room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_room_params
      params.require(:room).permit(:title, :code)
    end
end
