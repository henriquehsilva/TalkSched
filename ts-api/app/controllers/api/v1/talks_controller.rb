class Api::V1::TalksController < ApplicationController
  def index
    render json: Talk.all
  end

  def show
    render json: Talk.find(params[:id])
  end

  def create
    talk = Talk.new(talk_params)
    if talk.save
      render json: talk, status: :created
    else
      render json: talk.errors, status: :unprocessable_entity
    end
  end

  def create_from_file
    file_format_service.each do |row|
      TalksCreatorService.new(description_params(row), duration_params(row)).call
    end
    register_final_event
    render json: Talk.all, status: :created
  end

  def update
    talk = Talk.find(params[:id])
    if talk.update(talk_params)
      render json: talk, status: :ok
    else
      render json: talk.errors, status: :unprocessable_entity
    end
  end

  def destroy
    talk = Talk.find(params[:id])
    talk.destroy
    head :no_content
  end

  private

  def talk_params
    params.permit(:description, :time, :duration, :track_id)
  end

  def file_format_service
    FileFormatService.new({fileFormat: params}).format
  end

  def extract_talks_service_params
    ExtractTalksService.new(params)
  end

  def extract_talks_service
    extract_talks_service_params.call
  end

  def description_params(row)
    extract_talks_service_params.description(row)
  end

  def duration_params(row)
    extract_talks_service_params.duration(row)
  end

  def register_final_event
    last_time_talk = Talk.last.time + Talk.last.duration.minutes
    Talk.create(description: 'Evento de Networking', time: last_time_talk, duration: 60, track_id: Track.last.id)
  end
end
