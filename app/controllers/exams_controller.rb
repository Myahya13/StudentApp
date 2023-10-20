class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit]

  def index
    @exams = Exam.all
  end

  def new
    @exam = Exam.new
    @subject_id = params[:subject_id]
  end

  def create
    @exam = Exam.new(exam_params)
    @exam.user_id = current_user.id

    if @exam.save
      flash[:success] = "Exam created successfully"
      redirect_to exam_path(@exam)
    else
      flash[:error] = "Error Occurred"
      render :new
    end
  end

  def show
  end

  private

  def set_exam
    @exam = Exam.find_by(id: params[:id])
    if @exam.nil?
      flash[:error] = "Error Occurred"
    end
  end

  def exam_params
    params.require(:exam).permit(:title, :description, :marks, :show_exam, :subject_id)
  end
end

  