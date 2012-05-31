
require 'atig/command/command'
require 'atig/command/info'

module Atig
  module Command
    class Profile < Atig::Command::Command
      def command_name
        return %w/profile prof bio/
      end

      def action(target, mesg, command, args)
        screen_name = args.empty? ? db.me.screen_name : args.first
        api.delay(0) do |t|
          ret = t.get("users/show", { :screen_name => screen_name } )
          gateway[target].notify "#{screen_name}: #{ret['name']}[#{ret['location']}] - #{ret['description']}"
        end
      end
    end
  end
end
