require_relative("../db/sql_runner")

class Transaction

  attr_reader :id, :category_id, :vendor_id, :amount

  def initialize(options)
    @id = options["if"].to_i if options["id"]
    @category_id = options["category_id"]
    @vendor_id = options["vendor_id"]
    @amount = options["amount"].to_i
  end

end
