
require 'atig/command/command'
require 'atig/command/info'

module Atig
  module Command
    class CopyProfile < Atig::Command::Command
      def command_name
        return %w/cprofile cprof cpbio/
      end

      def action(target, mesg, command, args)
        if args.empty?
          yield  "/me #{command_name} <SCREEN_NAME>"
          return
        end
        screen_name = args.first
        api.delay(0) do |t|
          ret = t.get('users/show', { :screen_name => screen_name } )
          update = {
           :name => ret['name'],
           :location => ret['location'] ? ret['location'] : "",
           :description => ret['description'] ? ret['description'] : "" ,
           :url => ret['url'] ? ret['url'] : "",
           :skip_status => 1,
          }
          ret = t.post('account/update_profile', update)
          yield "updated profile: #{update[:name]} [#{update[:location]}] - #{update[:description]}"
        end
      end
    end
  end
end
