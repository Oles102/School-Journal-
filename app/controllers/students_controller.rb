class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy]

  def index
    @students = Student.where(school_id: params[:school_id], school_class_id: params[:school_class_id])
    render json: @students
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      # token = TokenService.generate_token(student_id: @student.id)
      render json: { student: @student }, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @student
  end

  def destroy
    @student.destroy
    head :no_content
  end

  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Student not found" }, status: :not_found
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :school_class_id, :school_id)
  end
end
