#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek

require_relative 'base'

module Lib
  module TL1
    module Message
      module Field
        class CommandVerb < Base

          def initialize(field)
            raise ArgumentError, "Command can't be nil" if field.nil?
            super field.to_s.upcase
          end

        end
      end
    end
  end
end