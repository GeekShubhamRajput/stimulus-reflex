usernames = %w{Shubham Vijay Ravi Chintu}
usernames.each do |name|
  User.create(name: name, age: 20, status: User.statuses.keys.sample)
end
puts "Users created successfully"
