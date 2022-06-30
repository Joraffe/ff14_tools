module Api
  module V1
    class GearSlotsController < ApplicationController
      before_action :set_gear_slot, only: %i[ show update destroy ]

      # GET /gear_slots
      def index
        @gear_slots = GearSlot.all

        render json: @gear_slots
      end

      # GET /gear_slots/1
      def show
        render json: @gear_slot
      end

      # POST /gear_slots
      def create
        @gear_slot = GearSlot.new(gear_slot_params)

        if @gear_slot.save
          render json: @gear_slot, status: :created, location: @gear_slot
        else
          render json: @gear_slot.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /gear_slots/1
      def update
        if @gear_slot.update(gear_slot_params)
          render json: @gear_slot
        else
          render json: @gear_slot.errors, status: :unprocessable_entity
        end
      end

      # DELETE /gear_slots/1
      def destroy
        @gear_slot.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_gear_slot
          @gear_slot = GearSlot.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def gear_slot_params
          params.require(:gear_slot).permit(:gear_set_id, :slot)
        end
    end
  end
end
