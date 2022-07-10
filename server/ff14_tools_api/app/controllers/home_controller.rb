class HomeController < ApplicationController
  def index
    @statics = Static.all
    render json: @statics
  end
end
