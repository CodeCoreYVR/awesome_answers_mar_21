class HelloWorldJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later

    puts "----------------"
    puts "Running a job 🏃🏻‍♂️ 🏃🏻‍♀️"
    puts "----------------"
  end
end
=begin
# HelloWorldJob.perform_now
This will run the job synchronously (or in the foreground) meaning that it will not go in the que
HelloWorldJob.perform_later
This will insert the job in your que to be executed by a worker

rails jobs:work # to perform the tasks in the que we will use this comand to start the worker
http://localhost:3000/delayed_job # 👈🏻 we can use this url to view status of all the tasks 

=end
