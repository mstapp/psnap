
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
      if (@pid)
        open_output_file
        show_message
        capture_data
        close_output_file
      end
    end

  private

    def get_pid
      pid_list = `ps -ax -o pid,comm`.split("\n").select {|ps_row| ps_row =~ /#{@process_name}/}
      if (pid_list.count > 1)
        exit_now "Found #{pid_list.count} processes with names like '#{@process_name}' -- specify PID instead, or be more specific"
        return nil
      end
      return pid_list[0].split.at(0).to_i if !pid_list.empty?
      exit_now "No process match '#{@process_name}'"
    end

    def open_output_file
      #fname = 'cpu.txt'
      #File.delete fname if File.exists? fname
    end

    def close_output_file
    end

    def show_message
      puts "ps #{@ignore_case} process = #{@process_name}, pid = #{@pid}"
    end

    def capture_data
      # one-liner shell command:
      # rm cpu.txt ; while [ true ]; do  cpu=\`ps -v -p #{@pid} | sed '1d' | awk '{ print $11 }'\` ; echo $cpu ; echo $cpu >> cpu.txt ; sleep .5; done

      while !@is_stop do
        cpu = `ps -v -p #{@pid} | sed '1d' | awk '{ print $11 }'`
        puts cpu
        sleep 0.5
      end
    end

    def exit_now(msg)
      require 'methadone'

      Methadone::Main.exit_now! msg
    end

  end
end
