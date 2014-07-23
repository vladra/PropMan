class CommentsController < ApplicationController

  def new
  	@comment = Comment.new
  end

  def create
  	@comment = Comment.new(comment_params)
  	if @comment.save
  		redirect_to issue_path
  	else
  		render :new
  end

  def destroy
  	@comment = @comment.find(params[:id])
  	@comment.delete
  	redirect_to issue_path
  end

  private

  def comment_params
  	params.require(:commet).permit(:message, :user_id, :issue_id)
  end

end
