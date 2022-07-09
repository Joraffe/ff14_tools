module Api
  module V1
    class RaidsController < AdminApiController
      before_action :require_admin, only: [:create, :update, :destroy]
      before_action :set_raid, only: %i[ show update destroy ]

      # GET /raids
      def index
        @raids = Raid.all

        render json: @raids
      end

      # GET /raids/1
      def show
        render json: @raid
      end

      # POST /raids
      def create
        @raid = Raid.new(raid_params)

        if @raid.save
          render json: @raid, status: :created, location: @raid
        else
          render json: @raid.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /raids/1
      def update
        if @raid.update(raid_params)
          render json: @raid
        else
          render json: @raid.errors, status: :unprocessable_entity
        end
      end

      # DELETE /raids/1
      def destroy
        @raid.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_raid
          @raid = Raid.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def raid_params
          params.require(:raid).permit(:name)
        end
    end
  end
end
