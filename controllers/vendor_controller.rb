require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative("../models/vendor.rb")

get("/vendors") do
  @vendors = Vendor.all()
  erb(:"vendors/index")
end
