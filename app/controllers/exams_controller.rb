class ExamsController < ApplicationController
    before_action :set_exam, only: [:show, :edit]
  
    def index
      @exams = Exam.all
    end
  
    def new
      @exam = Exam.new
      Exam.new(subject_id: params[:subject_id])
    end
  
    def create
      @exam = Exam.new(exam_params)
      @exam.subject_id = params[:subject_id]
      @exam.user_id = current_user.id
      if @exam.save
        flash[:success] = "Exam created successfully"
        redirect_to exams_path(@exam)
      else
        flash[:error] = "Exam was not saved"
        render :new
      end
    end 
  
    def show
    end
  
    def edit
    end
  
    private
  
    def set_exam
      @exam = Exam.find_by(id: params[:id])
      if @exam.nil?
        flash[:error] = "Exam not found"
      end
    end
  

    def exam_params
        params.require(:exam).permit(:title, :description, :marks, :show_exam, :subject_id) 
    end
end