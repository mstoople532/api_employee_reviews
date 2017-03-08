require_relative "test_helper"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    App
  end

  def teardown
    Employee.delete_all
  end

  def test_root_route
    response = get "/"

    assert response.ok?
    assert_equal response.body, "Go to /employees to add employee"
  end

  def test_can_create_an_employee
    response = post "/employees", name: "Britney Spears"
    assert response.ok?,
    Employee.where(name: "Britney Spears").first
    assert_equal "Britney Spears", brit.name
  end

  def test_can_delete_an_employee
    Employee.create(name: "Britney Spears")
    delete "/employees", id: 1
    assert_equal [], Employee.where(id: 1)
  end

  def test_can_list_employees
    Employee.create(name: "Britney Spears")
    Employee.create(name: "Russell Osborne")
    assert_equal 2, Employee.count
  end

  def test_can_list_specific_employee
    Employee.create(name: "Britney Spears")
    response = get "/employees", id: 1
    assert_includes response.body, "Britney"
  end

  def test_can_change_employee_name
    Employee.create(name: "Rusty")
    patch "/employees", id: 1, name: "Russell Osborne"
    # assert_equal " ", Employee.
  end
end
