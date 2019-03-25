require "bundler/setup"
Bundler.require
require_all "app"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/library.db"
)

# ActiveRecord::Base.logger = Logger.new(STDOUT)
DB = ActiveRecord::Base.connection
