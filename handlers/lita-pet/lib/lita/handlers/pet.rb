module Lita
  module Handlers
    class Pet < Handler
      route /^java\s+(.+)/, :with_java, help: { "lita: java TEXT" => "reply back with java." }
      def with_java( response )
        word = response.matches[0][0]
        response.reply "!!! #{word} とジャバ !!!"
      end

      route /^(?:otp)\s+(.+)/, :otp, help: { "lita: otp LENGTH" => "reply one time password" }
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

      @@genki = "げんきだして！"
      route /疲(?!れ(?:様|さ(?:ま|ん)))/, :genki_1
      def genki_1( response )
        response.reply '疲れてるの？' + @@genki
      end
      route /凹/, :genki_2
      def genki_2( response )
        response.reply '凹んでるの？' + @@genki
      end
      route /心折/, :genki_3
      def genki_3( response )
        response.reply '心折れてるの？' + @@genki
      end
      route /(?:寂|淋)し/, :genki_4
      def genki_4( response )
        response.reply 'さびしいの？' + @@genki
      end
      route /弱っ/, :genki_5
      def genki_5( response )
        response.reply '弱ってるの？' + @@genki
      end
      route /つらい/, :genki_6
      def genki_6( response )
        response.reply 'つらくても' + @@genki
      end
      route /死にたい/, :genki_7
      def genki_7( response )
        response.reply '死なないで' + @@genki
      end
      route /(?:。。。|orz)/, :genki_8
      def genki_8( response )
        response.reply @@genki
      end

      route /^(?:bj|ブラック)/, :black_joke
      def black_joke( response )
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

      route /^(?:naru|なる|ナル)/, :naru, help: { "lita: naru|なる|ナル" => "reply naru's image" }
      def naru( response )
        naru_images = [
          "http://dorayuki.com/doracast/storage/n20120225_01.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_02.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_03.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_04.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_05.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_06.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_07.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_08.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_09.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_10.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_11.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_12.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_13.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_14.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_15.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_16.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_17.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_18.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_19.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_20.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_21.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_22.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_23.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_24.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_25.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_26.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_27.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_28.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_29.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_30.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_31.jpg",
          "http://dorayuki.com/doracast/storage/n20120225_32.jpg",
          "http://dorayuki.com/doracast/storage/n20110109a.jpg",
          "http://dorayuki.com/doracast/storage/n20110109b.jpg",
          "http://dorayuki.com/doracast/storage/n20110109c.jpg",
          "http://dorayuki.com/doracast/storage/n20110109d.jpg",
          "http://dorayuki.com/doracast/storage/n20110109e.jpg",
          "http://dorayuki.com/doracast/storage/n20110109f.jpg",
          "http://dorayuki.com/doracast/storage/n20110109g.jpg",
          "http://dorayuki.com/doracast/storage/n20110109h.jpg",
          "http://dorayuki.com/doracast/storage/n20110109i.jpg",
          "http://dorayuki.com/doracast/storage/n20110109j.jpg",
          "http://dorayuki.com/doracast/storage/n20110109k.jpg",
          "http://dorayuki.com/doracast/storage/n20110109l.jpg",
          "http://dorayuki.com/doracast/storage/n20110109m.jpg",
          "http://dorayuki.com/doracast/storage/n20110109n.jpg",
          "http://dorayuki.com/doracast/storage/n20110109o.jpg",
          "http://dorayuki.com/doracast/storage/n20110109p.jpg",
          "http://dorayuki.com/doracast/storage/n20110109q.jpg",
          "http://dorayuki.com/doracast/storage/n20110109r.jpg",
          "http://dorayuki.com/doracast/storage/n20110109s.jpg",
          "http://dorayuki.com/doracast/storage/n20110109t.jpg",
          "http://dorayuki.com/doracast/storage/n20110109u.jpg",
          "http://dorayuki.com/doracast/storage/n20110109v.jpg",
          "http://dorayuki.com/doracast/storage/n20110109w.jpg",
          "http://dorayuki.com/doracast/storage/n20110109x.jpg",
          "http://dorayuki.com/doracast/storage/n20110109y.jpg",
          "http://dorayuki.com/doracast/storage/n20110109z.jpg",
          "http://dorayuki.com/doracast/storage/n20100809a.jpg",
          "http://dorayuki.com/doracast/storage/n20100809b.jpg",
          "http://dorayuki.com/doracast/storage/n20100809c.jpg",
          "http://dorayuki.com/doracast/storage/n20100809d.jpg",
          "http://dorayuki.com/doracast/storage/n20100809e.jpg",
          "http://dorayuki.com/doracast/storage/n20100809f.jpg",
          "http://dorayuki.com/doracast/storage/n20100809g.jpg",
          "http://dorayuki.com/doracast/storage/n20100809h.jpg",
          "http://dorayuki.com/doracast/storage/n20100809i.jpg",
          "http://dorayuki.com/doracast/storage/n20100809j.jpg",
          "http://dorayuki.com/doracast/storage/n20100809k.jpg",
          "http://dorayuki.com/doracast/storage/n20100809l.jpg",
          "http://dorayuki.com/doracast/storage/n20100809m.jpg",
          "http://dorayuki.com/doracast/storage/n20100809n.jpg",
          "http://dorayuki.com/doracast/storage/n20100809o.jpg",
          "http://dorayuki.com/doracast/storage/n20100809p.jpg",
          "http://dorayuki.com/doracast/storage/n20100425a.jpg",
          "http://dorayuki.com/doracast/storage/n20100425b.jpg",
          "http://dorayuki.com/doracast/storage/n20100425c.jpg",
          "http://dorayuki.com/doracast/storage/n20100425d.jpg",
          "http://dorayuki.com/doracast/storage/n20100425e.jpg",
          "http://dorayuki.com/doracast/storage/n20100425f.jpg",
          "http://dorayuki.com/doracast/storage/n20100410a.jpg",
          "http://dorayuki.com/doracast/storage/n20100410b.jpg",
          "http://dorayuki.com/doracast/storage/n20100410c.jpg",
          "http://dorayuki.com/doracast/storage/n20100410d.jpg",
          "http://dorayuki.com/doracast/storage/n20100410e.jpg",
          "http://dorayuki.com/doracast/storage/n20100410f.jpg",
          "http://dorayuki.com/doracast/storage/n20100410g.jpg",
          "http://dorayuki.com/doracast/storage/n20100410h.jpg",
          "http://dorayuki.com/doracast/storage/n20100410i.jpg",
          "http://dorayuki.com/doracast/storage/n20100410j.jpg",
          "http://dorayuki.com/doracast/storage/n20100410k.jpg",
          "http://dorayuki.com/doracast/storage/n20100410l.jpg",
          "http://dorayuki.com/doracast/storage/n20100410m.jpg",
          "http://dorayuki.com/doracast/storage/n20100410n.jpg",
          "http://dorayuki.com/doracast/storage/n20100410o.jpg",
          "http://dorayuki.com/doracast/storage/n20100410p.jpg",
          "http://dorayuki.com/doracast/storage/n20100410q.jpg",
          "http://dorayuki.com/doracast/storage/n20100404a.jpg",
          "http://dorayuki.com/doracast/storage/n20100404b.jpg",
          "http://dorayuki.com/doracast/storage/n20100404c.jpg",
          "http://dorayuki.com/doracast/storage/n20100404d.jpg",
          "http://dorayuki.com/doracast/storage/n20100404e.jpg",
          "http://dorayuki.com/doracast/storage/n20100404f.jpg",
          "http://dorayuki.com/doracast/storage/n20091231a.jpg",
          "http://dorayuki.com/doracast/storage/n20100101a.jpg",
          "http://dorayuki.com/doracast/storage/n20100101b.jpg",
          "http://dorayuki.com/doracast/storage/n20100101c.jpg",
          "http://dorayuki.com/doracast/storage/n20100101d.jpg",
          "http://dorayuki.com/doracast/storage/n20100102a.jpg",
          "http://dorayuki.com/doracast/storage/n20100103b.jpg",
          "http://dorayuki.com/doracast/storage/n20091225a.jpg",
          "http://dorayuki.com/doracast/storage/n20091225b.jpg",
          "http://dorayuki.com/doracast/storage/n20091225c.jpg",
          "http://dorayuki.com/doracast/storage/n20091225d.jpg",
          "http://dorayuki.com/doracast/storage/n20091225e.jpg",
          "http://dorayuki.com/doracast/storage/n20091225f.jpg",
          "http://dorayuki.com/doracast/storage/n20091225g.jpg",
          "http://dorayuki.com/doracast/storage/n20091225h.jpg",
          "http://dorayuki.com/doracast/storage/n20091225i.jpg",
          "http://dorayuki.com/doracast/storage/n20091225j.jpg",
          "http://dorayuki.com/doracast/storage/n20091225k.jpg",
          "http://dorayuki.com/doracast/storage/n20091225l.jpg",
          "http://dorayuki.com/doracast/storage/n20091225m.jpg",
          "http://dorayuki.com/doracast/storage/n20091003a.jpg",
          "http://dorayuki.com/doracast/storage/n20091003b.jpg",
          "http://dorayuki.com/doracast/storage/n20091003c.jpg",
          "http://dorayuki.com/doracast/storage/n20091003d.jpg",
          "http://dorayuki.com/doracast/storage/n20091003e.jpg",
          "http://dorayuki.com/doracast/storage/n20090824a.jpg",
          "http://dorayuki.com/doracast/storage/n20090824b.jpg",
          "http://dorayuki.com/doracast/storage/n20090824c.jpg",
          "http://dorayuki.com/doracast/storage/n20090824d.jpg",
          "http://dorayuki.com/doracast/storage/n20090824e.jpg",
          "http://dorayuki.com/doracast/storage/n20090824f.jpg",
          "http://dorayuki.com/doracast/storage/n20090802a.jpg",
          "http://dorayuki.com/doracast/storage/n20090802b.jpg",
          "http://dorayuki.com/doracast/storage/n20090802c.jpg",
          "http://dorayuki.com/doracast/storage/n20090802d.jpg",
          "http://dorayuki.com/doracast/storage/n20090802e.jpg",
          "http://dorayuki.com/doracast/storage/n20090706a.jpg",
          "http://dorayuki.com/doracast/storage/n20090706b.jpg",
          "http://dorayuki.com/doracast/storage/n20090607a.jpg",
          "http://dorayuki.com/doracast/storage/n20090607b.jpg",
          "http://dorayuki.com/doracast/storage/n20090516a.jpg",
          "http://dorayuki.com/doracast/storage/n20090516b.jpg",
          "http://dorayuki.com/doracast/storage/n20090419a.jpg",
          "http://dorayuki.com/doracast/storage/n20090419b.jpg",
          "http://dorayuki.com/doracast/storage/n20090419c.jpg",
          "http://dorayuki.com/doracast/storage/n20090301a.jpg",
          "http://dorayuki.com/doracast/storage/n20090301b.jpg",
          "http://dorayuki.com/doracast/storage/n20081201a.jpg",
          "http://dorayuki.com/doracast/storage/n20081201b.jpg",
          "http://dorayuki.com/doracast/storage/n20081201c.jpg",
          "http://dorayuki.com/doracast/storage/n20081025.jpg",
          "http://dorayuki.com/doracast/storage/n20081012.jpg",
          "http://dorayuki.com/doracast/storage/n20080927a.jpg",
          "http://dorayuki.com/doracast/storage/n20080927b.jpg",
          "http://dorayuki.com/doracast/storage/n20080601a.jpg",
          "http://dorayuki.com/doracast/storage/n20080601b.jpg",
          "http://dorayuki.com/doracast/storage/n20080601c.jpg",
          "http://dorayuki.com/doracast/storage/n20080419.jpg",
          "http://dorayuki.com/doracast/storage/n20080409a.jpg",
          "http://dorayuki.com/doracast/storage/n20080409b.jpg",
          "http://dorayuki.com/doracast/storage/y20080102.jpg",
          "http://dorayuki.com/doracast/storage/n20071124.jpg",
          "http://dorayuki.com/doracast/storage/n20070807.jpg",
          "http://dorayuki.com/doracast/storage/n20070609.jpg",
          "http://dorayuki.com/doracast/storage/n20070526.jpg"
        ]
        response.reply naru_images.sample
      end
    end

    Lita.register_handler( Pet )
  end
end

