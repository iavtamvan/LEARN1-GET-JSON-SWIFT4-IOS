//
//  HeroViewController.swift
//  BelajarJSON
//
//  Created by iav on 28/03/20.
//  Copyright © 2020 iav. All rights reserved.
//

import UIKit
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class HeroViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var atributeLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var legsLbl: UILabel!
    
    var hero: HeroStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.nameLbl.text = hero?.localized_name
        self.atributeLbl.text = hero?.primary_attr
        self.attackLbl.text = hero?.attack_type
        self.legsLbl.text = "\((hero?.legs)!)" + " Sikil"
        
        let urlImage = "https://api.opendota.com" + hero!.img
        let url = URL(string: urlImage)
        
        self.imageView.downloaded(from: url!)
        
    }

}
