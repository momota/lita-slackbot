module Lita
  module Handlers
    class Pet < Handler
      route /^java\s+(.+)/, :with_java, help: { "java TEXT" => "reply back with java." }
      route /^(?:otp)\s+(.+)/, :otp, help: { "otp LENGTH" => "reply one time password" }
      route /(.+)\(回文\)$/, :palindrome
      route /^(?:bj|ブラック)/, :black

      def with_java( response )
        word = response.matches[0][0]
        response.reply "!!! #{word} とジャバ !!!"
      end

      def otp( response )
        length = response.matches[0][0]
        pattern = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
        pattern += ["!", "#", "$", "%", "&", "(", ")",
                    "=", "-", "^", "~", "*", "+", "?", "_"]
        random_string = (0...len).map { pattern[rand( pattern.length )] }.join
        response.reply random_string
      end

      def palindrome( response )
        word = response.matches[0][0]
        response.reply word.reverse
      end

      def black( response )
        kotowaza = [
          "飛んで火にいる春の新卒",
          "うどの大企業 ",
          "転ばぬ先の杖を用意する暇があるなら働け ",
          "払わぬボーナス、サービス残業",
          "石橋を叩く暇があったら渡って仕事取って帰ってこい",
          "下手な新卒数とりゃ逃げて",
          "焼き鉄板の上でも３年 ",
          "ブラック社員に口なし",
          "低学歴の背比べ",
          "はきだめに東大",
          "上司の耳に念仏",
          "社長の耳に労働基準法 ",
          "渡る世間は絶望ばかり ",
          "サビ残も三年 ",
          "一寸先は過労死",
          "病はブラック企業から ",
          "命は金なり ",
          "ヒラの席にも3年 ",
          "辞めるが勝ち",
          "机の裏に盗聴器あり",
          "壁にカメラあり ",
          "急がば走れ",
          "泣きっ面にサービス残業",
          "弘法もふでを誤った尻拭いをさせる",
          "窓際からリストラ ",
          "タイムカードに蓋をする ",
          "四面楚歌 ",
          "四面欝歌 ",
          "鬱病3年自殺8年",
          "一言話せば首がすっ飛ぶ",
          "薄給の上にも三年",
          "若い時の苦労は身体壊してでもしろ。 ",
          "納期ある鷹はバグを隠す",
          "取れぬ休みにサビ残業 ",
          "今日やれることは昨日やれ",
          "病めるひとみてわがふりなおせ",
          "作業員には激務をさせよ ",
          "顧客の川流れ",
          "辞めるは地獄、辞めぬも地獄 ",
          "弱肉休職 ",
          "転職活動、する暇無いほど、仕事詰め  ",
          "新卒も歩けばブラックに当たる",
          "ノルマは一日にしてならず",
          "命あっての安月給 ",
          "案ずるより死ぬが易し"
        ]
        response.reply kotowaza.sample
      end
    end

    Lita.register_handler(Pet)
  end
end
