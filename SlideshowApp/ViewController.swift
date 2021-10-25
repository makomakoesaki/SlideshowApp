//
//  ViewController.swift
//  SlideshowApp
//
//  Created by ESAKI MAKOTO on 2021/10/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startAndStopButton: UIButton!
    
    var imageListArray: [UIImage] = [UIImage(named: "0.jpeg")!,UIImage(named: "1.jpeg")!,UIImage(named: "2.jpeg")!,UIImage(named: "3.jpeg")!,UIImage(named: "4.jpeg")!,UIImage(named: "5.jpeg")!]
    var counter: Int = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "0.jpeg")
    }

    
    
    @IBAction func goImage(_ sender: Any) {
        counter = counter + 1
        //最後の画像の表示時に、進むボタンをタップすると、最初の画像が表示される
        if counter == 6 {
            counter = 0
        }
        //進むボタンで1つ先の画像を表示する
        imageView.image = imageListArray[counter]
    }
    

    @IBAction func backImage(_ sender: Any) {
        counter = counter - 1
        //最初の画像の表示時に、戻るボタンをタップすると、最後の画像が表示される
        if counter < 0 {
            counter = 5
        }
        //戻るボタンで1つ前の画像を表示する
        imageView.image = imageListArray[counter]
    }
    


    @IBAction func slidShowImage(_ sender: Any) {
        if startAndStopButton.titleLabel?.text == "再生" {
            //自動送りの間は、進むボタンと戻るボタンはタップ不可にする
            goButton.isEnabled = false
            backButton.isEnabled = false
            //再生ボタンをタップすると停止ボタンになる
            startAndStopButton.setTitle("停止", for: .normal)
            //再生ボタンをタップすると自動送りが始まり、2秒毎にスライドする
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slidImage(_:)), userInfo: nil, repeats: true)
        } else if startAndStopButton.titleLabel?.text == "停止" {
            //進むボタンと戻るボタンをタップ可能にする
            goButton.isEnabled = true
            backButton.isEnabled = true
            //停止ボタンをタップすると再生ボタンにする
            startAndStopButton.setTitle("再生", for: .normal)
            //停止ボタンをタップすると自動送りが止まる
            timer.invalidate()
        } else {
            //自動送りの間は、進むボタンと戻るボタンはタップ不可にする
            goButton.isEnabled = false
            backButton.isEnabled = false
            //再生/停止ボタンをタップすると停止ボタンになる
            startAndStopButton.setTitle("停止", for: .normal)
            //再生/停止ボタンをタップすると自動送りが始まり、2秒毎にスライドする
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slidImage(_:)), userInfo: nil, repeats: true)
        }
    }
    
    @objc func slidImage(_ timer: Timer) {
        counter = counter + 1
        if counter == 6 {
            counter = 0
        }
        imageView.image = imageListArray[counter]
    }
    
    //画像をタップすると画面を遷移させる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let EnlargedVC = segue.destination as! EnlargedImageViewController
        EnlargedVC.image = self.imageView.image!
    }
    
    //戻るボタンがタップされると、スライドショー画面に戻り、同じ画像を表示してください
    @IBAction func unwind(_ Segue: UIStoryboardSegue) {
    }
}

