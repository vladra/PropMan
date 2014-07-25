class IssuesController < ApplicationController
  # before_action :authenticate_user!, only: [:create, :edit, :update]

  def index
    if current_tenant
      @issues = Issue.where(tenant: current_tenant)
    elsif current_manager

    else
      redirect_to 'root', flash: "BS"
    end
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def create
  	@issue = Issue.new(issue_params)
    @issue.tenant = current_tenant
  	if @issue.save
  		redirect_to tenant_path
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  end

  private

  def issue_params
  	params.require(:issue).permit(:title, :status, :completed_date, :message, :rating, :tenant_id)
  end

end
