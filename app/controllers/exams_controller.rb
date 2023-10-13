class ExamsController < ApplicationController

    def index
        @exams = Exam.all
       
    end

    def new
        @exam = Exam.new
        @subject_id = params[:subject_id]
    end
    def create
        @exam = Exam.new(exam_params)
        @exam.subject_id = params[:subject_id]
        @exam.user_id = current_user.id
        if @exam.save
            redirect_to exam_path(@exam)
         else
          puts("Error occured")
        end
    end 

    def show
        @exam = Exam.find(params[:id])
    end

    def edit
        @exam = Exam.find(params[:id])
    end

    private

    def exam_params
        params.require(:exam).permit(:title,:description,:marks,:show_exam,:subject_id)
    end
end