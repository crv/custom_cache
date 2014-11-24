require 'jquery-rails'
require 'custom_cache/acts_as_custom_cache'
require 'custom_cache/base'
require 'custom_cache/request_cache'
require 'custom_cache/session_cache'
require 'custom_cache/middleware'
require 'custom_cache/railtie' if defined?(Rails::Railtie)

module CustomCache
end
