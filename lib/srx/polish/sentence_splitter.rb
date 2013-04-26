#encoding: utf-8
require 'stringio'
require 'term/ansicolor'
module SRX
  module Polish
    RULES =
[["(?:\\b[Aa]l\\.\\s)|(?:\\b[Aa]rt\\.\\s)|(?:\\b[Cc]d\\.\\s)|(?:\\b[Hh]r\\.\\s)|(?:\\b[Nn][bp]\\.\\s)|(?:\\b[Pp][ts]\\.\\s)|(?:\\b[Rr]y[cs]\\.\\s)|(?:\\b[Tt]zw\\.\\s)|(?:\\b[\\d,\\.]*ty[sś]\\.\\p{Pe}?\\s)|(?:\\b[bu]p\\.\\s)|(?:\\badw\\.\\s)|(?:\\bafr\\.\\s)|(?:\\bakad\\.\\s)|(?:\\bal\\.\\s)|(?:\\bam\\.\\s)|(?:\\bamer\\.\\s)|(?:\\bang\\.\\s)|(?:\\barch\\.\\s)|(?:\\bartyst\\.\\s)|(?:\\bastr\\.\\s)|(?:\\baustr\\.\\s)|(?:\\bbałt\\.\\s)|(?:\\bbdb\\.\\s)|(?:\\bbm\\.\\s)|(?:\\bbr\\.\\p{Pe}?\\s)|(?:\\bbry[gt]\\.\\s)|(?:\\bbł\\.\\s)|(?:\\bc\\.k\\.\\s)|(?:\\bc\\.o\\.\\s)|(?:\\bcdn\\.\\s)|(?:\\bcentr\\.\\s)|(?:\\bces\\.\\s)|(?:\\bchem\\.\\s)|(?:\\bchir\\.\\s)|(?:\\bchiń\\.\\s)|(?:\\bcyg\\.\\s)|(?:\\bcyt\\.\\s)|(?:\\bcyw\\.\\s)|(?:\\bczes\\.\\s)|(?:\\bczw\\.\\s)|(?:\\bczyt\\.\\s)|(?:\\bdaw\\.\\s)|(?:\\bdcn\\.\\s)|(?:\\bdekl\\.\\s)|(?:\\bdemokr\\.\\s)|(?:\\bdet\\.\\s)|(?:\\bdiec\\.\\s)|(?:\\bdn\\.\\s)|(?:\\bdo[tlp]\\.\\s)|(?:\\bdost\\.\\s)|(?:\\bdosł\\.\\s)|(?:\\bds\\.\\s)|(?:\\bdst\\.\\s)|(?:\\bduszp\\.\\s)|(?:\\bdypl\\.\\s)|(?:\\bdł\\.\\s)|(?:\\begz\\.\\s)|(?:\\bekol\\.\\s)|(?:\\bekon\\.\\s)|(?:\\belektr\\.\\s)|(?:\\bem\\.\\s)|(?:\\bew\\.\\s)|(?:\\bfab\\.\\s)|(?:\\bfarm\\.\\s)|(?:\\bfot\\.\\s)|(?:\\bfr\\.\\s)|(?:\\bgastr\\.\\s)|(?:\\bgat\\.\\s)|(?:\\bgeogr\\.\\s)|(?:\\bgeol\\.\\s)|(?:\\bgimn\\.\\s)|(?:\\bgm\\.\\s)|(?:\\bgodz\\.\\s)|(?:\\bgosp\\.\\s)|(?:\\bgr\\.\\s)|(?:\\bgram\\.\\s)|(?:\\bgórn\\.\\s)|(?:\\bgłęb\\.\\s)|(?:\\bh\\.c\\.\\s)|(?:\\bhist\\.\\s)|(?:\\bhiszp\\.\\s)|(?:\\bhot\\.\\s)|(?:\\bid\\.\\s)|(?:\\bim\\.\\s)|(?:\\bin\\.\\s)|(?:\\biron\\.\\s)|(?:\\bjn\\.\\s)|(?:\\bjw\\.\\s)|(?:\\bk\\.\\s)|(?:\\bk\\.k\\.\\s)|(?:\\bk\\.p\\.a\\.\\s)|(?:\\bk\\.p\\.c\\.\\s)|(?:\\bk\\.r\\.\\s)|(?:\\bk\\.r\\.o\\.\\s)|(?:\\bkard\\.\\s)|(?:\\bkat\\.\\s)|(?:\\bkatol\\.\\s)|(?:\\bkk\\.\\s)|(?:\\bko?l\\.\\s)|(?:\\bkpc\\.\\s)|(?:\\bkpt\\.\\s)|(?:\\bkr\\.\\s)|(?:\\bkrak\\.\\s)|(?:\\bkryt\\.\\s)|(?:\\bkult\\.\\s)|(?:\\blaic\\.\\s)|(?:\\bm\\.in\\.\\s)|(?:\\bn\\.\\s)|(?:\\bniem\\.\\s)|(?:\\bp[wnl]\\.\\s)|(?:\\bpo[lw]\\.\\s)|(?:\\btj\\.\\s)|(?:\\btzn\\.\\s)|(?:\\bu[lb]\\.\\s?)|(?:\\bur\\.\\s)|(?:\\bw[wł]\\.\\s)|(?:\\bwoj\\.\\s)|(?:\\bwyst\\.\\s)|(?:\\bwył\\.\\s)|(?:\\bzm\\.\\s)|(?:\\bzob\\.\\s)|(?:\\bćw\\.\\s)|(?:\\bćwicz\\.\\s)|(?:\\błac\\.\\s)|(?:\\bżarg\\.\\s)|(?:\\bżyd\\.\\s)|(?:\\bżyw\\.\\s)",
  nil,
  false],
 ["(?:\\b[Oo]k\\.\\s)", "[\\p{Ll}\\d]", false],
 ["(?:\\b[Nn]r\\.\\s)", "\\d", false],
 ["(?:\\b(?i)mazeł\\stow\\.\\s)", nil, true],
 ["(?:['\"„][\\.!?…]['\"”]\\s)|(?:[\\p{Ps}][!?]+[\\p{Pe}] )|(?:\\b(?:[Nn]a|[Pp]o)dkom\\.\\s)|(?:\\b(?:[sS]p|st|[Ss]półdz|społ|spółgł|[Ss]to[łw])\\.\\s)|(?:\\b(?i)gen\\.\\s)|(?:\\b(?i)mgr\\.\\s)|(?:\\b(?i)por\\.\\s)|(?:\\b(?i)pro[fk]\\.\\s)|(?:\\bDz\\.\\s?U\\.\\s)|(?:\\b[,uoi]\\ss\\.\\s)|(?:\\b[Aa]dw\\.\\s)|(?:\\b[Dd]oc\\.\\s)|(?:\\b[Dd]y[wr]\\.\\s)|(?:\\b[Ii]nż\\.\\s)|(?:\\b[Ll]ek\\.\\s)|(?:\\b[Mm]ec\\.\\s)|(?:\\b[Nn]a\\sos\\.\\s)|(?:\\b[Nn]ajśw\\.\\s)|(?:\\b[Oo][Oo]\\.\\s)|(?:\\b[Pp]rzyp\\.\\s)|(?:\\b[Pp]łk\\.\\s)|(?:\\b[Rr]ed\\.\\)?\\s)|(?:\\b[Rr]eż\\.\\s)|(?:\\b[Ss]zer\\.\\s)|(?:\\b[Tt]ow\\.\\s)|(?:\\b[dD][hr]\\.\\s)|(?:\\b[kK]s\\.\\s)|(?:\\b[śŚ][pwW]\\.\\s)|(?:\\b\\p{Lu}\\.\\p{Lu}\\.\\s)|(?:\\b\\p{Lu}\\.\\s\\p{Lu}\\.\\s)|(?:\\bhab\\.\\s)|(?:\\bmed\\.\\s)|(?:\\bo\\.\\s)|(?:\\bpo[zk]\\.\\s)|(?:\\btel\\.\\s)|(?:\\bzach\\.\\s)|(?:\\bzagr\\.\\s)|(?:\\bzak\\.\\s)|(?:\\bzakł\\.\\s)|(?:\\bzal\\.\\s)|(?:\\bzam\\.\\s)|(?:\\bzast\\.\\s)|(?:\\bzaw\\.\\s)|(?:\\bzazw\\.\\s)|(?:\\bzał\\.\\s)|(?:\\bzdr\\.\\s)|(?:\\bzew\\.\\s)|(?:\\bzewn\\.\\s)|(?:\\bzn\\.\\s)",
  nil,
  false],
 ["(?:\\b[rls]\\.\\s)", "[1-9]+", false],
 ["(?:\\b[Tt]ab\\.\\s)|(?:\\bmin\\.\\s)|(?:\\bpkt\\.\\s)|(?:\\bstr\\.\\s)",
  "[\\p{Ll}\\d]",
  false],
 ["(?:\\bW\\s\\d{4}\\sr\\.\\s)", "[\\p{Lu}–—„\"-]", false],
 ["(?:[\\.!?…]+['\"\\p{Pe}\\u00BB\\u2019\\u201D\\u203A\\u0002]*\\s)",
  "[\\p{Ps}–—-]\\s?\\p{Ll}",
  false],
 ["(?:\\bit[dp]\\.\\s)", "[„”\"]?\\p{Ll}", false],
 ["(?:\\s[A-Z]\\.\\s)", "\\(\\d", false],
 ["(?:\\bpar\\.\\s)|(?:\\bust\\.\\s)", "\\d", false],
 ["(?:[!?]+\\p{Pe} )|(?:[\\.!?…]['\"\\u00BB\\u2019\\u201D\\u203A\\u0002]*\\p{Pe}\\s)|(?:[\\[\\(]*\\.\\.\\.[\\]\\)]* )|(?:[\\[\\(]*…[\\]\\)]* )|(?:\\.\\p{L}+\\.\\s)|(?:\\b(?:[CDSR]z|Ch)\\.\\s)|(?:\\b[Gg][rR]\\.\\s)|(?:\\b[Pp]on\\.\\s)|(?:\\b[Ss]ob\\.\\s)|(?:\\b[Zz][Łł]\\.\\s)|(?:\\b[cd]?m\\.\\s)|(?:\\b[d]?kg\\.\\s)|(?:\\b[dm]l\\.\\s)|(?:\\b[ptw]g\\.\\s)|(?:\\b[rwn]\\.\\s)|(?:\\bba!\\s)|(?:\\bcdn\\.\\s)|(?:\\bcos\\.\\s)|(?:\\bcosec\\.\\s)|(?:\\bdag\\.\\s)|(?:\\betc\\.\\s)|(?:\\bit[dp]\\.\\s)|(?:\\bjw\\.\\s)|(?:\\bml[nd]\\.\\s)|(?:\\bn[tn]\\.\\s)|(?:\\bn\\.e\\.\\s)|(?:\\bnpl\\.\\s)|(?:\\brkm\\.\\s)|(?:\\bsec\\.\\s)|(?:\\bsin\\.\\s)|(?:\\bw\\.\\s)",
  "\\p{Ll}",
  false],
 ["(?:[\\p{Ll}&&[^aeouiyęąó]][\\p{Ll}&&[^aeouiyęąó]]+\\.\\s)",
  "\\p{Ll}+",
  false],
 ["(?:[\\s\\(\\[][\\p{L}&&[^rwn]]\\.\\s+)",
  "\\p{Ll}\\p{Ll}|\\p{Lu}[\\p{Punct}\\p{Lu}]",
  false],
 ["(?:\\blit\\.\\s)", "\\p{Ll}\\p{Pe}?\\p{P}?\\s", false],
 ["(?:\\s(?<!\\.)[„\"\\p{Ps}]?[A-Z]\\.\\s)|(?:^[„\"]?[A-ZŚĆŻŹ]\\.\\s)",
  "\\p{Ll}|\\p{Lu}\\p{Ll}\\p{Ll}+",
  false],
 ["(?:\\bproc\\.\\)?\\s)", "\\p{Ll}|\\p{Lu}\\p{Lu}+", false],
 ["(?:\\b\\d+\\.\\s)", "\\p{Ll}|\\p{Lu}{2,}", false],
 ["(?:\\.\\p{Lu}\\p{Ll}\\.\\s?)|(?:\\b\\p{Lu}\\p{Ll}\\.\\s?)",
  "\\p{Lu}[^\\p{Lu}]",
  false],
 ["(?:\\b[pP]\\.\\s)", "\\p{Lu}\\p{Ll}+", false],
 ["(?:\\b\\p{L}\\.)", "\\p{L}\\.", false],
 ["(?:\\b\\p{L}\\.\\s)", "\\p{L}\\.\\s", false],
 ["(?:[\"”']\\s*)", "\\s*\\p{Ll}", false],
 ["(?:[\\.!?…]['\"\\p{Pe}\\u00BB\\u2019\\u201D\\u203A\\u0002]*\\s)|(?:\\r?\\n\\s*\\r?\\n[\\t]*)",
  nil,
  true],
 ["(?:[\\.!?…]['»\"”\\p{Pe}]*)", "\\p{Lu}[^\\p{Lu}\\.]", true],
 ["(?:\\s\\p{L}[\\.!?…]\\s)", "\\p{Lu}\\p{Ll}", true]]
    BEFORE_RE = /(?:#{RULES.map{|s,e,v| "(#{s})"}.join("|")})\Z/m
    REGEXPS = RULES.map{|s,e,v| [/(#{s})\Z/m,/\A(#{e})/m,v] }
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
        raise "Invalid argument - text is nil" if @input.nil?
        buffer_length = 10
        sentence = ""
        before_buffer = ""
        @input.pos = 0
        after_buffer = buffer_length.times.map{|i| @input.readchar}.join("")
        matched_rule = nil
        while(!@input.eof?) do
          matched_before = BEFORE_RE.match(before_buffer)
          break_detected = false
          if matched_before
            start_index = (matched_before.size - 1).times.find do |index|
              matched_before[index+1]
            end
            if @debug
              puts "#{before_buffer}|#{after_buffer.gsub(/\n/,"\\n")}"
            end
            REGEXPS.each do |before_re,after_re,value|
              # skip the whole match
              if before_re.match(before_buffer) && after_re.match(after_buffer)
                break_detected = true
                color = value ? :red : :green
                if @debug
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
      end
    end
  end
end
