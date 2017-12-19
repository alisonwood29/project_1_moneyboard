require("minitest/autorun")
require("minitest/rg")
require_relative("../models/account")

class TestAccount < MiniTest::Test

  def setup
    @account = Account.new({"name" => "Alison"})
  end

  def test_name()
    assert_equal("Alison", @account.name)
  end

  def test_budget()
    assert_equal(1000, @account.budget)
  end


end
