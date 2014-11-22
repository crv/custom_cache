module CustomCache

    class SessionCache < Base

      include Singleton

      attr_accessor :session_id

      def self.create(session_id)
        self.instance.session_id = session_id
      end

      def cache_key
        "_session_#{session_id}_cache" if session_id.present?
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
