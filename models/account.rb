require_relative("../db/sql_runner")


class Account

  attr_reader :id, :name, :budget

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @budget = 1000
  end

  def save()
    sql = "INSERT INTO accounts (name)
          VALUES ($1) RETURNING id;"
    values = [@name]
    account_hash = SqlRunner.run(sql, values).first
    @id = account_hash["id"].to_i
  end

  def amount_display(amount)
    # sprintf("%.2f", amount)
    return "£#{amount.round(2)}"
  end

  def Account.all()
    sql = "SELECT * FROM accounts;"
    account_hashes = SqlRunner.run(sql)
    return Account.new(account_hashes[0])
  end



end
