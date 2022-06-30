module Api
  module V1
    class GearSetsController < ApplicationController
      before_action :set_gear_set, only: %i[ show update destroy ]

      # GET /gear_sets
      def index
        @gear_sets = GearSet.all

        render json: @gear_sets
      end

      # GET /gear_sets/1
      def show
        render json: @gear_set
      end

      # POST /gear_sets
      def create
        @gear_set = GearSet.new(gear_set_params)

        if @gear_set.save
          render json: @gear_set, status: :created, location: @gear_set
        else
          render json: @gear_set.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /gear_sets/1
      def update
        if @gear_set.update(gear_set_params)
          render json: @gear_set
        else
          render json: @gear_set.errors, status: :unprocessable_entity
        end
      end

      # DELETE /gear_sets/1
      def destroy
        @gear_set.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_gear_set
          @gear_set = GearSet.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def gear_set_params
          params.require(:gear_set).permit(:character_id, :role_id)
        end
    end
  end
end
