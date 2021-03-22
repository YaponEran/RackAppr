require_relative 'formatter'
<<<<<<< HEAD

=======
>>>>>>> main
class App

  def call(env)
    @request = Rack::Request.new(env)
<<<<<<< HEAD
    response
    [status, headers, body]
  end

  private
  def response
    return wrong_path unless @request.path_info == '/time'
    @formatter = Formatter.new(@request.params)
    @formatter.check_format
    return unknown_format unless @formatter.success?

    fortmated_time
  end

  def status
    @status_code
  end

  def headers
    { "Content-Type" => "text/plain" }
  end

  def body
    ["#{@message}"]
  end

  def fortmated_time
    @status_code = 200
    @message = @formatter.time
  end

  def wrong_path
    @status_code = 404
    @message = "Page not found"
  end

  def unknown_format
    @status_code = 400
    @message = "Unknown format"
=======

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
>>>>>>> main
  end

end