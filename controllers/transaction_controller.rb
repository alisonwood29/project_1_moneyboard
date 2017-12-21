require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative("../models/transaction.rb")
require_relative("../models/category.rb")
require_relative("../models/vendor.rb")

get("/transactions") do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end

get("/transactions/new") do
  @categories = Category.all()
  @vendors = Vendor.all()
  erb(:"transactions/new")
end

post("/transactions") do
  @new_transaction = Transaction.new(params)
  @new_transaction.save()
  erb(:"transactions/create")
end

get("/transactions/:id/edit") do
  @categories = Category.all()
  @vendors = Vendor.all()
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/edit")
end


get("/transactions/spend") do
  @transactions = Transaction.find_by_date(params[:date])
  if @transactions == nil
    redirect "/transactions/not_found"
  end
  @transaction_spend = Transaction.spend_by_date(params[:date])
  erb(:"transactions/date")
end

get("/transactions/not_found") do
  erb(:"transactions/not_found")
end

post("/transactions/:id") do
  @transaction = Transaction.new(params)
  @transaction.update()
  redirect "/transactions"
end

post("/transactions/:id/delete") do
  transaction = Transaction.find(params[:id])
  transaction.delete()
  redirect "/transactions"
end

get("/transactions/spending") do
  erb(:"transactions/spending")
end

get("/transactions/:id") do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/show")
end
