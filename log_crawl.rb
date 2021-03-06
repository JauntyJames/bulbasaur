class Log
  attr_reader :not_founds, :redirection, :server_error

  def initialize file
    @log = File.open( file )
    @not_founds = Hash.new(0)
    @load_times = []
    @databases = Hash.new(0)
    @redirection = false
    @server_error = []

    @log.each_line do |line|
      if line.match('status=404')
        path = line.slice(/(?<=path=).+?(?=\s)/).reverse.chomp('"').reverse.chomp('"')
        @not_founds[path] += 1
      end

      if line.match('service=')
        @load_times << line.slice(/(?<=service=)\d+/).to_i
      end

      if line.match('SELECT')

        @databases[line.slice(/(?<=FROM ")\w+/)] += 1
      end

      if line.match(/status=30\d/)
        @redirection = true;
      end

      if line.match(/status=50\d/)
        @server_error << line
      end
    end
  end

  def avg_load
    @load_times.inject { |sum, n| sum + n } / @load_times.length
  end

  def most_common_db
    @databases.max_by { |key, value| value }[0]
  end
end

test_log = Log.new('2014-09-03.log')

puts test_log.not_founds
puts test_log.avg_load
puts test_log.most_common_db
puts test_log.redirection
