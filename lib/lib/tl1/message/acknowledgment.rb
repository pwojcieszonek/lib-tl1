# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek
# frozen_string_literal: true

require_relative "field"

module Lib
  module TL1
    module Message
      class Acknowledgment
        include Comparable
        attr_reader :ack_code, :ctag

        def initialize(ack_code: nil, ctag: nil)
          if block_given?
            yield self
          else
            self.ack_code = ack_code
            self.ctag = ctag
          end
        end

        def <=>(other)
          return nil unless instance_of? other.class

          to_s <=> other.to_s
        end

        def to_s
          "#{@ack_code} #{@ctag}\r\n"
        end
        alias to_str to_s

        def ack_code=(ack_code)
          @ack_code = ack_code.is_a?(Field::AcknowledgmentCode) ? ack_code : Field::AcknowledgmentCode.new(ack_code)
        end
        alias acknowledgment_code ack_code
        alias acknowledgment_code= ack_code=

        def ctag=(ctag)
          @ctag = ctag.is_a?(Field::CorrelationTag) ? ctag : Field::CorrelationTag.new(ctag)
        end
        alias correlation_tag ctag
        alias correlation_tag= ctag=

      end
    end
  end
end