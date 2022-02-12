class Api::V1::YoutubeController < ApplicationController

  def create
    render json: { status: 200, result: params }
  end

end
