ENV["RACK_ENV"] = "test"
require "pry"
require "minitest/autorun"
require "minitest/pride"
require "minitest/focus"
require "rack/test"

require_relative "../db/connection"
require_relative "../db/migrations/create_company_table"

begin
  CreateCompanyTable.migrate(:down)
rescue ActiveRecord::StatementInvalid
end
CreateCompanyTable.migrate(:up)
