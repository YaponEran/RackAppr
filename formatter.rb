class Formatter

  TIME_FORMATS = {
    "year" => "%Y",
    "month" => "%m",
    "day" => "%d",
    "hour" => "%Hh",
    "minute" => "%Mm",
    "second" => "%Ss"
  }.freeze

  attr_reader :incorrect

  def initialize(params)
    @params = params['format'].split(',')
  end

  def check_format
    @correct, @incorrect = @params.partition { |format| TIME_FORMATS[format] }
  end

  def success?
    @incorrect.empty?
  end

  def time
    formats = @correct.map { |format| TIME_FORMATS[format] }
    Time.now.strftime(formats.join('-'))
  end

end

