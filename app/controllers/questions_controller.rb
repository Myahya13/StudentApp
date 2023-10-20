class QuestionsController < ApplicationController
  before_action :find_action, only: [:show, :edit, :update]
  before_action :set_exam
  
  def index
    @exam = Exam.find(params[:exam_id])
    @questions = @exam.questions
  end
  def all_questions
    @questions = Question.all
  end
  def new
    @exam_id = params[:exam_id]
    @question = Question.new
    4.times { @question.answers.build }
  end

  def new_text_question
    @exam_id = params[:exam_id]
    @question = Question.new(question_type: 'text', exam: @exam)
    @question.answers.build
  end

  def create
    @exam = Exam.find(params[:exam_id])
    @question = Question.new(question_params)
    if @question.save
      redirect_to exam_question_path(@exam, @question)
    else 
      flash[:error] = "Exam was not created Successfully"
    end
  end

  def show
    @question = Question.includes(:answers).find(params[:id])
  end

  def destroy
   @exam = Exam.find(params[:exam_id])
  @question = @exam.questions.find(params[:id])
    if @question
      @question.destroy
      redirect_to exam_path(@exam)
    end
  end

  def question_type
    @exam = Exam.find(params[:exam_id])
    if params[:question_type].present?
      if params[:question_type] == 'mcq'
        redirect_to new_exam_question_path(@exam)
      elsif params[:question_type] == 'text'
        redirect_to new_text_question_new_exam_question_path(@exam)
      else
      flash[:error]="No type defined"
      end
    else
    end
  end

  private

  def find_action
    @question = Question.find_by(id: params[:id])
  end

  def set_exam
    @exam = Exam.find_by(id: params[:id])
  end

  def question_params
    params.require(:question).permit(:question_text, :exam_id, :question_type, answers_attributes: [:content, :correct])
  end
end

  