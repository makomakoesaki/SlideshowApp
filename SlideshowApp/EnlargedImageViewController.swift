//
//  EnlargedImageViewController.swift
//  SlideshowApp
//
//  Created by ESAKI MAKOTO on 2021/10/13.
//

import UIKit

class EnlargedImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //拡大画像を表示する
        self.imageView.image = image
        
    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
