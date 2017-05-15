namespace :centiworks do

  desc 'list users with toot count, follow count'
  task list_users: :environment do
    # Users that never confirmed e-mail never signed in, means they
    # only have a user record and an avatar record, with no files uploaded
    puts "list-users:"
    User.all.each do |user|
      puts "%5d\t%s\t%s\t%5d\t" % ([user.id, user.account.username, user.created_at, user.account.statuses_count])
    end
  end

end
