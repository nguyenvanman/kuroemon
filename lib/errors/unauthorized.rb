module Errors
  class Unauthorized < Errors::ApplicationError
    attr_reader :record, :detail

    def initialize record, detail
      @record = record
      @detail = detail
    end

    def serialize full_messages: true
      message = record.message
      [ValidationErrorSerializer.new(record, nil, detail, message).serialize]
    end
  end
end