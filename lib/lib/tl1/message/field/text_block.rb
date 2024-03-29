# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek
# frozen_string_literal: true

require_relative "base"

module Lib
  module TL1
    module Message
      module Field
        class TextBlock < Base
          def initialize(field)
            @commented = false
            case field
            when /"\r\n   (.*)"/mi
              field = Regexp.last_match(1)
            when %r{/\*\r\n   (.*)\*/}mi
              @commented = true
              field = Regexp.last_match(1)
            when /\r\n   (.*)/mi
              field = Regexp.last_match(1)
            when (nil || "")
              field = nil
            else
              raise ArgumentError, "Unknown TextBlock format #{field}"
            end
            super field
          end

          def commented?
            @commented
          end
        end
      end
    end
  end
end
