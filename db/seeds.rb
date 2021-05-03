admin = Admin.find_or_create_by(first_name: 'admin', last_name: 'admin', email: 'admin@localhost.ru')
admin.password = 'admin'
admin.save

60.times do |i|
  u = [Manager, Developer].sample.new
  u.email = "email#{i}@mail.gen"
  u.first_name = "FN#{i}"
  u.last_name = "LN#{i}"
  u.password = "#{i}"
  u.save
end

author = Manager.first

60.times do |i|
  t = Task.new()
  t.author = author
  t.assignee = Developer.first
  t.name = "Name #{i}"
  t.description = "Description #{i}"
  t.save
end