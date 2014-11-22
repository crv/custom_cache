module CustomCache
  module ActsAsCustomCache

    extend ActiveSupport::Concern

    included do

    end

    module ClassMethods

      def session_cache
         CustomCache::SessionCache.instance
      end

      def request_cache
        CustomCache::RequestCache.instance
      end

    end

    Rails.send :include, CustomCache::ActsAsCustomCache
  end
end