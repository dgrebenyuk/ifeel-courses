class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: %i[show edit]
  # layout false

  def index
    @users = User.all

    respond_to do |format|
      format.html { render layout: false }
      format.json { render json: @users }
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to action: :index
    else
      # head :unprocessable_entity
      render json: @user.errors
    end
  end

  def search

  end


  def preview

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :age, profile_attributes: [])
  end

  def set_user
    @user = User.find params[:id]
  end
end
