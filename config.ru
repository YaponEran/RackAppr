<<<<<<< HEAD
require_relative 'app'

run App.new
=======
# frozen_string_literal: true
require_relative 'app'

ROUTES = {
  '/time' => App.new
}
    
run Rack::URLMap.new(ROUTES)
>>>>>>> main
