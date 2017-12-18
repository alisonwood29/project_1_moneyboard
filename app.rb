require("sinatra")
require("sinatra/contrib/all")
require_relative("controllers/transaction_controller")
require_relative("controllers/vendor_controller")
require_relative("controllers/category_controller")

get "/" do
  erb(:index)
end
