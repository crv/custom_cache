module CustomCache
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      request =  ActionDispatch::Request.new(env)
      CustomCache::RequestCache.create(request.uuid)
      CustomCache::SessionCache.create(request.session.id)
      @app.call(env)
    ensure
      CustomCache::RequestCache.clear!
    end
  end
end
