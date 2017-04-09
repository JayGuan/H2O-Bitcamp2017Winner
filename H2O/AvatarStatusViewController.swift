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
    var waterWeight = 0.0
    var timer: Timer? = nil
    var timeCount = 0
    let reminder = 10
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(self.updateTime),
                                     userInfo: nil,
                                     repeats: true)
        
        var convert:Int = Int(waterWeight)
        print("avatar status page: i [\(i)]")
        print("water weight \(convert)")
        // Do any additional setup after loading the view.
        img.image = UIImage(named:"Asset \(i)")
        self.title = "\(name)'s Health"
        self.result.text = "\(convert) ounces"
    }

    func updateTime() {
        timeCount += 1
        print("\(timeCount)")
        if timeCount == reminder {
            print("timer eqaul to reminder")
            stop()
            let alert = UIAlertController(title: "20% water loss", message: "Do you want to drink some water?", preferredStyle: .alert)
            
            let no = UIAlertAction(title: "No", style: .default, handler:
                {
                    (alert: UIAlertAction!) in self.NoHandler()
            })
            
            let yes = UIAlertAction(title: "Yes", style: .default, handler:
                {
                    (alert: UIAlertAction!) in self.YesHandler()
            })
            
            
            alert.addAction(no)
            alert.addAction(yes)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func NoHandler() {
    
    }
    
    func YesHandler() {
        performSegue(withIdentifier: "fire", sender: self)
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
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
