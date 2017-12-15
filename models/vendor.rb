require_relative("../db/sql_runner")

class Vendor

  attr_reader  :id, :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

end