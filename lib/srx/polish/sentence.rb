#encoding: utf-8
require 'stringio'
require 'term/ansicolor'
module SRX
  module Polish
  RULES =
[["(?:\\badw\\.\\s)|(?:\\bafr\\.\\s)|(?:\\bakad\\.\\s)|(?:\\b[Aa]l\\.\\s)|(?:\\bam\\.\\s)|(?:\\bamer\\.\\s)|(?:\\barch\\.\\s)|(?:\\b[Aa]rt\\.\\s)|(?:\\bartyst\\.\\s)|(?:\\bastr\\.\\s)|(?:\\baustr\\.\\s)|(?:\\bbałt\\.\\s)|(?:\\bbdb\\.\\s)|(?:\\bbł\\.\\s)|(?:\\bbm\\.\\s)|(?:\\bbr\\.\\p{Pe}?\\s)|(?:\\bbry[gt]\\.\\s)|(?:\\bcentr\\.\\s)|(?:\\bces\\.\\s)|(?:\\bchem\\.\\s)|(?:\\bchiń\\.\\s)|(?:\\bchir\\.\\s)|(?:\\bc\\.k\\.\\s)|(?:\\bc\\.o\\.\\s)|(?:\\bcyg\\.\\s)|(?:\\bcyw\\.\\s)|(?:\\bcyt\\.\\s)|(?:\\bczes\\.\\s)|(?:\\bczw\\.\\s)|(?:\\b[Cc]d\\.\\s)|(?:\\bczyt\\.\\s)|(?:\\bćw\\.\\s)|(?:\\bćwicz\\.\\s)|(?:\\bdaw\\.\\s)|(?:\\bdcn\\.\\s)|(?:\\bdekl\\.\\s)|(?:\\bdemokr\\.\\s)|(?:\\bdet\\.\\s)|(?:\\bdiec\\.\\s)|(?:\\bdł\\.\\s)|(?:\\bdn\\.\\s)|(?:\\bdo[tlp]\\.\\s)|(?:\\bdost\\.\\s)|(?:\\bdosł\\.\\s)|(?:\\bh\\.c\\.\\s)|(?:\\bds\\.\\s)|(?:\\bdst\\.\\s)|(?:\\bduszp\\.\\s)|(?:\\bdypl\\.\\s)|(?:\\begz\\.\\s)|(?:\\bekol\\.\\s)|(?:\\bekon\\.\\s)|(?:\\belektr\\.\\s)|(?:\\bem\\.\\s)|(?:\\bew\\.\\s)|(?:\\bfab\\.\\s)|(?:\\bfarm\\.\\s)|(?:\\bfot\\.\\s)|(?:\\bfr\\.\\s)|(?:\\bgat\\.\\s)|(?:\\bgastr\\.\\s)|(?:\\bgeogr\\.\\s)|(?:\\bgeol\\.\\s)|(?:\\bgimn\\.\\s)|(?:\\bgłęb\\.\\s)|(?:\\bgm\\.\\s)|(?:\\bgodz\\.\\s)|(?:\\bgórn\\.\\s)|(?:\\bgosp\\.\\s)|(?:\\bgr\\.\\s)|(?:\\bgram\\.\\s)|(?:\\bhist\\.\\s)|(?:\\bhiszp\\.\\s)|(?:\\b[Hh]r\\.\\s)|(?:\\bhot\\.\\s)|(?:\\bid\\.\\s)|(?:\\bin\\.\\s)|(?:\\bim\\.\\s)|(?:\\biron\\.\\s)|(?:\\bjn\\.\\s)|(?:\\bkard\\.\\s)|(?:\\bkat\\.\\s)|(?:\\bkatol\\.\\s)|(?:\\bk\\.k\\.\\s)|(?:\\bkk\\.\\s)|(?:\\bko?l\\.\\s)|(?:\\bk\\.p\\.a\\.\\s)|(?:\\bkpc\\.\\s)|(?:\\bk\\.p\\.c\\.\\s)|(?:\\bkpt\\.\\s)|(?:\\bkr\\.\\s)|(?:\\bk\\.r\\.\\s)|(?:\\bkrak\\.\\s)|(?:\\bk\\.r\\.o\\.\\s)|(?:\\bkryt\\.\\s)|(?:\\bkult\\.\\s)|(?:\\blaic\\.\\s)|(?:\\błac\\.\\s)|(?:\\bniem\\.\\s)|(?:\\bwoj\\.\\s)|(?:\\b[Nn][bp]\\.\\s)|(?:\\bpo[lw]\\.\\s)|(?:\\bm\\.in\\.\\s)|(?:\\b[Pp][ts]\\.\\s)|(?:\\bcdn\\.\\s)|(?:\\bjw\\.\\s)|(?:\\b[Rr]y[cs]\\.\\s)|(?:\\btj\\.\\s)|(?:\\b[Tt]zw\\.\\s)|(?:\\btzn\\.\\s)|(?:\\bzob\\.\\s)|(?:\\bang\\.\\s)|(?:\\bu[lb]\\.\\s?)|(?:\\bp[wnl]\\.\\s)|(?:\\bal\\.\\s)|(?:\\bk\\.\\s)|(?:\\bn\\.\\s)",
  nil,
  false],
 ["(?:\\b[Oo]k\\.\\s)", "[\\p{Ll}\\d]", false],
 ["(?:\\b[\\d,\\.]*ty[sś]\\.\\p{Pe}?\\s)", nil, false],
 ["(?:\\b[Nn]r\\.\\s)", "\\d", false],
 ["(?:\\bw[wł]\\.\\s)|(?:\\bur\\.\\s)|(?:\\bzm\\.\\s)|(?:\\bżyd\\.\\s)|(?:\\bżarg\\.\\s)|(?:\\bżyw\\.\\s)|(?:\\bwył\\.\\s)|(?:\\b[bu]p\\.\\s)|(?:\\bwyst\\.\\s)",
  nil,
  false],
 ["(?:\\b(?i)mazeł\\stow\\.\\s)", nil, true],
 ["(?:\\b[Tt]ow\\.\\s)|(?:\\bo\\.\\s)|(?:\\b(?:[sS]p|st|[Ss]półdz|społ|spółgł|[Ss]to[łw])\\.\\s)|(?:\\bzn\\.\\s)|(?:\\bzew\\.\\s)|(?:\\bzewn\\.\\s)|(?:\\bzdr\\.\\s)|(?:\\bzazw\\.\\s)|(?:\\bzast\\.\\s)|(?:\\bzaw\\.\\s)|(?:\\bzał\\.\\s)|(?:\\bzal\\.\\s)|(?:\\bzam\\.\\s)|(?:\\bzak\\.\\s)|(?:\\bzakł\\.\\s)|(?:\\bzagr\\.\\s)|(?:\\bzach\\.\\s)|(?:\\b[Aa]dw\\.\\s)|(?:\\b[Ll]ek\\.\\s)|(?:\\bmed\\.\\s)|(?:\\b[Mm]ec\\.\\s)|(?:\\b[Dd]oc\\.\\s)|(?:\\b[Dd]y[wr]\\.\\s)|(?:\\b[Ii]nż\\.\\s)|(?:\\b(?i)mgr\\.\\s)|(?:\\b[dD][hr]\\.\\s)",
  nil,
  false],
 ["(?:\\b[pP]\\.\\s)", "\\p{Lu}\\p{Ll}+", false],
 ["(?:\\b[Rr]ed\\.\\)?\\s)|(?:\\b(?i)pro[fk]\\.\\s)|(?:\\bhab\\.\\s)|(?:\\b[Pp]łk\\.\\s)|(?:\\b(?:[Nn]a|[Pp]o)dkom\\.\\s)|(?:\\b[kK]s\\.\\s)|(?:\\b(?i)gen\\.\\s)|(?:\\b(?i)por\\.\\s)|(?:\\b[Rr]eż\\.\\s)|(?:\\b[Pp]rzyp\\.\\s)|(?:\\b[śŚ][pwW]\\.\\s)",
  nil,
  false],
 ["(?:\\betc\\.\\s)", "\\p{Ll}", false],
 ["(?:\\bit[dp]\\.\\s)", "[„”\"]?\\p{Ll}", false],
 ["(?:\\bproc\\.\\)?\\s)", "\\p{Ll}|\\p{Lu}\\p{Lu}+", false],
 ["(?:\\b[rwn]\\.\\s)|(?:\\bit[dp]\\.\\s)|(?:\\bcdn\\.\\s)", "\\p{Ll}", false],
 ["(?:\\b[Ss]zer\\.\\s)", nil, false],
 ["(?:\\bjw\\.\\s)|(?:\\bn\\.e\\.\\s)|(?:\\bw\\.\\s)|(?:\\bn[tn]\\.\\s)|(?:\\b[dm]l\\.\\s)|(?:\\bdag\\.\\s)|(?:\\b[cd]?m\\.\\s)|(?:\\b[Zz][Łł]\\.\\s)|(?:\\b[Gg][rR]\\.\\s)|(?:\\b[d]?kg\\.\\s)|(?:\\bml[nd]\\.\\s)|(?:\\bnpl\\.\\s)",
  "\\p{Ll}",
  false],
 ["(?:\\bpkt\\.\\s)|(?:\\bstr\\.\\s)|(?:\\b[Tt]ab\\.\\s)",
  "[\\p{Ll}\\d]",
  false],
 ["(?:\\btel\\.\\s)", nil, false],
 ["(?:\\b[ptw]g\\.\\s)|(?:\\bcos\\.\\s)|(?:\\bcosec\\.\\s)|(?:\\bsec\\.\\s)|(?:\\bsin\\.\\s)|(?:\\brkm\\.\\s)",
  "\\p{Ll}",
  false],
 ["(?:\\bust\\.\\s)|(?:\\bpar\\.\\s)", "\\d", false],
 ["(?:\\blit\\.\\s)", "\\p{Ll}\\p{Pe}?\\p{P}?\\s", false],
 ["(?:\\b[Pp]on\\.\\s)|(?:\\b[Ss]ob\\.\\s)|(?:\\bba!\\s)", "\\p{Ll}", false],
 ["(?:\\bpo[zk]\\.\\s)|(?:\\b[Oo][Oo]\\.\\s)", nil, false],
 ["(?:\\b(?:[CDSR]z|Ch)\\.\\s)", "\\p{Ll}", false],
 ["(?:\\b[rls]\\.\\s)", "[1-9]+", false],
 ["(?:\\b[,uoi]\\ss\\.\\s)|(?:\\b[Nn]ajśw\\.\\s)|(?:\\b[Nn]a\\sos\\.\\s)",
  nil,
  false],
 ["(?:\\bmin\\.\\s)", "[\\p{Ll}\\d]", false],
 ["(?:\\bDz\\.\\s?U\\.\\s)", nil, false],
 ["(?:\\bW\\s\\d{4}\\sr\\.\\s)", "[\\p{Lu}–—„\"-]", false],
 ["(?:\\b\\d+\\.\\s)", "\\p{Ll}|\\p{Lu}{2,}", false],
 ["(?:\\b\\p{L}\\.\\s)", "\\p{L}\\.\\s", false],
 ["(?:\\b\\p{L}\\.)", "\\p{L}\\.", false],
 ["(?:\\.\\p{L}+\\.\\s)", "\\p{Ll}", false],
 ["(?:[\\s\\(\\[][\\p{L}&&[^rwn]]\\.\\s+)",
  "\\p{Ll}\\p{Ll}|\\p{Lu}[\\p{Punct}\\p{Lu}]",
  false],
 ["(?:['\"„][\\.!?…]['\"”]\\s)", nil, false],
 ["(?:[\"”']\\s*)", "\\s*\\p{Ll}", false],
 ["(?:[!?]+\\p{Pe} )", "\\p{Ll}", false],
 ["(?:[\\p{Ps}][!?]+[\\p{Pe}] )", nil, false],
 ["(?:[\\[\\(]*\\.\\.\\.[\\]\\)]* )|(?:[\\[\\(]*…[\\]\\)]* )",
  "\\p{Ll}",
  false],
 ["(?:\\b\\p{Lu}\\.\\s\\p{Lu}\\.\\s)|(?:\\b\\p{Lu}\\.\\p{Lu}\\.\\s)",
  nil,
  false],
 ["(?:\\b\\p{Lu}\\p{Ll}\\.\\s?)|(?:\\.\\p{Lu}\\p{Ll}\\.\\s?)",
  "\\p{Lu}[^\\p{Lu}]",
  false],
 ["(?:\\s(?<!\\.)[„\"\\p{Ps}]?[A-Z]\\.\\s)|(?:^[„\"]?[A-ZŚĆŻŹ]\\.\\s)",
  "\\p{Ll}|\\p{Lu}\\p{Ll}\\p{Ll}+",
  false],
 ["(?:\\s[A-Z]\\.\\s)", "\\(\\d", false],
 ["(?:[\\p{Ll}&&[^aeouiyęąó]][\\p{Ll}&&[^aeouiyęąó]]+\\.\\s)",
  "\\p{Ll}+",
  false],
 ["(?:[\\.!?…]+['\"\\p{Pe}\\u00BB\\u2019\\u201D\\u203A\\u0002]*\\s)",
  "[\\p{Ps}–—-]\\s?\\p{Ll}",
  false],
 ["(?:[\\.!?…]['\"\\u00BB\\u2019\\u201D\\u203A\\u0002]*\\p{Pe}\\s)",
  "\\p{Ll}",
  false],
 ["(?:[\\.!?…]['\"\\p{Pe}\\u00BB\\u2019\\u201D\\u203A\\u0002]*\\s)",
  nil,
  true],
 ["(?:[\\.!?…]['»\"”\\p{Pe}]*)", "\\p{Lu}[^\\p{Lu}\\.]", true],
 ["(?:\\s\\p{L}[\\.!?…]\\s)", "\\p{Lu}\\p{Ll}", true],
 ["(?:\\r?\\n)|(?:\\r?\\n\\s*\\r?\\n[\\t]*)", nil, true]]
    BEFORE_RE = /(?:#{RULES.map{|s,e,v| "(#{s})"}.join("|")})\Z/m
    REGEXPS = RULES.map{|s,e,v| [/(#{s})\Z/m,/\A(#{e})/m,v] }
    FIRST_CHAR = /\A./m

    class Sentence
      attr_accessor :input
      attr_writer :debug

      def initialize(text=nil)
        if text.is_a?(String)
          @input = StringIO.new(text,"r:utf-8")
        else
          @input = text
        end
      end

      def each
        buffer_length = 10
        sentence = ""
        before_buffer = ""
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
