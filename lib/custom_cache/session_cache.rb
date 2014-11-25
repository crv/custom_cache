module CustomCache

    class SessionCache < ScopeCache

      include Singleton

      def self.create(session_id)
        Thread.current[:session_id] = session_id
      end

      def scope
        "session#{Thread.current[:session_id]}_cache" if Thread.current[:session_id].present?
      end

      def self.clear!
        self.instance.clear
      end

    end

end
