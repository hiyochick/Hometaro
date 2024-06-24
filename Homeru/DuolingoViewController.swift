//
//  DuolingoViewController.swift
//  Homeru
//
//  Created by chick on 2024/05/22.
//

import UIKit
import Foundation

class DuolingoViewController: UIViewController {
    
    //ユーザが選択した単語カードを表す
    @IBOutlet var tango1: UILabel!
//    @IBOutlet var tango2: UILabel!
//    @IBOutlet var tango3: UILabel!
//    @IBOutlet var tango4: UILabel!
//    @IBOutlet var tango5: UILabel!
//    @IBOutlet var tango6: UILabel!
    
    //100個から選ばれたランダム12個の単語カードを入れる
    @IBOutlet var tan1: UIButton!
    @IBOutlet var tan2: UIButton!
    @IBOutlet var tan3: UIButton!
    @IBOutlet var tan4: UIButton!
    @IBOutlet var tan5: UIButton!
    @IBOutlet var tan6: UIButton!
    @IBOutlet var tan7: UIButton!
    @IBOutlet var tan8: UIButton!
    @IBOutlet var tan9: UIButton!
    @IBOutlet var tan10: UIButton!
    @IBOutlet var tan11: UIButton!
    @IBOutlet var tan12: UIButton!
    @IBOutlet var tan13: UIButton!
    @IBOutlet var tan14: UIButton!
    @IBOutlet var tan15: UIButton!

    //time
    @IBOutlet var timerLabel: UILabel!
    //timer用変数
    var timer: Timer?
    var remaining = 15
    
    

    var kansai = ["あんた", "好きやねん", "シュッとしてるし", "うまいよなあ", "ほんま", "しらんけど", "なんていうか", "頼りにしてるで", "ええ人すぎ", "さすがに", "いくらなんでも", "やばいって", "エグい", "かいらして", "しゃーない", "ええ加減", "センスええわあ", "そういうとこ", "あの時", "助かった", "ええとこ", "ないやんか", "誰とでも", "仲良いし", "オチも", "うまいし", "なかなか", "いつ見ても", "笑顔", "尊敬するわ", "どうやって", "老若男女", "ほんまに", "一緒に", "いたいって", "思うねん", "イケてる", "今日の服", "昨日さ", "助けてくれたやんか", "しんどくても", "おもろい", "いっちゃん", "せやねん", "好きやわ", "いつまでも", "そのままで", "なんぼ", "ちゃう", "かいらして", "似合いすぎ", "日本で", "大阪で", "たこ焼き", "作るん", "誰より", "料理", "行きたい", "あんたとなら", "と", "昔さ", "家", "で", "に", "言いたい", "みんな", "ええやんか", "むずすぎ", "やって", "ありえへん", "ねん", "やで", "わあ", "やっぱ", "うそやん", "学校", "気使える", "言うてる", "してくれる", "やん", "仕事でも", "大変やのに", "やし", "努力家", "気取らん", "感じ", "真似したい", "どうやったら", "うちの", "通天閣", "しよや", "登ろ", "まだまだ", "いける", "見えへん", "ええて", "意味わからん", "かっこええ", "上手に", "やんか", "なんなん", "まじで", "ほんま", "イケてる", "メイク", "親御さん", "優しい", "親孝行", "仲良し", "頼れる", "小さい", "時間通り", "来るし", "なんでも", "言うたって", "おかしい", "任しとき", "任せた", "いっちゃん", "ケチくさい", "自分", "なんか考えられへん", "キッツい", "勉強", "泣くて", "せやさかい", "めっちゃ", "細かい", "話しやすい", "大きい","なあ", "せやな", "ぼちぼち", "おおきに", "ちゃうな", "ゆーて", "ほな", "さいなら", "ゲラ", "しんど", "おもんな", "どないなってんねん", "ええでっか", "あかん", "おとん", "おかん", "いけず", "大阪城", "くれへんし", "大阪LOVER", "なにわ", "なれへんし", "近そうでまだ遠い", "まいど", "どっひゃー", "まだ", "恋しい", "すごいなあ", "ええねん", "えらい", "人", "犬", "赤ん坊", "おっちゃん", "おばちゃん", "よそもん", "道頓堀", "作ろや", "ごっつい", "あほらし", "なってんねん", "まって", "やさし", "やろ", "モテる", "うますぎ", "配慮", "できひん", "知らんがな", "知らんし", "ちゃうねん", "マジで", "行けたら行く", "しばいたって", "惚れてまう", "正直", "近所の", "奢って", "気にしい", "ぼんぼん", "金持ち", "ガンガン", "オチ", "ボケて", "ツッコむん", "ツッコんで", "なんでやねん", "コテコテ", "関西弁", "そうなん", "そんなん", "ちゃうんかい", "せめて", "でっしゃろ", "アホ", "アレ", "阪神", "勝ったのも", "あんたの", "おかげさんで", "おもろすぎる", "なんやねん", "ぱちもん", "さらの", "べっぴんさん", "捕まえて", "見たい", "したい", "人懐っこい", "ひやかす", "かまへん", "もっぺん", "いらち", "かなんわ", "めちゃめちゃ", "しゃべり", "ぎょうさん", "ほっといても", "すんません", "そない", "自分", "えらいこっちゃ", "ほなまた", "ええかげん", "ええわ", "たまらん", "結局", "やろ", "よーさん", "なんべん", "おぼこい", "さかい", "赤い", "黒い", "表情", "感情", "おたくの", "ほんで", "わりかし", "しゃれてる", "心強い", "信じられへん", "センス", "なし", "あり", "よりの", "ますます", "楽しみにしてんで", "たいそう", "豹柄",
        "お顔が", "尊い", "まだまだ", "詰まるところ", "注目", "スター", "かんべん", "軽い", "タッチ", "いやん", "重たい", "ほかす", "見てみ", "むず", "ええなあ", "どやさ", "そら", "かんにん", "それ", "ぱっと","すっと", "立って", "座って", "走る", "早い", "ぴった", "時間", "速い", "朝方", "到着", "遅れても", "わるいな", "お好み焼き", "回す", "くるっと", "こら", "わかる", "なんや", "簡単", "軽く", "どや", "鬱陶しい", "そら", "そない", "やん", "やな", "どないしよ", "せやろ", "みっけ", "キレへん", "はい", "ノー", "マーク", "テスト", "点数", "よかった", "感動", "泣ける", "責任感", "別に", "見てみ", "すご", "キツない", "キャパ", "デカい", "レベル", "ウケ", "モテる", "良すぎる", "新喜劇", "難波", "梅田", "行こ", "東京弁", "ユニバ", "マクド", "ポテト", "美味しい", "オイシイ", "とったろ", "褒めてみ", "年パス", "買ったん", "正解や", "いけた", "いつ", "どんつき", "ボケ", "担当", "推せる", "推し", "売り上げ", "姫", "ナンバーワン", "ツッコミ", "ぺーぺー", "してはる", "まんな", "わかりやすい", "綺麗",


    ]
    
    var random = [String]()
    var selected = [String]()

    func RandomNum(count: Int, min: Int, max: Int) -> [Int] {
        var uniqueNum = Set<Int>()
        
        while uniqueNum.count < count {
            let randomNum = Int.random(in: min...max)
            uniqueNum.insert(randomNum)
        }
        return Array(uniqueNum)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Backボタンの変更
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "",
        style: .plain,
        target: nil,
        action: nil
        )
        //選択できる単語 枠線設定
        tan1.layer.borderWidth = 1.0
        tan1.layer.borderColor = UIColor.brown.cgColor
        tan2.layer.borderWidth = 1.0
        tan2.layer.borderColor = UIColor.brown.cgColor
        tan3.layer.borderWidth = 1.0
        tan3.layer.borderColor = UIColor.brown.cgColor
        tan4.layer.borderWidth = 1.0
        tan4.layer.borderColor = UIColor.brown.cgColor
        tan5.layer.borderWidth = 1.0
        tan5.layer.borderColor = UIColor.brown.cgColor
        tan6.layer.borderWidth = 1.0
        tan6.layer.borderColor = UIColor.brown.cgColor
        tan7.layer.borderWidth = 1.0
        tan7.layer.borderColor = UIColor.brown.cgColor
        tan8.layer.borderWidth = 1.0
        tan8.layer.borderColor = UIColor.brown.cgColor
        tan9.layer.borderWidth = 1.0
        tan9.layer.borderColor = UIColor.brown.cgColor
        tan10.layer.borderWidth = 1.0
        tan10.layer.borderColor = UIColor.brown.cgColor
        tan11.layer.borderWidth = 1.0
        tan11.layer.borderColor = UIColor.brown.cgColor
        tan12.layer.borderWidth = 1.0
        tan12.layer.borderColor = UIColor.brown.cgColor
        tan13.layer.borderWidth = 1.0
        tan13.layer.borderColor = UIColor.brown.cgColor
        tan14.layer.borderWidth = 1.0
        tan14.layer.borderColor = UIColor.brown.cgColor
        tan15.layer.borderWidth = 1.0
        tan15.layer.borderColor = UIColor.brown.cgColor




        //初期ラベルの設定
        updateTimerLabel()
        
        //元の300個の単語の順番をシャッフルする
        kansai.shuffle()
        
        // ランダムな数値を生成
        let randomNum = RandomNum(count: 15, min: 1, max: 300)

        // 12個の変数に代入
        let n1 = randomNum[0]
        let n2 = randomNum[1]
        let n3 = randomNum[2]
        let n4 = randomNum[3]
        let n5 = randomNum[4]
        let n6 = randomNum[5]
        let n7 = randomNum[6]
        let n8 = randomNum[7]
        let n9 = randomNum[8]
        let n10 = randomNum[9]
        let n11 = randomNum[10]
        let n12 = randomNum[11]
        let n13 = randomNum[12]
        let n14 = randomNum[13]
        let n15 = randomNum[14]

        tan1.setTitle(kansai[n1], for: .normal)
        tan2.setTitle(kansai[n2], for: .normal)
        tan3.setTitle(kansai[n3], for: .normal)
        tan4.setTitle(kansai[n4], for: .normal)
        tan5.setTitle(kansai[n5], for: .normal)
        tan6.setTitle(kansai[n6], for: .normal)
        tan7.setTitle(kansai[n7], for: .normal)
        tan8.setTitle(kansai[n8], for: .normal)
        tan9.setTitle(kansai[n9], for: .normal)
        tan10.setTitle(kansai[n10], for: .normal)
        tan11.setTitle(kansai[n11], for: .normal)
        tan12.setTitle(kansai[n12], for: .normal)
        tan13.setTitle(kansai[n13], for: .normal)
        tan14.setTitle(kansai[n14], for: .normal)
        tan15.setTitle(kansai[n15], for: .normal)

        update_label()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startTimer()
    }
    // タイマーを開始するメソッド
    func startTimer() {
        // 既にタイマーが動作している場合は無効にする
        timer?.invalidate()
        
        // タイマーを設定して開始
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
        
        // 1秒ごとに呼び出されるメソッド
    @objc func updateTimer() {
        if remaining > 0{
            remaining -= 1
            updateTimerLabel()
            if remaining <= 0 {
                timerLabel.textColor = .red
            }
        }else {
            timerLabel.textColor = UIColor.red
            // タイマーを無効にする
            timer?.invalidate()
            timer = nil
            updateTimerLabel()
            //self.performSegue(withIdentifier: "next", sender: nil)
            navigateToNextScreen()  //タイマーが終了したら次の画面へ
        }
    }
    
    // timerラベルを更新するメソッド
    func updateTimerLabel() {
        let minutes = remaining / 60
        let seconds = remaining % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    class ViewController: UIViewController {
        var counter = 10
        var timer = Timer()
        
        @objc func updateTimer() {
            if counter > 0 {
                counter -= 1
            } else {
                timer.invalidate()
            }
        }
    }
    
    // 次の画面に遷移するメソッド
    func navigateToNextScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as? HometaroViewController {
            nextViewController.receivedData = selected // データを渡す
            navigationController?.pushViewController(nextViewController, animated: true)
           
        }
    }

    
    @IBAction func reset () {
        selected.removeAll()
        // 全てのボタンの有効化
        tan1.isEnabled = true
        tan2.isEnabled = true
        tan3.isEnabled = true
        tan4.isEnabled = true
        tan5.isEnabled = true
        tan6.isEnabled = true
        tan7.isEnabled = true
        tan8.isEnabled = true
        tan9.isEnabled = true
        tan10.isEnabled = true
        tan11.isEnabled = true
        tan12.isEnabled = true
        tan13.isEnabled = true
        tan14.isEnabled = true
        tan15.isEnabled = true
        
        tan1.layer.borderColor = UIColor.brown.cgColor
        tan2.layer.borderColor = UIColor.brown.cgColor
        tan3.layer.borderColor = UIColor.brown.cgColor
        tan4.layer.borderColor = UIColor.brown.cgColor
        tan5.layer.borderColor = UIColor.brown.cgColor
        tan6.layer.borderColor = UIColor.brown.cgColor
        tan7.layer.borderColor = UIColor.brown.cgColor
        tan8.layer.borderColor = UIColor.brown.cgColor
        tan9.layer.borderColor = UIColor.brown.cgColor
        tan10.layer.borderColor = UIColor.brown.cgColor
        tan11.layer.borderColor = UIColor.brown.cgColor
        tan12.layer.borderColor = UIColor.brown.cgColor
        tan13.layer.borderColor = UIColor.brown.cgColor
        tan14.layer.borderColor = UIColor.brown.cgColor
        tan15.layer.borderColor = UIColor.brown.cgColor
        
        update_label()
        //selected.removeAtIndex(0) やと1つずつ
    }
    
    func update_label(){
        let combined = selected.joined(separator: " ")
        tango1.text = combined
//        selected.count > 0 ? selected[0] : ""
//        tango2.text = selected.count > 1 ? selected[1] : ""
//        tango3.text = selected.count > 2 ? selected[2] : ""
//        tango4.text = selected.count > 3 ? selected[3] : ""
//        tango5.text = selected.count > 4 ? selected[4] : ""
//        tango6.text = selected.count > 5 ? selected[5] : ""
    }

    //選択したボタンのTitleを配列selectedに格納
    @IBAction func tan1Tapped(_ sender: UIButton) {
        tan1.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan1.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    }   
    
    @IBAction func tan2Tapped(_ sender: UIButton) {
        tan2.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan2.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    }   
    
    @IBAction func tan3Tapped(_ sender: UIButton) {
        tan3.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan3.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    }  
    
    @IBAction func tan4Tapped(_ sender: UIButton) {
        tan4.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan4.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    } 
    
    @IBAction func tan5Tapped(_ sender: UIButton) {
        tan5.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan5.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    }  
    
    @IBAction func tan6Tapped(_ sender: UIButton) {
        tan6.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan6.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    } 
    
    @IBAction func tan7Tapped(_ sender: UIButton) {
        tan7.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan7.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    } 
    
    @IBAction func tan8Tapped(_ sender: UIButton) {
        tan8.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan8.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    }  
    
    @IBAction func tan9Tapped(_ sender: UIButton) {
        tan9.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan9.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    } 
    
    @IBAction func tan10Tapped(_ sender: UIButton) {
        tan10.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan10.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    } 
    
    @IBAction func tan11Tapped(_ sender: UIButton) {
        tan11.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan11.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    } 
    
    @IBAction func tan12Tapped(_ sender: UIButton) {
        tan12.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan12.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    }
    
    @IBAction func tan13Tapped(_ sender: UIButton) {
        tan13.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan13.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    }
    
    @IBAction func tan14Tapped(_ sender: UIButton) {
        tan14.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan14.currentTitle {
            selected.append(title)
            sender.isEnabled = false
            update_label()
        }
    }
    
    @IBAction func tan15Tapped(_ sender: UIButton) {
        tan15.layer.borderColor = UIColor.systemYellow.cgColor
        if let title = tan15.currentTitle {
            selected.append(title)
            update_label()
            sender.isEnabled = false
        }
    }
 
    
}
