class SubsController < ApplicationController

  before_action :moderator?, only:[:edit, :update]
  before_action :require_login

  def new
    @sub = Sub.new
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def create
    @sub = Sub.new(subs_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to subs_url
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def update
    @sub = Sub.find(params[:id])
    @sub.update_attributes(subs_params)
    if @sub.save
      redirect_to subs_url
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end

  private

  def subs_params
    params.require(:sub).permit(:title, :description)
  end

  def moderator?
    unless current_user.subs.find_by(params[:id])
      render json: 'Forbidden', status: :forbidden
    end
  end



end
