class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  # layout false

  def index
    @users = User.all.includes(:profile)
    @users = @users.where('age > ?', params[:age]) if params[:age]
    @users = @users.where('first_name LIKE ?', "%#{params[:name]}%") if params[:name]
    # @users = @users.where(User.arel_table[:first_name].matches(params[:name])) if params[:name]

    respond_to do |format|
      format.html
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

  def update
    if @user.update(user_params)
      flash[:notice] = 'User was updated'
      redirect_to action: :show
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to action: :edit
    end
  end

  def new
    @user = User.new(profile: Profile.new)
    2.times { @user.devices.build }
  end

  def search; end

  def preview; end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :age, :status, profile_attributes: %i[id address phone_number],
      devices_attributes: {})
  end

  def set_user
    @user = User.find params[:id]
  end
end
