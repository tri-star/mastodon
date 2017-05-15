
User.transaction do
  User.all.each do |user|
    if user.column_settings.length == 0
      puts "%s: initialize columns." % user.account.username
      user.initialize_user
    else
      puts "%s: already initialized.\n" % user.account.username
    end
  end
  puts "Done."
end
