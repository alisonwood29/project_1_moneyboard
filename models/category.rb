require_relative("../db/sql_runner")


class Category

  attr_reader :id, :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO categories (name)
          VALUES ($1) RETURNING id;"
    values = [@name]
    category_hash = SqlRunner.run(sql, values).first
    @id = category_hash["id"].to_i
  end

  def Category.all()
    sql = "SELECT * FROM categories;"
    category_hashes = SqlRunner.run(sql)
    return category_hashes.map {|category_hash| Category.new(category_hash)}
  end

  def Category.delete_all()
    sql = "DELETE FROM categories;"
    SqlRunner.run(sql)
  end

  def Category.find(id)
    sql = "SELECT * FROM categories
          WHERE id = $1"
    values = [id]
    category_hash = SqlRunner.run(sql, values).first
    return Category.new(category_hash)
  end


end
