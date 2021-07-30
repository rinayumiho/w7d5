class UsersController < ApplicationController
  before_action :ensure_logged_in, except: %i(new create)

  def index
    @users = User.all
    render :index 
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :password)
  end
end