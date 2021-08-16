# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek
# frozen_string_literal: true

require_relative "base"

module Lib
  module TL1
    module Message
      module Field
        class CompletionCode < Base
          COMPLETION_CODE = {
            compld: "Total successful execution of the input command.",
            deny: "Total denial of the input command.",
            prtl: 'Partial  successful  execution of  the input command. This response code is valid  when
                    the ctag  in  the general block is FALSE represents successful queuing of the input command
                    submitted for delayed activation..',
            delay: "Successful queuing of the input command submitted for delayed activation.",
            rtry: 'Output response of a input retrieve command that retrieves extensive amount of information
                    from the NE and uses more time for processing'
          }.freeze

          def initialize(field)
            unless COMPLETION_CODE.key? field.to_s.downcase.to_sym
              raise ArgumentError, "Unknown Completion Code - #{field}"
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
            COMPLETION_CODE[@field]
          end

          def compld?
            @field == :compld
          end

          def deny?
            @field == :deny
          end

          def prtl?
            @field == :prtl
          end

          def delay?
            @field == :delay
          end

          def rtry?
            @field == :rtry
          end
        end
      end
    end
  end
end