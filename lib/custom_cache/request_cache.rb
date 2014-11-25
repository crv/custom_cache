module CustomCache

  class RequestCache < ScopeCache

    include Singleton

    def self.create(request_id)
      Thread.current[:request_id] = request_id
    end

    def scope
      "_request_#{Thread.current[:request_id]}_cache" if Thread.current[:request_id].present?
    end

    def self.clear!
      self.instance.clear
    end

  end

end
