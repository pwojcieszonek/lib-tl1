# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek
# frozen_string_literal: true

require_relative "base"

module Lib
  module TL1
    module Message
      module Field
        class TargetIdentifier < Base
          def initialize(field)
            unless field =~ (/^[a-zA-Z0-9-]{0,20}$/) || field.nil?
              raise ArgumentError, "Wrong Target Identifier format - #{field}"
            end

            super
          end
        end
      end
    end
  end
end
