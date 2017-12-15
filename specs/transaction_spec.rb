require("minitest/autorun")
require("minitest/rg")
require_relative("../models/transaction")


class TestTransaction < MiniTest::Test

  def setup
    @transaction = Transaction.new({"amount" => 10})
  end

  def test_amount
    assert_equal(10, @transaction.amount)
  end

end
