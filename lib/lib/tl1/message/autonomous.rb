# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek
# frozen_string_literal: true

require_relative "field"


module Lib
  module TL1
    module Message
      class Autonomous
        include Comparable
        attr_reader :sid, :date, :time, :alarm_code, :ctag, :command

        def initialize(sid: nil, date: nil, time: nil, alarm_code: nil, ctag: nil, command: nil, text_block: nil)
          if block_given?
            yield self
          else
            self.sid = sid
            self.date = date
            self.time = time
            self.alarm_code = alarm_code
            self.ctag = ctag
            self.command = command
            self.text_block = text_block
          end
        end

        def <=>(other)
          return nil unless instance_of? other.class

          to_s <=> other.to_s
        end

        def to_s
          "\r\n\n   #{sid} #{date} #{time}\r\n  #{alarm_code} #{ctag}\r\n   #{text_block}\r\n;"
        end
        alias to_str to_s

        def sid=(sid)
          @sid = sid.is_a?(Field::SystemIdentifier) ? sid : Field::SystemIdentifier.new(sid)
        end
        alias system_identifier sid
        alias system_identifier= sid=

        def date=(date)
          @date = date.is_a?(Field::Date) ? date : Field::Date.new(date)
        end

        def time=(time)
          @time = time.is_a?(Field::Time) ? time : Field::Time.new(time)
        end

        def alarm_code=(alarm_code)
          @alarm_code = alarm_code.is_a?(Field::AlarmCode) ? alarm_code : Field::AlarmCode.new(alarm_code)
        end

        def ctag=(ctag)
          @atag = ctag.is_a?(Field::CorrelationTag) ? ctag : Field::CorrelationTag.new(ctag)
        end
        alias correlation_tag ctag
        alias correlation_tag= ctag=
        alias atag ctag
        alias atag= ctag=

        def command=(command)
          @verb = command.is_a?(Field::CommandVerb) ? command : Field::CommandVerb.new(command)
        end

        def text_block=(text_block)
          @text_block = text_block.is_a?(Field::TextBlock) ? text_block : Field::TextBlock.new(text_block)
        end

      end
    end
  end
end