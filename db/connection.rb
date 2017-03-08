name_of_db = if ENV["RACK_ENV"] == "test"
  "db/test.db"
else
  "db/development.db"
end

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: name_of_db
)
# d = Employee.create!(name: "Doug")
#
# e = Employee.create!(name: "Elanor")
#
# t = Department.create!(name: "Telecom")
#
# t.employees = [d, e]
#
# t.save!
