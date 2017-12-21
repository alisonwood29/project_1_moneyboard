require_relative("../models/category")
require_relative("../models/vendor")
require_relative("../models/transaction")
require_relative("../models/account")
require("pry-byebug")

Transaction.delete_all()
Category.delete_all()
Vendor.delete_all()

category_1 = Category.new({ "name" => "Eating Out"})
category_2 = Category.new({ "name" => "Groceries"})
category_3 = Category.new({ "name" => "Social"})
category_4 = Category.new({ "name" => "Clothes"})
category_5 = Category.new({ "name" => "House"})
category_6 = Category.new({ "name" => "Car"})

category_1.save()
category_2.save()
category_3.save()
category_4.save()
category_5.save()
category_6.save()

vendor_1 = Vendor.new({"name" => "Nandos"})
vendor_2 = Vendor.new({"name" => "Tesco"})
vendor_3 = Vendor.new({"name" => "Topshop"})
vendor_4 = Vendor.new({"name" => "Chanter"})

vendor_1.save()
vendor_2.save()
vendor_3.save()
vendor_4.save()

transaction_1 = Transaction.new({
  "category_id" => category_1.id,
  "vendor_id" => vendor_1.id,
  "amount" => 20,
  "transaction_date" => "2017/12/19"
  })
transaction_2 = Transaction.new({
  "category_id" => category_2.id,
  "vendor_id" => vendor_2.id,
  "amount" => 50,
  "transaction_date" => "2017/11/01"
  })
transaction_3 = Transaction.new({
  "category_id" => category_4.id,
  "vendor_id" => vendor_3.id,
  "amount" => 30,
  "transaction_date" => "2017/10/31"
  })


transaction_1.save()
transaction_2.save()
transaction_3.save()

account = Account.new({
  "name" => "Alison"
  })

account.save()





binding.pry
nil
