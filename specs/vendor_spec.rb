require("minitest/autorun")
require("minitest/rg")
require_relative("../models/vendor")


class TestVendor < MiniTest::Test

  def setup
    @vendor = Vendor.new({"name" => "Tesco"})
  end

  def test_name
    assert_equal("Tesco", @vendor.name)
  end

end
