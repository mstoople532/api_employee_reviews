namespace :db do
  task :migrate do
    require_relative "db/migrations/create_companies_table"
    require_relative "db/connection"
      # begin
      CompanyDataMigration.migrate(:up)
      # rescue
      # end
  end
  task :rollback do
    require_relative "db.migrations/create_companies_table"
    require_relative "db/connection"
    begin
      CompanyDataMigration.migrate(:down)
    rescue
    end
  end
end
