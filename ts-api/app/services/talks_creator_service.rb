class TalksCreatorService

  ALFABET_INDEX = ('A'..'Z').to_a

  MORNING_START_TIME    = Time.parse('09:00')
  LUNCH_TIME            = Time.parse('12:00')
  AFTERNOON_START_TIME  = Time.parse('13:00')
  NETWORKING_START_TIME = Time.parse('17:00')


  def initialize(description, duration)
    @description = description
    @duration = duration
  end

  def call
    last_increment_time = Talk.last&.time  + Talk.last&.duration&.minutes if Talk.last.present?
    last_track = Track.last

    time = last_increment_time || MORNING_START_TIME.strftime('%H:%M')
    track = last_track || Track.find_or_create_by(name: "Track #{ALFABET_INDEX.first}")

    if time >= LUNCH_TIME.strftime('%H:%M') && time < AFTERNOON_START_TIME.strftime('%H:%M')
      Talk.create(description: 'Almoço', time: time, duration: 60, track_id: track.id)
      time += 60.minutes
    end

    if time >= NETWORKING_START_TIME.strftime('%H:%M')
      Talk.create(description: 'Evento de Networking', time: time, duration: 60, track_id: track.id)
      time = MORNING_START_TIME.strftime('%H:%M')
      track = Track.find_or_create_by(name: "Track #{ALFABET_INDEX[Track.count]}")
    end

    Talk.create(description: @description, time: time, duration: @duration, track_id: track.id)
  end
end
