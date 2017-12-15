require("minitest/autorun")
require("minitest/rg")
require_relative("../models/category")


class TestCategory < MiniTest::Test

  def setup
    @category = Category.new({ "name" => "Food"})
  end

  def test_name
    assert_equal("Food", @category.name)
  end

end
