require_relative 'formatter'

class App

  def call(env)
    @request = Rack::Request.new(env)
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
  end

end