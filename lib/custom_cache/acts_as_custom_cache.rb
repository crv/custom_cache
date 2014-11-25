module CustomCache
  module ActsAsCustomCache

    extend ActiveSupport::Concern

    included do

    end

    module ClassMethods

      def session_cache(options = {})
         CustomCache::SessionCache.instance
      end

      def request_cache(options = {})
        CustomCache::RequestCache.instance
      end

    end

    Rails.send :include, CustomCache::ActsAsCustomCache
  end
end