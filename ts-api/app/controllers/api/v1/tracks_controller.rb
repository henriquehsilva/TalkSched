class Api::V1::TracksController < ApplicationController
  def index
    render json: Track.all
  end

  def show
    render json: Track.find(params[:id])
  end

  def create
    track = Track.new(track_params)
    if track.save
      render json: track, status: :created
    else
      render json: track.errors, status: :unprocessable_entity
    end
  end

  def update
    track = Track.find(params[:id])
    if track.update(track_params)
      render json: track, status: :ok
    else
      render json: track.errors, status: :unprocessable_entity
    end
  end

  def destroy
    track = Track.find(params[:id])
    track.destroy
    head :no_content
  end

  private

  def track_params
    params.permit(:name)
  end
end
