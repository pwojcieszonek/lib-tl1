#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek

require_relative 'field'
require 'comparable'

module Lib
  module TL1
    module Message
      class Input
        include Comparable
        attr_reader :command, :tid, :aid, :gb, :payload, :ctag

        def initialize(command: nil, tid: nil, aid: nil, ctag: nil, gb: nil, payload: nil)
          if block_given?
            yield self
          else
            self.command = command
            self.tid = tid
            self.aid = aid
            self.ctag = ctag
            self.gb = gb
            self.payload = payload
          end
        end

        def <=>(other)
          return nil unless self.class == other.class
          self.to_s <=> other.to_s
        end

        def to_s
          "#{command}:#{tid}:#{aid}:#{ctag}:#{gb}:#{payload};"
        end
        alias_method :to_str, :to_s

        def command=(command)
          @command = command.is_a?(Field::CommandVerb) ? command : Field::CommandVerb.new(command)
        end
        alias_method :command_verb, :command
        alias_method :command_verb=, :command=
        alias_method :verb, :command
        alias_method :verb=, :command=

        def tid=(tid)
          @tid = tid.is_a?(Field::TargetIdentifier) ? tid : Field::TargetIdentifier.new(tid)
        end
        alias_method :target_identifier, :tid
        alias_method :target_identifier=, :tid=

        def aid=(aid)
          @aid = aid.is_a?(Field::AccessIdentifier) ? aid : Field::AccessIdentifier.new(aid)
        end
        alias_method :access_identifier, :aid
        alias_method :access_identifier=, :aid=

        def ctag=(ctag)
          @ctag = ctag.is_a?(Field::CorrelationTag) ? ctag : Field::CorrelationTag.new(ctag)
        end
        alias_method :correlation_tag, :ctag
        alias_method :correlation_tag=, :ctag=

        def gb=(gb)
          @gb = gb.is_a?(Field::GeneralBlock) ? gb : Field::GeneralBlock.new(gb)
        end
        alias_method :general_block, :gb
        alias_method :general_block=, :gb=

        def payload=(payload)
          @payload = payload.is_a?(Field::Payload) ? payload : Field::Payload.new(payload)
        end

      end
    end
  end
end