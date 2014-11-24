module CustomCache

  class RequestCache < Base

    include Singleton

    attr_accessor :request_id

    def self.create(request_id)
      self.instance.request_id = request_id
    end

    def cache_key
      "_request_#{request_id}_cache" if request_id.present?
    end

  end

end
