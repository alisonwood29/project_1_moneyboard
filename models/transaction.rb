require_relative("../db/sql_runner")

class Transaction

  attr_reader :id, :category_id, :vendor_id, :amount

  def initialize(options)
    @id = options["if"].to_i if options["id"]
    @category_id = options["category_id"]
    @vendor_id = options["vendor_id"]
    @amount = options["amount"].to_i
  end

  def save()
    sql = "INSERT INTO transactions (category_id, vendor_id, amount)
          VALUES ($1, $2, $3)
          RETURNING id;"
    values = [@category_id, @vendor_id, @amount]
    transaction_hash = SqlRunner.run(sql, values).first
    @id = transaction_hash["id"].to_i
  end

end
