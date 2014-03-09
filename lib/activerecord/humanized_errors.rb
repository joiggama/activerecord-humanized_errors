require 'activerecord/humanized_errors/version'

module ActiveRecord
  module HumanizedErrors

    def humanized_errors
      errors.full_messages.join ', '
    end
  end

  Base.class_eval do
    include ActiveRecord::HumanizedErrors
  end

end
