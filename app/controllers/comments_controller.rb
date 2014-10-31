# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  def create
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.new(params.require(:comment).permit([:body]))
    if @comment.save
      redirect_to @idea
    else
      render @idea
    end
  end
end
