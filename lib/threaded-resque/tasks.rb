namespace :threaded_resque do
  task :setup

  desc "Alias for resque:workers"
  task :work => :workers 

  desc "Start multiple Resque workers, in separte threads."
  task :workers => [:preload, :setup] do
    abort "set WORKERS env var, e.g. $ WORKERS=critical:20,high:10 rake threaded_resque:workers" if ENV['WORKERS'].nil?
    require 'threaded-resque'
    workers = create_workers
    threads = start(workers)
    trap("INT") { stop(workers) }
    join(threads)
  end

  def create_workers
    qw = ENV['WORKERS'].split(',')
    queues = Hash[*qw.map{ |qw| qw.split(':') }.flatten]
    queues.map do |queue, count|
      count.to_i.times.map do 
        Threaded::Resque::Worker.new(queue.to_s)
      end
    end.flatten
  end

  def start(workers)
    workers.map do |w|
      Thread.new do
        w.work
      end
    end
  end

  def stop(workers)
    workers.each { |w| w.shutdown! } 
  end

  def join(threads)
    threads.each { |thread| thread.join }
  end
end

