# db/seeds.rb

# you can wrap this in a user-finding block if you know which user:
user = User.find_by(username: 'your_username_here') || User.first

%w(Academic Work Personal).each do |cat_name|
  user.categories.find_or_create_by!(name: cat_name)
end
