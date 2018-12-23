class Admin::CoursesController < Admin::AdminController
  before_action :set_admin_course, only: [:show, :edit, :update, :destroy]

  # GET /admin/courses
  # GET /admin/courses.json
  def index
    @admin_courses = Course.all
  end

  # GET /admin/courses/1
  # GET /admin/courses/1.json
  def show
    @lessons = @admin_course.lessons.includes(:teacher, :room)
    @teacher_assignment = TeacherAssignment.new
    @student_assignment = StudentAssignment.new
  end

  # GET /admin/courses/new
  def new
    @admin_course = Course.new
  end

  # GET /admin/courses/1/edit
  def edit
  end

  # POST /admin/courses
  # POST /admin/courses.json
  def create
    @admin_course = Course.new(admin_course_params)

    respond_to do |format|
      if @admin_course.save
        format.html { redirect_to [:admin, @admin_course], notice: 'Course was successfully created.' }
        #format.json { render :show, status: :created, location: @admin_course }
      else
        format.html { render :new }
        #format.json { render json: @admin_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/courses/1
  # PATCH/PUT /admin/courses/1.json
  def update
    respond_to do |format|
      if @admin_course.update(admin_course_params)
        format.html { redirect_to [:admin, @admin_course], notice: 'Course was successfully updated.' }
        #format.json { render :show, status: :ok, location: @admin_course }
      else
        format.html { render :edit }
        #format.json { render json: @admin_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/courses/1
  # DELETE /admin/courses/1.json
  def destroy
    @admin_course.destroy
    respond_to do |format|
      format.html { redirect_to admin_courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_teacher
    assignment = TeacherAssignment.find_or_create_by(teacher_params)

    respond_to do |format|
      if assignment.save
        format.html { redirect_to [:admin, assignment.course], notice: 'Teacher was successfully added.' }
      else
        format.html { render :show }
      end
    end
  end

  def remove_teacher
    TeacherAssignment.find_by(course_id: params[:id], teacher_id: params[:teacher_id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_course_url(params[:id]), notice: 'Teacher was successfully removed.' }
    end
  end

  def add_student
    assignment = StudentAssignment.find_or_create_by(student_params)

    respond_to do |format|
      if assignment.save
        format.html { redirect_to [:admin, assignment.course], notice: 'Student was successfully added.' }
      else
        format.html { render :show }
      end
    end
  end

  def remove_student
    StudentAssignment.find_by(course_id: params[:id], student_id: params[:student_id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_course_url(params[:id]), notice: 'Student was successfully removed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_course
      @admin_course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_course_params
      params.require(:course).permit(:code, :title, :language, :study_type)
    end

    def teacher_params
      p = params.require(:teacher_assignment).permit(:teacher_id)
      p[:course_id] = params[:id]
      p
    end

    def student_params
      p = params.require(:student_assignment).permit(:student_id)
      p[:course_id] = params[:id]
      p
    end
end
