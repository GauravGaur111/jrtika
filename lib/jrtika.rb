require 'java'
$CLASSPATH << File.expand_path(File.join('..', 'jar', 'tika-app-1.1.jar'))

class Jrtika

  # Read text and metadata from a file and return a hash containing both.
  #
  #   Jrtika.read file_path

  def self.read(file_path)
    @RESOURCE_NAME_KEY = ""

        is = java.io.FileInputStream.new(file_path)
        parser = org.apache.tika.parser.AutoDetectParser.new()

        handler = org.apache.tika.sax.BodyContentHandler.new(-1)
        meta = org.apache.tika.metadata.Metadata.new()

        meta.set(@RESOURCE_NAME_KEY,file_path)

        parser.parse(is, handler, meta)
        is.close()
        {:text => handler.toString(), :metadata => meta.toString()}

  end

end

