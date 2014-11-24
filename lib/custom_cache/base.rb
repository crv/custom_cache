module CustomCache
  class Base

    def cache_key
      SecureRandom.uuid
    end

    def cached_content
      Rails.cache.read(cache_key) || {}
    end

    def read(key)
      if cache_key.present?
        cached_content[key] if cached_content.present?
      end
    end

    def write(key, content)
      if cache_key.present? && content.present?
        cached_content.merge!(key => content)
        Rails.cache.write(cache_key, cached_content.merge!(key => content))
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