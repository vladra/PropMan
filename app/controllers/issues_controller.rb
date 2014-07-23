class IssuesController < ApplicationController

  # def index
  # 	@issues = Issue.all
  # end

  def new
  	@issue = Issue.new
  end

  def create
  	@issue = Issue.new(issue_params)
  	if @issue.save
  		redirect_to tenant_path
  	else
  		render :new
  	end
  end

  def show
  	@issue = Issue.find(params[:id])
  end

  private

  def issue_params
  	params.require(:issue).permit(:title, :status, :completed_date, :message, :rating, :tenant_id)
  end

end
