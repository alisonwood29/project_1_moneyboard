class Account

  attr_reader :id, :name, :budget

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @budget = 1000
  end



end
