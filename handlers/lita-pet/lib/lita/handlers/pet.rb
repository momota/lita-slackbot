require "json"

module Lita
  module Handlers
    class Pet < Handler
      route /^java\s+(.+)/, :with_java, help: { "java TEXT" => "reply back with java." }
      def with_java( response )
        word = response.matches[0][0]
        response.reply "!!! #{word} とジャバ !!!"
      end

      route /^(?:otp)\s+(.+)/, :otp, help: { "otp LENGTH" => "reply one time password" }
      def otp( response )
        length = response.matches[0][0]
        pattern = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
        pattern += ["!", "#", "$", "%", "&", "(", ")",
                    "=", "-", "^", "~", "*", "+", "?", "_"]
        random_string = (0...length.to_i).map { pattern[rand( pattern.length )] }.join
        response.reply random_string
      end

      route /(.+)\(回文\)$/, :palindrome
      def palindrome( response )
        word = response.matches[0][0]
        response.reply word.reverse
      end

      route /^(?:bj|ブラック)/, :black_joke
      def black_joke( response )
        response.reply sweatshop_kotowaza.sample["back_joke"]
      end

      private

      def sweatshop_kotowazas
        return @kotowazas if @kotowazas
        spec          = Gem::Specification.find_by_name("lita-pet")
        kotowaza_json = File.join(spec.gem_dir, "data", "black_joke.json")
        @kotowazas    = JSON.parse( File.open( kotowaza_json ).read )
      end
    end

    Lita.register_handler(Pet)
  end
end
