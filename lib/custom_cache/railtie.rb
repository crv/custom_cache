module CustomCache
  class Railtie < Rails::Railtie
    initializer 'custom_cache.insert_middleware' do |app|

      app.config.middleware.insert_after ActionDispatch::Flash, CustomCache::Middleware

    end
  end
end
