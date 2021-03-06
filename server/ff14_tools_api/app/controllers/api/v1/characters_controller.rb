module Api
  module V1
    class CharactersController < BasicApiController
      before_action :authorize_access_request!
      before_action :set_character, only: %i[ show update destroy ]

      # GET /characters
      def index
        @characters = current_user.characters.all

        render json: @characters
      end

      # GET /characters/1
      def show
        render json: @character
      end

      # POST /characters
      def create
        @character = current_user.characters.build(character_params)

        if @character.save
          render json: @character, status: :created, location: @character
        else
          render json: @character.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /characters/1
      def update
        if @character.update(character_params)
          render json: @character
        else
          render json: @character.errors, status: :unprocessable_entity
        end
      end

      # DELETE /characters/1
      def destroy
        @character.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_character
          @character = current_user.characters.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def character_params
          params.require(:character).permit(:name, :static_id)
        end
    end
  end
end
