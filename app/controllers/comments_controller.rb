class CommentsController < ApplicationController

  def create
    @issue = Issue.find(params[:issue_id])
    @comment = @issue.comments.build(comment_params)
    if current_tenant
      @comment.commentable = current_tenant
    elsif current_manager
      @comment.commentable = current_manager
    end
    if @comment.save
      redirect_to @issue
    else
      render issues_path(@issue)
    end
  end

  private

  def comment_params
  	params.require(:comment).permit(:message)
  end

end
