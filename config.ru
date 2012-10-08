require 'rack'
require 'rack/contrib/try_static'
require 'rack/contrib/not_found'

# gzip
use Rack::Deflater

use ::Rack::TryStatic,
  :root => "build",     # where middleman files are generated
  :urls => %w[/],          # match all requests
  :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially

# 404
run Rack::NotFound.new('build/404/index.html')