module Rescpos
  module ReportUtil
    FONT_NORMAL = "\x00"
    FONT_BIG = "\x11"

    def single_splitline
      text("-" * 42, :font_size => FONT_NORMAL)
    end

    def double_splitline
      text("=" * 42, :font_size => FONT_NORMAL)
    end

    def underline(number)
      text("_" * number, :font_size => FONT_NORMAL)
    end

    def chinese(chinese)
      text = Iconv.iconv("GBK//IGNORE","UTF-8//IGNORE",chinese)
      text[0]
    end

    def text(txt, options = {}) 
      font_size = options[:font_size] || FONT_NORMAL
      formatted_text = ''
      formatted_text << fontsize(font_size)
      formatted_text << grayscale(options[:gray]) if options[:gray]
      formatted_text << txt if txt
    end
    
    def fontsize(size)
      "\x1d\x21" << size.to_s
    end

    def grayscale(value)
      "\x1b\x6d" << ascii(value)
    end

    def key_value(label, value)
      "#{label}: #{value}"
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
