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

    def read(key)
      if cache_key.present?
        content = Rails.cache.read(cache_key)
        content[key] if content.present?
      end
    end

    def write(key, content)
      if cache_key.present?
        cached_content = Rails.cache.read(cache_key) || {}
        cached_content[key] = content
        Rails.cache.write(cache_key, cached_content)
      end
    end

    def clear
      Rails.cache.delete(cache_key) if cache_key.present?
    end

    def self.clear!
      self.instance.clear
    end

  end

end
