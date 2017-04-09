//
//  FireAttackViewController.swift
//  H2O
//
//  Created by Jay Guan on 4/8/17.
//  Copyright © 2017 Jay Guan. All rights reserved.
//

import UIKit
import UserNotifications

class FireAttackViewController: UIViewController {
    var i = 1
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var waterImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          print("fire page: i [\(i)]")
        waterImg.image = UIImage(named:"Asset \(i)anoBackground")
        let pressDownGes = UILongPressGestureRecognizer.init(target: self, action: #selector(pressedDown))
        img.addGestureRecognizer(pressDownGes)
        // Do any additional setup after loading the view.
        
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Dehydration!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Drink some water", arguments: nil)
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // create the request object
        let request = UNNotificationRequest(identifier: "5 seconds", content: content, trigger: trigger)
        // ebale or disable features based on authorization
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound], completionHandler: {didAllow, error in})
        center.add(request, withCompletionHandler: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pressedDown(_sender: UILongPressGestureRecognizer) {
        if _sender.state == UIGestureRecognizerState.began {
            print("pressed down")
        }
        else if _sender.state == UIGestureRecognizerState.ended {
           print("finished")
        
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
