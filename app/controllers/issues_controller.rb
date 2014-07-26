class IssuesController < ApplicationController
  before_action :authenticate_tenant!, only: [:create, :edit, :update]

  def index
    if current_tenant
      @issues = current_tenant.issues.order('created_at desc')
    elsif current_manager
      @issues = current_manager.issues.order('created_at desc')
    else
      redirect_to root_path
    end
  end

  def show
    @issue = Issue.find(params[:id])
    @comments = @issue.comments.order('created_at desc')
  end

  def new
    @issue = Issue.new
  end

  def create
  	@issue = Issue.new(issue_params)
    @issue.tenant = current_tenant
  	if @issue.save
  		redirect_to tenants_path, notice: "Issue successfully added!"
  	else
  		redirect_to tenants_path, alert: "Issue wasnt created"
  	end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])
    @issue.update_attributes(issue_params)
    redirect_to @issue
  end

  private

  def issue_params
  	params.require(:issue).permit(:title, :status, :completed_date, :message, :rating, :category_id)
  end

end
