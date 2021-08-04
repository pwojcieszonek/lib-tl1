#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek

require_relative 'field'
require 'comparable'

module Lib
  module TL1
    module Message
      class Output
        include Comparable
        attr_reader :sid, :date, :time, :cc, :text_block, :ctag

        def initialize(sid: nil, date: nil, time: nil, ctag: nil, cc: nil, text_block: nil)
          if block_given?
            yield self
          else
            self.sid = sid
            self.date = date
            self.time = time
            self.ctag = ctag
            self.cc = cc
            self.text_block = text_block
          end
        end

        def <=>(other)
          return nil unless self.class == other.class
          self.to_s <=> other.to_s
        end

        def to_s
          "\r\n\n   #{sid} #{date} #{time}\r\nM  #{ctag} #{cc}\r\n   #{text_block}\r\n;"
        end
        alias_method :to_str, :to_s

        def sid=(sid)
          @sid = sid.is_a?(Field::SystemIdentifier) ? sid : Field::SystemIdentifier.new(sid)
        end
        alias_method :system_identifier, :sid
        alias_method :system_identifier=, :sid=

        def date=(date)
          @date = date.is_a?(Field::Date) ? date : Field::Date.new(date)
        end

        def time=(time)
          @time = time.is_a?(Field::Time) ? time : Field::Time.new(time)
        end

        def cc=(cc)
          @cc = cc.is_a?(Field::CompletionCode) ? cc : Field::CompletionCode.new(cc)
        end
        alias_method :completion_code, :cc
        alias_method :completion_code=, :cc=

        def text_block=(text_block)
          @text_block = text_block.is_a?(Field::TextBlock) ? text_block : Field::TextBlock.new(text_block)
        end

        def ctag=(ctag)
          @ctag = ctag.is_a?(Field::CorrelationTag) ? ctag : Field::CorrelationTag.new(ctag)
        end
        alias_method :correlation_tag, :ctag
        alias_method :correlation_tag=, :ctag=

      end
    end
  end
end