//
//  AvatarStatusViewController.swift
//  H2O
//
//  Created by Jay Guan on 4/8/17.
//  Copyright © 2017 Jay Guan. All rights reserved.
//

import UIKit

class AvatarStatusViewController: UIViewController {
    var i = 1
    var name = ""
    
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("avatar status page: i [\(i)]")
        // Do any additional setup after loading the view.
        img.image = UIImage(named:"Asset \(i)")
        self.title = "\(name)'s Health"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fire" {
            print("go to fire")
            if let dvc = segue.destination as? FireAttackViewController {
                dvc.i = self.i
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
