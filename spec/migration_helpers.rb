RSpec.configure do |config|
  config.before(:all) do
    ActiveRecord::Migration.maintain_test_schema! if defined?(ActiveRecord::Migration)
  end
end
