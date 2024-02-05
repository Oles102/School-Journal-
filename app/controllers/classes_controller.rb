class ClassesController < ApplicationController
  before_action :set_school
  before_action :set_class, only: [:show, :update, :destroy, :get_class_students]
  def index
    @classes = @school.school_classes
    render json: @classes
  end
  def show
    render json: @class
  end

  def create
    @class = @school.school_classes.new(class_params)

    if @class.save
      render json: @class, status: :created
    else
      render json: @class.errors, status: :unprocessable_entity
    end
  end
  def update
    if @class.update(class_params)
      render json: @class
    else
      render json: @class.errors, status: :unprocessable_entity

    end
  end
  def destroy
    @class.destroy
  end

  def get_class_students
    if @class
      @students = @class.students
      render json: @students
    else
      render json: {error: "Class not found"}, status: :not_found
    end
  end


  private
  def set_school
    @school = School.find(params[:school_id])
  end

  def set_class
    @class = @school.school_classes.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    @class = nil
  end

  def class_params
    params.require(:school_class).permit(:number, :letter, :students_count)
  end
end
