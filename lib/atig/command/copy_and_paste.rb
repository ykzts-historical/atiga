
require 'atig/command/command'
require 'atig/command/info'

module Atig
  module Command
    class CopyAndPaste < Atig::Command::Command
      def command_name
        return %w/copy cp pakuri pkr/
      end

      def action(target, mesg, command, args)
        if args.empty?
          yield "/me #{command} <ID_or_SCREEN_NAME>"
          return
        end
        tid = args.first
        if entry = Info.find_status(db, tid)
          q = gateway.output_message(:status => entry.status.text)
          api.delay(0) do |t|
            ret = t.post("statuses/update", q)
            gateway.update_status ret, target, "Pakuri to #{entry.user.screen_name}: #{entry.status.text}"
          end
        else
          yield "No Such ID : #{tid}"
        end
      end
    end
  end
end
