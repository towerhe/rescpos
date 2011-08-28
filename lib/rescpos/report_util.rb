module Rescpos
  module ReportUtil
    def single_splitline
      "-" * 42
    end

    def double_splitline
      "=" * 42
    end

    def underline(number)
      "_" * number
    end

    def chinese(chinese)
      text = Iconv.iconv("GBK//IGNORE","UTF-8//IGNORE",chinese)
      text[0]
    end

    def text(txt, options = {}) 
      formatted_text = ''
      formatted_text << fontsize(options[:font_size]) if options[:font_size]
      formatted_text << grayscale(options[:gray]) if options[:gray]
      formatted_text << txt if txt
    end
    
    def fontsize(size)
      "\x1d\x21" << ascii(size)
    end

    def grayscale(value)
      "\x1b\x6d" << ascii(value)
    end

    def labelandvalue(label, value)
      "#{label}:#{value}"
    end

    def align(format)
      if format == 'C'
        return "\x1b\x61\x01"
      elsif format == 'L'
        return "\x1b\x61\x00"
      elsif format == 'R'
        return "\x1b\x61\x02"
      end
    end
    
    def table(positions)
      command = "\x1b\x44"
      for position in positions
        command << ascii(position)
      end
      command << "\x00"
    end

    def horizontal_tab
      "\x09"
    end
    
    def ascii(value)
      value.to_s.unpack('U')[0].to_s(16)
    end
  end
end
