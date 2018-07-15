#encoding: utf-8
require 'stringio'
require 'term/ansicolor'
require_relative 'polish-rules'
module SRX
  module Polish
    extend Rules

    BEFORE_RE = /(?:#{self.rules.map{|s,e,v| "(#{s})"}.join("|")})\Z/m
    REGEXPS = self.rules.map{|s,e,v| [/(#{s})\Z/m,/\A(#{e})/m,v] }
    FIRST_CHAR = /\A./m

    class SentenceSplitter
      include Enumerable

      attr_accessor :input
      attr_writer :debug

      def initialize(text=nil)
        if text.is_a?(String)
          @input = StringIO.new(text,"r:utf-8")
        else
          @input = text
        end
        @debug = false
      end

      def each
        if block_given?
          raise "Invalid argument - text is nil" if @input.nil?
          buffer_length = 10
          sentence = ""
          before_buffer = ""
          @input.pos = 0
          after_buffer = buffer_length.times.map{|i| @input.readchar }.join("")
          while(!@input.eof?) do
            matched_before = BEFORE_RE.match(before_buffer)
            break_detected = false
            if matched_before
              (matched_before.size - 1).times.find do |index|
                matched_before[index+1]
              end
              if @debug
                puts "#{before_buffer}|#{after_buffer.gsub(/\n/,"\\n")}"
              end
              REGEXPS.each do |before_re,after_re,value|
                # skip the whole match
                if before_re.match(before_buffer) && after_re.match(after_buffer)
                  break_detected = true
                  if @debug
                    color = value ? :red : :green
                    sentence << Term::ANSIColor.send(color,"<#{before_re}:#{after_re}>")
                  end
                  if value
                    yield sentence
                    sentence = ""
                  end
                  break
                end
              end
            end
            next_after = @input.readchar
            before_buffer.sub!(FIRST_CHAR,"") if before_buffer.size >= buffer_length
            after_buffer.sub!(FIRST_CHAR,"")
            before_buffer << $&
              sentence << $&
              after_buffer << next_after
          end
          yield sentence + after_buffer unless sentence.empty? || after_buffer.empty?
        else
          enum_for(:each)
        end
      end
    end
  end
end
