class ExtractTalksService
  def initialize(file)
    @lightning_duration = { 'lightning' => '05min' }
    @contents_file = file
  end

  def call
    File.open(@contents_file, "r:UTF-8").read.split("\n")
  end

  def description(row)
    row.gsub(/\s+/, " ").strip.match(/.*[\D]+?\s/).to_s
  end

  def duration(row)
    duration_match(row).empty? ? lightning_duration['lightning'] : duration_match(row)
  end

  private

  def lightning_duration
    @lightning_duration
  end

  def duration_match(row)
    row.strip.match(/[\d]+min$|[\d]+(\s)min$/).to_s.delete(' ')
  end
end
