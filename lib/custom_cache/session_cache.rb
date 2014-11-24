module CustomCache

    class SessionCache < Base

      include Singleton

      attr_accessor :session_id

      def self.create(session_id)
        if self.instance.session_id.present? && self.instance.session_id != session_id
          self.clear!
        end
        self.instance.session_id = session_id
      end

      def cache_key
        "_session_#{session_id}_cache" if session_id.present?
      end

    end

end
