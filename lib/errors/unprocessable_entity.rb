module Errors
  class UnprocessableEntity < Errors::ApplicationError
    attr_reader :record

    def initialize record
      @record = record
      @errors = serialize
    end

    def serialize full_messages: true
      message = record.message
      record = field = detail  = :unprocessable_entity
      ValidationErrorSerializer.new(record, field, detail, message).serialize
    end
  end
end