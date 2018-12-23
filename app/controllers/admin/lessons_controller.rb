class Admin::LessonsController < Admin::AdminController
  before_action :set_admin_lesson, only: [:show, :edit, :update, :destroy]

  # GET /admin/lessons
  # GET /admin/lessons.json
  def index
    @admin_lessons = Lesson.all
  end

  # GET /admin/lessons/1
  # GET /admin/lessons/1.json
  def show
  end

  # GET /admin/lessons/new
  def new
    @admin_lesson = Lesson.new(course_id: params[:course_id])
  end

  # GET /admin/lessons/1/edit
  def edit
  end

  # POST /admin/lessons
  # POST /admin/lessons.json
  def create
    @admin_lesson = Lesson.new(admin_lesson_params)

    respond_to do |format|
      if @admin_lesson.save
        format.html { redirect_to [:admin, @admin_lesson.course, @admin_lesson], notice: 'Lesson was successfully created.' }
        #format.json { render :show, status: :created, location: @admin_lesson }
      else
        format.html { render :new }
        #format.json { render json: @admin_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/lessons/1
  # PATCH/PUT /admin/lessons/1.json
  def update
    respond_to do |format|
      if @admin_lesson.update(admin_lesson_params)
        format.html { redirect_to [:admin, @admin_lesson.course, @admin_lesson], notice: 'Lesson was successfully updated.' }
        #format.json { render :show, status: :ok, location: @admin_lesson }
      else
        format.html { render :edit }
        #format.json { render json: @admin_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/lessons/1
  # DELETE /admin/lessons/1.json
  def destroy
    @admin_lesson.destroy
    respond_to do |format|
      format.html { redirect_to @admin_lesson.course, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_lesson
      @admin_lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_lesson_params
      p = params.require(:lesson).permit(:start_at, :end_at, :room_id, :teacher_id)
      p[:course_id] = params[:course_id]
      p
    end
end
