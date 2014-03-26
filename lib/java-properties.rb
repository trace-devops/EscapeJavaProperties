require 'java-properties/version'
require 'java-properties/properties'
require 'java-properties/encoding'
require 'java-properties/parsing'
require 'java-properties/generating'

# A module to read and write Java properties files
module JavaProperties

  # Parses the content of a Java properties file
  # @see Parsing::Parser
  # @param text [String]
  # @return [Properties]
  def self.parse(text)
    Parsing::Parser.parse(text)
  end

  # Generates the content of a Java properties file
  # @see Generating::Generator
  # @param hash [Hash] 
  # @param options [Hash] options for the generator
  # @return [String]
  def self.generate(hash, options = {})
    Generating::Generator.generate(hash, options)
  end

  # Loads and parses a Java properties file
  # @see Parsing::Parser
  # @param path [String]
  # @param encoding [String]
  # @param allow_invalid_byte_sequence [Boolean]
  # @return [Properties]
  def self.load(path, encoding = 'UTF-8', allow_invalid_byte_sequence = true)
      parse(File.read(path).encode(encoding, 'binary', allow_invalid_byte_sequence ? {invalid: :replace, undef: :replace} : {} ))
  end

  # Generates a Java properties file
  # @see Generating::Generator
  # @param hash [Hash]
  # @param path [String]
  # @param options [Hash] options for the generator
  def self.write(hash, path, options = {})
    File.write(path, generate(hash, options))
  end

end