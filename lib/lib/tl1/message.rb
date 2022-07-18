# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek
# frozen_string_literal: true

require_relative "message/acknowledgment"
require_relative "message/autonomous"
require_relative "message/input"
require_relative "message/output"

module Lib
  module TL1
    module Message
      def self.parse(message)
        case message
        when /\r\n\n   (.{0,20}) (\d{2,4}-\d{1,2}-\d{1,2}) (\d{1,2}:\d{1,2}:\d{1,2})\r\nM  (\d{1,6}) (\w{4,6})(.*)\r\n(;|\r\n)/mi #Output message
          # $1 - SID, $2 - DATE, $3 - TIME, $4 - CTAG, $5 - COMPLETION CODE, $6 - MESSAGE TEXT BLOCK
          Lib::TL1::Message::Output.new(sid: $1, date: $2, time: $3, ctag: $4, cc: $5, text_block: $6)

        when /(.*):(.{0,20}):(.*):(\d{1,6}):(.*):(.*);/mi # Input message
          # $1 - COMMAND VERB, $2 - TID, $3 - AID, $4 - CTAG, $5 - General Block, $6 - Message Payload
          Lib::TL1::Message::Input.new(command: $1, tid: $2, aid: $3, ctag: $4, gb: $5, payload: $6)

        when /(IP|PF|OK|NA|NG|RL):(\d{1,6});/mi # Acknowledgment message
          # $1 - Status Code, $2 - CTAG
          Lib::TL1::Message::Acknowledgment.new(ack_code: $1, ctag: $2)

        when /\r\n\n   (.{1,20}) (\d{2,4}-\d{1,2}-\d{1,2}) (\d{1,2}:\d{1,2}:\d{1,2})\r\n(\*C|\*\*|\*\^|A\^) (.*)(\r\n   .*)\r\n;/mi # Autonomous message
          # $1 - SID, $2 - DATE, $3 - TIME, $4 - Alarm Code, $5 ATAG, $6 - Verb, $7 - Message code
          Lib::TL1::Message::Autonomous.new(sid: $1, date: $2, time: $3, alarm_code: $4, ctag: $5, command: $6, text_block: $7)

        else
          raise ArgumentError, "Can't parse Message. Unknown TL1 message type"
        end
      end
    end
  end
end
