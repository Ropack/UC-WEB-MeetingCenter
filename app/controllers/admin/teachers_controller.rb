class Admin::TeachersController < Admin::AdminController
  before_action :set_admin_teacher, only: [:show, :edit, :update, :destroy]

  # GET /admin/teachers
  # GET /admin/teachers.json
  def index
    @admin_teachers = Teacher.all
  end

  # GET /admin/teachers/1
  # GET /admin/teachers/1.json
  def show
  end

  # GET /admin/teachers/new
  def new
    @admin_teacher = Teacher.new
  end

  # GET /admin/teachers/1/edit
  def edit
  end

  # POST /admin/teachers
  # POST /admin/teachers.json
  def create
    @admin_teacher = Teacher.new(admin_teacher_params)

    respond_to do |format|
      if @admin_teacher.save
        format.html { redirect_to [:admin, @admin_teacher], notice: 'Teacher was successfully created.' }
        #format.json { render :show, status: :created, location: @admin_teacher }
      else
        format.html { render :new }
        #format.json { render json: @admin_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/teachers/1
  # PATCH/PUT /admin/teachers/1.json
  def update
    respond_to do |format|
      if @admin_teacher.update(admin_teacher_params)
        format.html { redirect_to [:admin, @admin_teacher], notice: 'Teacher was successfully updated.' }
        #format.json { render :show, status: :ok, location: @admin_teacher }
      else
        format.html { render :edit }
        #format.json { render json: @admin_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/teachers/1
  # DELETE /admin/teachers/1.json
  def destroy
    @admin_teacher.destroy
    respond_to do |format|
      format.html { redirect_to admin_teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_teacher
      @admin_teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :email)
    end
end
