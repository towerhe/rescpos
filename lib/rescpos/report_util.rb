module Rescpos
  module ReportUtil
    FONT_NORMAL = "\x00"
    FONT_BIG = "\x11"
    ALIGN_C = "\x01"
    ALIGN_L = "\x00"
    ALIGN_R = "\x02"

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
      formatted_text << align(options[:align_type]) if options[:align_type]
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

    def align(type)
      "\x1b\x61" << type.to_s
    end
    
    def table(data)
      table = Rescpos::Table.new(data)
      yield table
      # FIXME move the following logic into Rescpos::Table
      command = "\x1b\x44"
      table.positions.each do |position|
        command << position.chr
      end
      command << "\x00"
      table.headers.each do |header|
        command << header << "\x09" 
      end
      command << "\n"
      table.data.each do |item|
        table.keys.each do |key|
          if item.is_a? Hash
            command << "#{item[key]}"+"\x09"
          else
            command << "#{item.send(key)}"+"\x09"
          end
        end
        if table.data.at(-1) == item
          return command
        end
        command << "\n"
      end
      command
    end

    def horizontal_tab
      "\x09"
    end
    
    def ascii(value)
      value.to_s.unpack('U')[0].to_s(16)
    end
  end
end
