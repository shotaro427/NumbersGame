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
            
            //  エラーを表示
            errorAlert()
            return
        }
        
        // playerNumが１〜１００の間の値かどうかを判断する
        if playerNum < 1 || playerNum > 100 { // エラー時
            // エラーを表示
            errorAlert()
        } else { // 正常時
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
    }
    
    
    
    
    // 入力された値と答えの値を比較する関数
    func checkAnswer(id: Int, playerNum: Int) {
        // 正否を判定する (0:正解、 1:正解より小さい、 2:正解より大きい)
        switch id {
        case 0:
            // アラートを表示
            showAlert(message: "\(count)回目で正解しました。\n数字をリセットしました。")
            
            // resultTextViewに結果を表示
            resultTextView.text += "[正解]答えは\(trueNumber)でした。\n"
            
            // 正解時に行うリセット
            reset()
            
        case 1:
            // アラートを表示
            showAlert(message: "答えは\(playerNum)より大きい値です。")
            
            // resultTextViewに結果を表示
            resultTextView.text += "[\(count)回目]答えは\(playerNum)より大きい値です。\n"
        case 2:
            // アラートを表示
            showAlert(message: "答えは\(playerNum)より小さい値です。")
            
            // resultTextViewに結果を表示
            resultTextView.text += "[\(count)回目]答えは\(playerNum)より小さい値です。\n"
        default:
            break
        }
        
    }
    
    /// 普通のアラートを表示させる処理
    func showAlert(message: String) {
        // アラートの作成
        let alert = UIAlertController(title: nil, message: message, preferredStyle:  .alert)
        // アラートのアクション（ボタン部分の定義）
        let close = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // 作成したalertに閉じるボタンを追加
        alert.addAction(close)
        // アラートを表示する
        present(alert, animated: true, completion: nil)
    }
    
    // エラー時のアラートを表示させる処理
    func errorAlert() {
        // アラートの作成
        let alert = UIAlertController(title: "エラー", message: "「１〜１００」の数字を入力してください。", preferredStyle:  .alert)
        // アラートのアクション（ボタン部分の定義）
        let close = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // 作成したalertに閉じるボタンを追加
        alert.addAction(close)
        // アラートを表示する
        present(alert, animated: true, completion: nil)
    }
    
    // 正解したらリセットする関数
    func reset() {
        // 正解の数のリセット
        trueNumber = Int.random(in: 1..<100)
        // ラベルのリセット
        numberLabel.text = "??"
        // カウントのリセット
        count = 1
    }
    
}

