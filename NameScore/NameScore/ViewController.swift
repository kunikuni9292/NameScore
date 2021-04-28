//
//  ViewController.swift
//  NameScore
//
//  Created by 崎原邦達 on 2021/04/28.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var nameText: UITextField!

    @IBOutlet weak var sendBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameText.delegate = self
    }
        //delegateb あるクラスの処理の実装を別のクラスに任せるための仕組み。
    //キーボードのsendキー押した時の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.sendBtn.sendActions(for: .touchUpInside)
        return true
    }
    
    //viewが読み込まれる前にtextfiledの中身を消す処理
    //戻り値がないmethodをoverrideするときは必ず親クラスのmethodを呼ばないといけない
    override func viewWillAppear(_ animated: Bool) {
        //同じ引数animetedにする
        super.viewWillAppear(animated)
        self.nameText.text = ""
    }
    //falseを返すと画面が遷移しないという文言
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //identifier がshoeResult の時、nameText が空だったらFalseを返す処理
        if identifier == "showResult" {
            guard self.nameText.text != ""
            else {
                //UIAlertController エラーポップアップがでる
                let alertController = UIAlertController(title: "Error", message: "Please enter your name", preferredStyle: .alert)
                //UIAlertAction ポップアップが出た後のボタン等のアクション設定
                let defaultAction = UIAlertAction(title: "OK!", style: .default, handler: nil)
                //アラートコントローラーにアクションをつける
                alertController.addAction(defaultAction)
                //使う時下記を書くこと！
                self.present(alertController, animated: true, completion: nil)
                
                return false
            }
            return true
        }
        return true
    }
//セグエで画面が遷移する前に実行されるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//identifier がsegue.identifier のときだけ処理して欲しい
        guard let identifier = segue.identifier else {
            return
        }
        if identifier == "showResult" {
            //segue.destinationは遷移先の画面を取ることができる文言
            let resultVC = segue.destination as! ResultViewController
            //Text(nilかもしれない)はオプショナル型なのでアンラップしとく「！」
            resultVC.myName = self.nameText.text!
            //画面が遷移したらテキストフィールドを対象外にする　今回はキーボードが表示されなくなる
            self.nameText.resignFirstResponder()
                    
        }

        
    }
}

