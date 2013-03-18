=begin

  made by Wooseong(Steven) Kim - 2013. 03. 18.

  * Instruction - You should try 1~3 for N times. (N = The number of languages you localized)
  
  1. put your "Localizable.strings" file and this ruby file to same directory.
  2. run this / ex) in terminal, $ruby LocalizationConverting_iOS_To_Android.rb
  3. copy strings.xml to your Android Project.
  
  For further question, contact kwosu87@me.com. 
  Thank you.
  
=end

# open an file
stringsFile = File.open('strings.xml', 'wb')

stringsFile.puts "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
stringsFile.puts "<resources>"

File.open('Localizable.strings') {
  # parsing an iOS Localizable.strings (Localizing file)
  
  |file| file.each_line {
    |line| 
    
      # check comments if there are.
      # need to convert // to <!-- -->>
      if line =~ /\/\//
        line = line.strip
        line = line.gsub(/\/\//, "<!--")
        line += " -->"
        line = "\t" + line
        # puts "\n"
        stringsFile.puts "\n"
        # puts line
        stringsFile.puts line
      end
      
      # main localized strings
      # "KEY" = "VALUE" => <string name="KEY">VALUE</string>
      if line =~ /"/
        line = line.strip
        array = line.split("=")
        
        leftHand = array[0]
        leftHandArray = leftHand.split("\"")
        # puts leftHandArray[1]
        leftHand = leftHandArray[1]        
        leftHand = "<string name=\"" + leftHand + "\">"
        
        rightHand = array[1]
        rightHandArray = rightHand.split("\"")
        # puts rightHandArray[1]
        rightHand = rightHandArray[1]
        
        line = leftHand + rightHand
        line += "</string>"
        line = "\t" + line
        # puts line
        stringsFile.puts line
      end
  }
  
  stringsFile.puts "</resources>"
  stringsFile.close
  stringsFile = File.open('strings.xml')

  stringsFile.each_line {
    |line| puts line
  }
}
