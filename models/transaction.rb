require_relative("../db/sql_runner")

class Transaction

  attr_reader :id, :category_id, :vendor_id, :amount

  def initialize(options)
    @id = options["id"].to_i if options["id"]
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

  def Transaction.all()
    sql = "SELECT * FROM transactions;"
    transaction_hashes = SqlRunner.run(sql)
    return map_items(transaction_hashes)
  end

  def Transaction.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end

  def Transaction.find(id)
    sql = "SELECT * FROM transactions
          WHERE id = $1;"
    values = [id]
    transaction_hash = SqlRunner.run(sql, values).first
    return Transaction.new(transaction_hash)
  end

  def Transaction.delete(id)
    sql = "DELETE FROM transactions
          WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end



  def Transaction.map_items(transaction_hashes)
    result = transaction_hashes.map {|transaction_hash| Transaction.new(transaction_hash)}
    return result
  end

end
