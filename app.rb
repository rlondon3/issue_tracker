require 'sinatra'
require_relative 'lib/routes'

Routes.run! if __FILE__ == $PROGRAM_NAME

