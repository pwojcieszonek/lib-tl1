# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek
# frozen_string_literal: true

require_relative "base"

module Lib
  module TL1
    module Message
      module Field
        class AcknowledgmentCode < Base
          ACK_CODE = {
            ip: "In Progress",
            fp: "Printout Follows",
            ok: "All Right",
            na: "No Acknowledgment",
            ng: "No Good",
            rl: "Repeat Later"
          }.freeze

          def initialize(field)
            unless ACK_CODE.key? field.to_s.downcase.to_sym
              raise ArgumentError, "Unknown Acknowledgment Code - #{field}"
            end

            super field.to_s.downcase.to_sym
          end

          def to_s
            @field.to_s.upcase
          end

          def to_sym
            @field
          end

          def description
            ACK_CODE[@field]
          end
        end
      end
    end
  end
end
