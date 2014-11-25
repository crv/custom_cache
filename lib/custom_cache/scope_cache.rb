module CustomCache

  class ScopeCache < Base

    def cached_content
      Rails.cache.read(self.scope) || {}
    end

    def read(key)
      if scope.present? && key.present?
        cached_content[key] if cached_content.present?
      end
    end

    def write(key, content, options = {})
      if scope.present? && content.present?
        cached_content.merge!(key => content)
        Rails.cache.write(scope, cached_content.merge!(key => content),
                          expires_in: (options[:expires_in] || DEFAULT_EXPIRY))
      end
    end

    def clear
      Rails.cache.delete(scope) if scope.present?
    end

  end

end
