require 'escape_java_properties/encoding/special_chars'
require 'escape_java_properties/encoding/separators'
require 'escape_java_properties/encoding/unicode'

module EscapeJavaProperties
  # Module to encode and decode
  #
  # Usage:
  #    encoded = Encoding.encode!("Some text to be encoded")
  #    decoded = Encoding.decode!("Some text to be decoded")
  #
  # You can disable separate encoding (and decoding) steps,
  # by passing in additional flags:
  #
  # * SKIP_SEPARATORS: Do not code the separators (space,:,=)
  # * SKIP_UNICODE: Do not code unicode chars
  # * SKIP_SPECIAL_CHARS: Do not code newlines, tab stops, ...
  #
  module Encoding

    # Flag for skipping separators encodings / decoding
    # @return [Symbol]
    SKIP_SEPARATORS=:skip_separators

    # Flag for skipping separators encodings / decoding
    # @return [Symbol]
    SKIP_UNICODE=:skip_unicode

    # Flag for skipping separators encodings / decoding
    # @return [Symbol]
    SKIP_SPECIAL_CHARS=:skip_special_chars

    # Encode a given text in place
    # @param text [String]
    # @param *flags [Array] Optional flags to skip encoding steps
    # @return [String] The encoded text for chaining
    def self.encode!(text, *flags)
      SpecialChars.encode!(text)  unless flags.include?(SKIP_SPECIAL_CHARS)
      Separators.encode!(text)    unless flags.include?(SKIP_SEPARATORS)
      Unicode.encode!(text)       unless flags.include?(SKIP_UNICODE)
      text
    end
    
    # Decodes a given text in place
    # @param text [String]
    # @param *flags [Array] Optional flags to skip decoding steps
    # @return [String] The decoded text for chaining
    def self.decode!(text, *flags)
      Unicode.decode!(text)       unless flags.include?(SKIP_UNICODE)
      Separators.decode!(text)    unless flags.include?(SKIP_SEPARATORS)
      SpecialChars.decode!(text)  unless flags.include?(SKIP_SPECIAL_CHARS)
      text
    end

  end
end
