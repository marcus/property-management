require 'fileutils'

blank_gif       = File.dirname(__FILE__) + '/../../../public/images/lightbox/blank.gif'
close_gif       = File.dirname(__FILE__) + '/../../../public/images/lightbox/close.gif'
loading_gif     = File.dirname(__FILE__) + '/../../../public/images/lightbox/loading.gif'
next_gif        = File.dirname(__FILE__) + '/../../../public/images/lightbox/next.gif'
prev_gif        = File.dirname(__FILE__) + '/../../../public/images/lightbox/prev.gif'
lightbox_js     = File.dirname(__FILE__) + '/../../../public/javascripts/lightbox.js'
lightbox_css    = File.dirname(__FILE__) + '/../../../public/stylesheets/lightbox.css'

FileUtils.makedirs File.dirname(__FILE__) + '/../../../public/images/lightbox'

FileUtils.cp_r File.dirname(__FILE__) + '/public/images/blank.gif',         blank_gif      #unless File.exist?(blank_gif)
FileUtils.cp_r File.dirname(__FILE__) + '/public/images/close.gif',         close_gif      #unless File.exist?(close_gif)
FileUtils.cp_r File.dirname(__FILE__) + '/public/images/loading.gif',       loading_gif    #unless File.exist?(loading_gif)
FileUtils.cp_r File.dirname(__FILE__) + '/public/images/next.gif',          next_gif       #unless File.exist?(next_gif)
FileUtils.cp_r File.dirname(__FILE__) + '/public/images/prev.gif',          prev_gif       #unless File.exist?(prev_gif)
FileUtils.cp_r File.dirname(__FILE__) + '/public/javascripts/lightbox.js',  lightbox_js    #unless File.exist?(lightbox_js)
FileUtils.cp_r File.dirname(__FILE__) + '/public/stylesheets/lightbox.css', lightbox_css   #unless File.exist?(lightbox_css)

puts IO.read(File.join(File.dirname(__FILE__), 'README'))