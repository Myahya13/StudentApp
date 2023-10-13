class SubjectsController < ApplicationController
    def index
      @subjects = Subject.all
    end
  
    def new
      @subject = Subject.new
    end
  
    def create
      @subject = Subject.new(subject_params)
      @subject.user_id = current_user.id
      if @subject.save
        redirect_to subject_path(@subject)
      else
        render :new
      end
    end
  
    def show
      @subject = Subject.find_by(id: params[:id])
      if @subject.nil?
        flash[:error] = "Subject Not Found"
      end
    end
  
    private
  
    def subject_params
      params.require(:subject).permit(:title, :description)
    end
end
  