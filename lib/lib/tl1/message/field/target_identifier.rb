#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek

require_relative 'base'

module Lib
  module TL1
    module Message
      module Field
        class TargetIdentifier < Base

          def initialize(field)
            if field =~ /^[a-zA-Z0-9-]{0,20}$/ or field.nil?
              super
            else
              raise ArgumentError, "Wrong Target Identifier format - #{field}"
            end
          end

        end
      end
    end
  end
end