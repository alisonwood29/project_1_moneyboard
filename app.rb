require("sinatra")
require("sinatra/contrib/all")
require_relative("controllers/transaction_controller")
require_relative("controllers/vendor_controller")
require_relative("controllers/category_controller")
require_relative("models/account.rb")

get ("/") do
  @total = Transaction.total()
  @account = Account.all()
  erb(:index)
end
