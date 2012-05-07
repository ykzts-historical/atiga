
require 'atig/command/command'
require 'atig/command/info'

module Atig
  module Command
    class Permalink < Atig::Command::Command
      def command_name
        return %w/link ln/
      end

      def action(target, mesg, command, args)
        if args.empty?
          yield "/me #{command} <ID_or_SCREEN_NAME>"
          return
        end
        tid = args.first
        if entry = Info.find_status(db, tid)
          yield "https://twitter.com/#{entry.status.user.screen_name}/status/#{entry.status.id_str}"
        else
          yield "No Such ID : #{tid}"
        end
      end
    end
  end
end
