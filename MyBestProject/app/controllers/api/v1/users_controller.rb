module Api
  module V1
    class UsersController < BaseController
      def index
        render json: AdminSerializer.new(User.all, { include: %i[profile] }).serializable_hash
      end

      def show
        render json: AdminSerializer.new(User.find(params[:id]), { include: %i[profile] }).serializable_hash
      end

      def create
        User.create(user_params)
      end

      private

      def user_params
        params.from_jsonapi.require(:user).permit(:first_name, :last_name, :email)
      end
    end
  end
end
