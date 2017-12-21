require_relative("../models/category")
require_relative("../models/vendor")
require_relative("../models/transaction")
require_relative("../models/account")
require("pry-byebug")

Transaction.delete_all()
Category.delete_all()
Vendor.delete_all()

category_1 = Category.new({ "name" => "Food"})
category_2 = Category.new({ "name" => "Accommodation"})
category_3 = Category.new({ "name" => "Travel"})
category_4 = Category.new({ "name" => "Activities"})
category_5 = Category.new({ "name" => "Socialising"})

category_1.save()
category_2.save()
category_3.save()
category_4.save()
category_5.save()

vendor_1 = Vendor.new({"name" => "MacDonalds"})
vendor_2 = Vendor.new({"name" => "Wombats Hostel"})
vendor_3 = Vendor.new({"name" => "Wombat's Bar"})
vendor_4 = Vendor.new({"name" => "Walking Tour"})
vendor_5 = Vendor.new({"name" => "Train"})

vendor_1.save()
vendor_2.save()
vendor_3.save()
vendor_4.save()
vendor_5.save()

transaction_1 = Transaction.new({
  "category_id" => category_1.id,
  "vendor_id" => vendor_1.id,
  "amount" => 10,
  "transaction_date" => "2017/12/19",
  "comment" => "Lost so went to MacDonalds!"
  })
transaction_2 = Transaction.new({
  "category_id" => category_2.id,
  "vendor_id" => vendor_2.id,
  "amount" => 25,
  "transaction_date" => "2017/11/01",
  "comment" => "Hostel in Munich"
  })
transaction_3 = Transaction.new({
  "category_id" => category_5.id,
  "vendor_id" => vendor_3.id,
  "amount" => 30,
  "transaction_date" => "2017/10/31",
  "comment" => "Night out with new friends!"
  })
transaction_4 = Transaction.new({
  "category_id" => category_3.id,
  "vendor_id" => vendor_5.id,
  "amount" => 60,
  "transaction_date" => "2017/10/31",
  "comment" => "Train from Milan to Munich"
  })


transaction_1.save()
transaction_2.save()
transaction_3.save()
transaction_4.save()

account = Account.new({
  "name" => "Alison"
  })

account.save()





binding.pry
nil
