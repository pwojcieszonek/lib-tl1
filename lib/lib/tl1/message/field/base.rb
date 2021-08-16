# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek
# frozen_string_literal: true

require "forwardable"

module Lib
  module TL1
    module Message
      module Field
        class Base

          include Comparable
          extend Forwardable

          def_delegators :@field, :to_s, :nil?, :empty?
          attr_reader :field

          def initialize(field)
            @field = field
          end

          def <=>(other)
            return nil unless instance_of? other.class

            field <=> other.field
          end

          alias to_str to_s
        end
      end
    end
  end
end