# frozen_string_literal: true
class Formatter

  TIME_FORMATS = {
    "year" => "%Y",
    "month" => "%m",
    "day" => "%d",
    "hour" => "%Hh",
    "minute" => "%Mm",
    "second" => "%Ss"
  }.freeze

  def initialize(params)
    format_params(params)
  end

  def success?
    @incorrect.empty?
  end

  def format_time
    formats = @correct.map { |format| TIME_FORMATS[format] }
    Time.now.strftime(formats.join('-'))
  end

  def invalid_format
    "Unknown time format #{@incorrect}"
  end

  def format_params(params)
    params = params.split(',')
    @correct, @incorrect = params.partition { |param| TIME_FORMATS[param] }
  end

end

