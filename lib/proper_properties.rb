require 'proper_properties/version'
require 'proper_properties/properties'
require 'proper_properties/encoding'
require 'proper_properties/parsing'
require 'proper_properties/generating'

# A module to read and write Proper properties files
module ProperProperties

  # Parses the content of a Proper properties file
  # @see Parsing::Parser
  # @param text [String]
  # @return [Properties]
  def self.parse(text)
    Parsing::Parser.parse(text)
  end

  # Generates the content of a Proper properties file
  # @see Generating::Generator
  # @param hash [Hash] 
  # @param options [Hash] options for the generator
  # @return [String]
  def self.generate(hash, options = {})
    Generating::Generator.generate(hash, options)
  end

  # Loads and parses a Proper properties file
  # @see Parsing::Parser
  # @param path [String]
  # @param encoding [String]
  # @param allow_invalid_byte_sequence [Boolean]
  # @return [Properties]
  def self.load(path, encoding = 'UTF-8', allow_invalid_byte_sequence = true)
      parse(File.read(path).encode(encoding, 'binary', allow_invalid_byte_sequence ? {invalid: :replace, undef: :replace} : {} ))
  end

  # Generates a Proper properties file
  # @see Generating::Generator
  # @param hash [Hash]
  # @param path [String]
  # @param options [Hash] options for the generator
  def self.write(hash, path, options = {})
    File.write(path, generate(hash, options))
  end

end
