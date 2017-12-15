require_relative("../db/sql_runner")


class Category

  attr_reader :id, :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO categories (name)
          VALUES ($1) RETURNING id"
    values = [@name]
    category_hash = SqlRunner.run(sql, values).first
    @id = category_hash["id"].to_i
  end

  def Category.all()
    
  end


end
