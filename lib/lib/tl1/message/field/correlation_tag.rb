#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek

require_relative 'base'

module Lib
  module TL1
    module Message
      module Field
        class CorrelationTag < Base

          def initialize(field = nil)
            field = rand(0..999999) if field.nil?
            raise ArgumentError, "Wrong #{self.class.name} format - #{field}" unless field.to_i < 999999 and field.to_i >= 0
            super field.to_i
          end

          def to_i
            @field.to_i
          end

        end
      end
    end
  end
end