<<<<<<< HEAD
=======
# frozen_string_literal: true
>>>>>>> main
class Formatter

  TIME_FORMATS = {
    "year" => "%Y",
    "month" => "%m",
    "day" => "%d",
    "hour" => "%Hh",
    "minute" => "%Mm",
    "second" => "%Ss"
  }.freeze

<<<<<<< HEAD
  attr_reader :incorrect

  def initialize(params)
    @params = params['format'].split(',')
  end

  def check_format
    @correct, @incorrect = @params.partition { |format| TIME_FORMATS[format] }
=======
  def initialize(params)
    format_params(params)
>>>>>>> main
  end

  def success?
    @incorrect.empty?
  end

<<<<<<< HEAD
  def time
=======
  def format_time
>>>>>>> main
    formats = @correct.map { |format| TIME_FORMATS[format] }
    Time.now.strftime(formats.join('-'))
  end

<<<<<<< HEAD
=======
  def invalid_format
    "Unknown time format #{@incorrect}"
  end

  def format_params(params)
    params = params.split(',')
    @correct, @incorrect = params.partition { |param| TIME_FORMATS[param] }
  end

>>>>>>> main
end

