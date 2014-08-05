=begin

  made by Wooseong(Steven) Kim - 2013. 03. 18.

  * Instruction - You should try 1~3 for N times. (N = The number of languages you localized)
  
  1. put your "strings.xml" file and this ruby file to same directory. 
  2. run this ruby script. / ex) in terminal, $ruby LocalizedStringsConvert_Android_To_iOS.rb
  3. copy Localizable.strings to your iOS Project.
  
  For further question, contact kwosu87@me.com. 
  Thank you.
  
=end

# open an file
stringsFile = File.open('strings.txt', 'wb')

File.open('strings.xml') {
  # parsing an Android XML (Localizing file)
  |file| file.each_line {
    |line| 
      if line =~ /<?xml/
        # puts line
      end

      if line =~ /<resources>/
        # puts line
      end
        
      if line =~ /<\/resources>/
        # puts line
      end
 
      # check comments if there are.
      # need to convert <!-- --> to // 
      if line =~ /<!-- .* -->/
        line = line.strip
        line = line.gsub(/<!--/, "//")
        line = line.gsub(/-->/, "")
        # puts "\n"
        stringsFile.puts "\n"
        # puts line
        stringsFile.puts line
      end
      
      # main localized strings
      if line =~ /<string name="/

        line = line.gsub(/<\/string>/, "")
        line = line.gsub(/<string name="/, "")
	line = line.split("\">")[1]

        # puts line
        stringsFile.puts line
      end
  }
}
