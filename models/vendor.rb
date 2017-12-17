require_relative("../db/sql_runner")

class Vendor

  attr_reader  :id, :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO vendors (name)
          VALUES ($1) RETURNING id;"
    values = [@name]
    vendor_hash = SqlRunner.run(sql, values).first
    @id = vendor_hash["id"].to_i
  end

  def Vendor.all()
    sql = "SELECT * FROM vendors;"
    vendor_hashes = SqlRunner.run(sql)
    return map_items(vendor_hashes)
  end

  def Vendor.delete_all()
    sql = "DELETE FROM vendors;"
    SqlRunner.run(sql)
  end

  def Vendor.find(id)
    sql = "SELECT * FROM vendors
          WHERE id = $1;"
    values = [id]
    vendor_hash = SqlRunner.run(sql, values).first
    return Vendor.new(vendor_hash)
  end

  def Vendor.delete(id)
    sql = "DELETE FROM vendors
          WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end





  def Vendor.map_items(vendor_hashes)
    result = vendor_hashes.map {|vendor_hash| Vendor.new(vendor_hash)}
    return result
  end

end
