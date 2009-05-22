#!/usr/bin/env ruby

desc "Get the latest Tweets by Boston Rubyists"
task :get_tweets => :environment do
  Cron.get_tweets
end

task :get_blogs => :environment do
  Feed.fetch_stale!
end
