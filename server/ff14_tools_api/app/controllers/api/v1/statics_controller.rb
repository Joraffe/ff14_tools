module Api
  module V1
    class StaticsController < BasicApiController
      before_action :authorize_access_request!
      before_action :set_static, only: %i[ show update destroy ]

      # GET /statics
      def index
        @statics = current_user.statics.all

        render json: @statics
      end

      # GET /statics/1
      def show
        render json: @static
      end

      # POST /statics
      def create
        @static = current_user.statics.build(static_params)

        if @static.save
          render json: @static, status: :created, location: @static
        else
          render json: @static.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /statics/1
      def update
        if @static.update(static_params)
          render json: @static
        else
          render json: @static.errors, status: :unprocessable_entity
        end
      end

      # DELETE /statics/1
      def destroy
        @static.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_static
          @static = current_user.statics.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def static_params
          params.require(:static).permit(:name, :user_id)
        end
    end
  end
end
