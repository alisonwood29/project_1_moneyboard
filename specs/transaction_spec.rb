require("minitest/autorun")
require("minitest/rg")
require_relative("../models/transaction")


class TestTransaction < MiniTest::Test

  def setup
    @transaction = Transaction.new({"amount" => 10, "transaction_date" => "2017/12/19"})
  end

  def test_amount()
    assert_equal(10, @transaction.amount)
  end

  def test_date()
    assert_equal("2017/12/19", @transaction.transaction_date)
  end

end
