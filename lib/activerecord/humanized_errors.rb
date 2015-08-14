require 'active_support/concern'

module ActiveRecord

  module HumanizedErrors
    def humanized_errors
      valid? unless errors.present?
      errors.full_messages.join ', '
    end
  end

end

ActiveRecord::Base.send :include, ActiveRecord::HumanizedErrors
