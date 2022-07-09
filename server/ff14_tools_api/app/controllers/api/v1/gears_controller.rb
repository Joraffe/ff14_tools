module Api
  module V1
    class GearsController < AdminApiController
      before_action :require_admin, only: [:create, :update, :destroy]
      before_action :set_gear, only: %i[ show update destroy ]

      # GET /gears
      def index
        @gears = Gear.all

        render json: @gears
      end

      # GET /gears/1
      def show
        render json: @gear
      end

      # POST /gears
      def create
        @gear = Gear.new(gear_params)

        if @gear.save
          render json: @gear, status: :created, location: @gear
        else
          render json: @gear.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /gears/1
      def update
        if @gear.update(gear_params)
          render json: @gear
        else
          render json: @gear.errors, status: :unprocessable_entity
        end
      end

      # DELETE /gears/1
      def destroy
        @gear.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_gear
          @gear = Gear.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def gear_params
          params.require(:gear).permit(:name, :ilvl, :gear_slot_id)
        end
    end
  end
end
