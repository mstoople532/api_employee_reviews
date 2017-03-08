ENV["RACK_ENV"] = "test"
require "pry"
require "minitest/autorun"
require "minitest/pride"
require "minitest/focus"
require "rack/test"

require_relative "../app"
require_relative "../company"
require_relative "../department"
require_relative "../employee"
require_relative "../db/connection"
require_relative "../db/migrations/create_companies_table"

begin
  CompanyDataMigration.migrate(:down)
rescue ActiveRecord::StatementInvalid
end
CompanyDataMigration.migrate(:up)
