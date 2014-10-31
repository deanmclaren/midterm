class LikesController < ApplicationController
   before_action :authenticate_user!

  def create
    @idea = Idea.find params[:idea_id]
    @like = @idea.likes.new
    @like.user = current_user

    if @like.save
      redirect_to @idea, notice: "Thank you for liking"
    else
      redirect_to @idea, alert: "Your like could not be saved"
    end
  end

  def destroy
  end
end
