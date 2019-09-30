module Errors
  class ParameterMissing < Errors::ApplicationError
    attr_reader :record

    def initialize record
      @record = record
      @errors = serialize
    end

    def serialize full_messages: true
      message = record.message
      field = message.split(' ').last
      detail  = :bad_request
      ValidationErrorSerializer.new(@record, field, detail, message).serialize
    end
  end
end