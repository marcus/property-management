def random_color
  red, green, blue = rand*255,rand*255,rand*255
  color = dec2hex( (red*65536)+(green*255)+blue ).to_s
  color = color.length < 6 ? "0#{color}" : color
end


def dec2hex(number)
   number = Integer(number);
   hex_digit = "0123456789ABCDEF".split(//);
   ret_hex = ''
   while(number != 0)
      ret_hex = String(hex_digit[number % 16 ] ) + ret_hex
      number = number / 16
   end
   return ret_hex
end