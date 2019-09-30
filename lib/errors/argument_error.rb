module Errors
  class ArgumentError < Errors::ApplicationError
    attr_reader :record

    def initialize record
      @record = record
      @errors = serialize
    end

    def serialize full_messages: true
      message = record.message
      detail  = :unprocessable_entity
      ValidationErrorSerializer.new(@record, nil, detail, message).serialize
    end
  end
end