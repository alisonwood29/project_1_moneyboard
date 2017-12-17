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
end
