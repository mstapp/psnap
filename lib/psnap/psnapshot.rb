module PSnap
  class PSnapshot
    # options - a Hash of symbols to values:
    #           :option - 'ps' option to measure (%cpu, rss, etc.)
    #           'ignore-case' - ignore case when matching
    def initialize(options)
      @options = options
    end

    # Measure the specified 'ps' option for the given process
    def snapshot(process_name)
      @process_name = process_name
      @ignore_case = (@options['ignore-case']) ? "-i" : nil
      @pid = get_pid
      open_output_file
      show_message
      capture_data
    end

  private

    def get_pid
    end

    def open_output_file
    end

    def show_message
      puts "ps #{@ignore_case} process = #{@process_name}"
    end

    def capture_data
    end


  end
end
