//
//  MemoViewController.swift
//  memolfors
//
//  Created by 森田貴帆 on 2020/09/07.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var filltext:UITextField!
    @IBOutlet var viewtexy: UITextView!
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filltext.text = saveData.object(forKey: "title") as? String
        viewtexy.text = saveData.object(forKey: "content") as? String
        filltext.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func savememo(){
        //書き込み
        saveData.set(filltext.text, forKey: "title")
        saveData.set(viewtexy.text, forKey: "content")
        
        let alert:UIAlertController = UIAlertController(title: "保存", message: "メモを保存しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            self.navigationController?.popViewController(animated: true)
            print("ボタンが押されました")}))
        
        present(alert, animated: true,completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
