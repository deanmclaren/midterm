class LikesController < ApplicationController
   before_action :authenticate_user!
   before_action :find_question

  def create
    @idea = Idea.find params[:idea_id]
    @like = @idea.likes.new
    @like.user = current_user

    if @like.save
      redirect_to @idea, notice: "Thank you for liking"
    else
      redirect_to @idea, alert: "You have already liked this silly pants"
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    if @like.destroy
      redirect_to @idea, "You have unliked"
    else
      redirect_to @idea, alert: "Couldn't unlike, you'll like it 4eva"
    end


  end


  def find_question
    @idea = Idea.find params[:idea_id]
  end


end
