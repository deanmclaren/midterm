# app/controllers/ideas_controller.rb
class IdeasController < ApplicationController
  def index
    @idea = Idea.all
  end

  def new
  end

  def create
    @idea = Idea.new(params.require(:idea).permit([:title, :body]))
    @idea.user = current_user
    if @idea.save
      redirect_to @idea
    else
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @comment = @idea.comments.all
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(params.require(:idea).permit([:title, :body]))
      redirect_to @idea
    else
      render :edit
    end
  end
end
