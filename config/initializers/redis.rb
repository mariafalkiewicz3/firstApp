if Rails.env.production?
  $redis = Redis.new(host: ENV["redis://h:p5545f175b864e8ee3ef478a7e3f8fde9b68f8868115deff1a316976b9689267f@ec2-54-210-98-224.compute-1.amazonaws.com:22059"])
else
  $redis = Redis.new(host: 'localhost', port: 6379)
end