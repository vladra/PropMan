class CommentsController < ApplicationController
  # remember to add a filter here !!!!!!!!!!!!!!!!!!!
  def create
    @issue = Issue.find(params[:issue_id])
    @comment = @issue.comments.build(comment_params)
    # @comment.user_id = current_user.id
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
