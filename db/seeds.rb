require 'faker'

# Seed Users
# user = {}
# user['password'] = 'asdf'

# ActiveRecord::Base.transaction do
#   20.times do 
#     user['username'] = Faker::Name.unique.name 
#     user['email'] = Faker::Internet.email
#     user['age'] = rand(18..60)
#     User.create(user)
#   end
# end 

# Seed items
item = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  20.times do 
    item['name'] = Faker::App.name
    item['description'] = ['Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam auctor velit ut ligula fermentum, sed tristique risus aliquam. Sed blandit orci urna. Aliquam scelerisque, dolor et mattis rhoncus, purus erat pharetra ipsum, ut iaculis nisl dui nec mauris.', 'Donec sed egestas libero. Suspendisse at sapien leo. Nullam maximus vulputate pretium. Vestibulum id pharetra libero. Proin vitae ante nulla.'].sample
    item['category'] = ['art', 'beauty', 'books', 'clothing', 'property', 'other'].sample

    item['price'] = rand(80..500)
    item['condition'] = ['new', 'used'].sample
    item['user_id'] = uids.sample
    Item.create(item)
  end
end