
module PSnap
  class PSnapshot
    # options - a Hash of symbols to values:
    #           :option - 'ps' option to measure (%cpu, rss, etc.)
    #           'ignore-case' - ignore case when matching
    def initialize(options)
      @options = options
      @is_stop = false

      trap("INT"){ shutdown }
      trap("TERM"){ shutdown }
    end

    def shutdown
      @is_stop = true
      puts "\n"
    end

    # Measure the specified 'ps' option for the given process
    def snapshot(process_name)
      @process_name = process_name
      @ignore_case = (@options['ignore-case']) ? "-i" : nil
      @pid = get_pid
      open_output_file
      show_message if @options['verbose']
      capture_data # blocks until ctrl-c interrupts, then returns here
      close_output_file
    end

  private

    def get_pid
      regx = Regexp.new(@process_name, (@options['ignore-case']) ? Regexp::IGNORECASE : nil)
      pid_list = `ps -ax -o pid,comm`.split("\n").select {|ps_row| regx.match(ps_row)}
      fatal_error "Found #{pid_list.count} processes with names like '#{@process_name}' -- specify PID instead, or be more specific" if (pid_list.count > 1)
      return pid_list[0].split.at(0).to_i if !pid_list.empty?
      fatal_error "No process matches '#{@process_name}'"
    end

    def open_output_file
      #fname = 'cpu.txt'
      #File.delete fname if File.exists? fname
    end

    def close_output_file
    end

    def show_message
      puts "Process = #{@process_name}, pid = #{@pid}"
    end

    def capture_data
      # one-liner shell command (replace 1111 with pid):
      #     rm cpu.txt ; while [ true ]; do  cpu=`ps -axc -o %cpu,command,pid 1111 | sed '1d' | awk '{ print $1 }'` ; echo $cpu ; echo $cpu >> cpu.txt ; sleep .5; done

      while !@is_stop do
        ps = `ps -axc -o %cpu #{@pid}`.split("\n")
        fatal_error "Process not found" if ps.count < 2
        puts ps[1].strip
        sleep 0.5
      end
    end

    def fatal_error(msg)
      require 'methadone'
      Methadone::Main.exit_now! msg
    end

  end
end

