require 'active_record'
require 'activerecord/humanized_errors'

# Removes annoying deprecation warning, probably from ActiveRecord
I18n.enforce_available_locales = false


RSpec.configure do |config|

  config.before(:all) do |example|
    ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
  end

  # Raises a rollback after example
  config.around do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end

  config.order = 'random'
end
