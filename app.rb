require_relative "app_helper"

class App < Sinatra::Base
  get "/" do
    "Go to /employees to add employee"
  end

  post "/employees" do
    content_type "application/json"
    body Employee.create(name: params["name"]).to_json
  end

  delete "/employees/" do
    content_type "application/json"
    employee_to_destroy = Employee.find(id: params["id"])
    employee_to_destroy.destroy
    employee_to_destroy.to_json
  end
  run! if app_file == $PROGRAM_NAME
end
