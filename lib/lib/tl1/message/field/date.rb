#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek

require_relative 'base'
require 'date'

module Lib
  module TL1
    module Message
      module Field
        class Date < Base

          def_delegators :@field, :year, :mon, :day, :month

          def initialize(field = nil)
            super(field.nil? ? nil : ::Date.parse(field))
          end

        end
      end
    end
  end
end