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
    var score = 0
    var healthPercent = 100
    
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
            let alert = UIAlertController(title: "\(name)'s Health is below 40%", message: "Get some water for \(name)", preferredStyle: .alert)
            
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
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        if hour == 21 && minutes == 59 {
            // at the end of the day before people go to bed, check their progress
            switch healthPercent {
            case 90...100:
                score += 5
            case 70...90:
                score += 4
            case 50...70:
                score += 3
            case 30...50:
                score += 2
            case 0...30:
                score -= 3
            default: break
            }
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
