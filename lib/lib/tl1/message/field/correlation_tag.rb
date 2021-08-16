# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek
# frozen_string_literal: true

require_relative "base"

module Lib
  module TL1
    module Message
      module Field
        class CorrelationTag < Base

          def initialize(field = nil)
            field = rand(0..999_999) if field.nil?
            unless (field.to_i < 999_999) && (field.to_i >= 0)
              raise ArgumentError, "Wrong #{self.class.name} format - #{field}"
            end

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