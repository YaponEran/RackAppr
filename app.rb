# frozen_string_literal: true
require_relative 'formatter'

class App

  def call(env)
    @request = Rack::Request.new(env)

    return response(404, "Page not found") unless request_action?

    format_date = Formatter.new(@request.params['format'])

    if format_date.success?
      response(200, format_date.format_time)
    else
      response(400, format_date.invalid_format)
    end

  end

  private

  def response(status, message)
    [status, { 'Content-Type' => 'text/plain' }, ["#{message}\n"]]
  end

  def request_action?
    @request.path == '/time'
  end

end