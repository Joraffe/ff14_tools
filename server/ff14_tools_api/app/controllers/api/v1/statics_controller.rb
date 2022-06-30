module Api
  module V1
    class StaticsController < ApplicationController
      before_action :set_static, only: %i[ show update destroy ]

      # GET /statics
      def index
        @statics = Static.all

        render json: @statics
      end

      # GET /statics/1
      def show
        render json: @static
      end

      # POST /statics
      def create
        @static = Static.new(static_params)

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
          @static = Static.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def static_params
          params.require(:static).permit(:name, :user_id)
        end
    end
  end
end
