class Admin::BuildingsController < Admin::AdminController
  before_action :set_admin_building, only: [:show, :edit, :update, :destroy]

  # GET /admin/buildings
  # GET /admin/buildings.json
  def index
    @admin_buildings = Building.all
  end

  # GET /admin/buildings/1
  # GET /admin/buildings/1.json
  def show
    @rooms = Room.by_building_id(params[:id])
  end

  # GET /admin/buildings/new
  def new
    @admin_building = Building.new
  end

  # GET /admin/buildings/1/edit
  def edit
  end

  # POST /admin/buildings
  # POST /admin/buildings.json
  def create
    @admin_building = Building.new(admin_building_params)

    respond_to do |format|
      if @admin_building.save
        format.html {redirect_to [:admin, @admin_building], notice: 'Building was successfully created.'}
        format.json {render :show, status: :created, location: @admin_building}
      else
        format.html {render :new}
        format.json {render json: @admin_building.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /admin/buildings/1
  # PATCH/PUT /admin/buildings/1.json
  def update
    respond_to do |format|
      if @admin_building.update(admin_building_params)
        format.html {redirect_to [:admin, @admin_building], notice: 'Building was successfully updated.'}
        format.json {render :show, status: :ok, location: @admin_building}
      else
        format.html {render :edit}
        format.json {render json: @admin_building.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /admin/buildings/1
  # DELETE /admin/buildings/1.json
  def destroy
    @admin_building.destroy
    respond_to do |format|
      format.html {redirect_to admin_buildings_url, notice: 'Building was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_building
    @admin_building = Building.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_building_params
    params.require(:building).permit(:title, :code)
  end
end
