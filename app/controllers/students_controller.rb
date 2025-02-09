class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update]
  def index
    @students = Student.all
  end

  def show
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:notice] = 'You have successfully updated your profile'
      redirect_to @student
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = 'You have successfully signed up'
      redirect_to root_path
    else
      render 'new'

    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
