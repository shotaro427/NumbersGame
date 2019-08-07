//
//  ViewController.swift
//  NumbersGame
//
//  Created by 田内　翔太郎 on 2019/08/05.
//  Copyright © 2019 田内　翔太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// ランダムな値を生成する
    var trueNumber: Int = Int.random(in: 1...100) // Ind.random(in: ○~□)： ○〜□の間のInt型からランダムな値を生成する
    
    /// 当てるまでにボタンを押した回数を入力する
    var count:Int = 1
    
    // ViewControllerの変数たち
    @IBOutlet weak var numberLabel: UILabel! // 入力された値を表示するためのラベル
    @IBOutlet weak var textField: UITextField! // プレイヤーに入力してもらうフィールド
    @IBOutlet weak var resultTextView: UITextView! // ヒントと結果を表示するフィールド
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // resultTextViewを編集不可能にする
        resultTextView.isEditable = false // true = 編集可、　false = 編集不可
    }

    /// 決定ボタンを押した時の処理
    @IBAction func guessButton(_ sender: Any) {
        
        // 入力されたtextFieldの値を取得
        guard let playerNum: Int = Int(textField.text!) else { // playerNum: プレイヤーが入力した値（binding済み)
            return
        }
        
        // numberLabelに入力された値を入力
        numberLabel.text = String(playerNum)
        
        // 正否の判定(0:正解、 1:正解より小さい、 2:正解より大きい)
        if trueNumber == playerNum {
            checkAnswer(id: 0, playerNum: playerNum)
        } else if trueNumber > playerNum {
            checkAnswer(id: 1, playerNum: playerNum)
        } else if trueNumber < playerNum {
            checkAnswer(id: 2, playerNum: playerNum)
        } else {
            return
        }
        
        // カウントを進める
        count += 1
        
        // 入力欄の初期化
        textField.text = ""
        
    }
        
    // 入力された値と答えの値を比較する関数
    func checkAnswer(id: Int, playerNum: Int) {
        // 正否を判定する (0:正解、 1:正解より小さい、 2:正解より大きい)
        switch id {
        case 0:
            // resultTextViewに結果を表示
            resultTextView.text += "[正解]答えは\(trueNumber)でした。\n"
        case 1:
            // resultTextViewに結果を表示
            resultTextView.text += "[\(count)回目]答えは\(playerNum)より大きい値です。\n"
        case 2:
            // resultTextViewに結果を表示
            resultTextView.text += "[\(count)回目]答えは\(playerNum)より小さい値です。\n"
        default:
            break
        }
    }
}

