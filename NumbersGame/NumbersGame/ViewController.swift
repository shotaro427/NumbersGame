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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

