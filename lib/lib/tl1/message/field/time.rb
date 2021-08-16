# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek
# frozen_string_literal: true

require_relative "base"
require "time"

module Lib
  module TL1
    module Message
      module Field
        class Time < Base
          def_delegators :@field, :min, :sec, :hour, :strftime

          def initialize(field)
            super ::Time.parse(field)
          end

          def to_s
            @field.strftime("%H:%M:%S")
          end
        end
      end
    end
  end
end
