#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 03.08.2021 Piotr Wojcieszonek

require_relative 'base'

module Lib
  module TL1
    module Message
      module Field
        class AlarmCode < Base
          ALARM_CODE = {
            :'*C' => 'Critical Alarm',
            :'**' => 'Major Alarm',
            :'*^' => 'Minor Alarm',
            :'A^' => 'Non-Alarm Message'
          }

          def initialize(field)
            raise ArgumentError, "Unknown Alarm Code - #{field}" unless ALARM_CODE.key? field.to_s.upcase.to_sym
            super field.to_s.upcase.to_sym
          end

          def to_s
            @field.to_s.upcase
          end

          def description
            ALARM_CODE[@field]
          end

          def to_sym
            @field
          end

        end
      end
    end
  end
end