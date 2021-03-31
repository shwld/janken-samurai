namespace :ragnarok do
  desc "ラグナロク"
  task :do => :environment do
    User.all.each do |user|
      user.destroy
    end
  end
end
