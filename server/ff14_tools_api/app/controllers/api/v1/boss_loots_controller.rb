module Api
  module V1
    class BossLootsController < ApplicationController
      before_action :set_boss_loot, only: %i[ show update destroy ]

      # GET /boss_loots
      def index
        @boss_loots = BossLoot.all

        render json: @boss_loots
      end

      # GET /boss_loots/1
      def show
        render json: @boss_loot
      end

      # POST /boss_loots
      def create
        @boss_loot = BossLoot.new(boss_loot_params)

        if @boss_loot.save
          render json: @boss_loot, status: :created, location: @boss_loot
        else
          render json: @boss_loot.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /boss_loots/1
      def update
        if @boss_loot.update(boss_loot_params)
          render json: @boss_loot
        else
          render json: @boss_loot.errors, status: :unprocessable_entity
        end
      end

      # DELETE /boss_loots/1
      def destroy
        @boss_loot.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_boss_loot
          @boss_loot = BossLoot.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def boss_loot_params
          params.require(:boss_loot).permit(:boss_id, :loot_id)
        end
    end
  end
end
