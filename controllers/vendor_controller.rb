require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative("../models/vendor.rb")

get("/vendors") do
  @vendors = Vendor.all()
  erb(:"vendors/index")
end

get("/vendors/new") do
  erb(:"vendors/new")
end

post("/vendors") do
  @new_vendor = Vendor.new(params)
  @new_vendor.save()
  redirect"/vendors"
end
