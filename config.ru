# frozen_string_literal: true
require_relative 'app'

ROUTES = {
  '/time' => App.new
}
    
run Rack::URLMap.new(ROUTES)
