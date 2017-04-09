//
//  CreateProfileViewController.swift
//  H2O
//
//  Created by Jay Guan on 4/8/17.
//  Copyright © 2017 Jay Guan. All rights reserved.
//

import UIKit

class CreateProfileViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var workoutHours: UITextField!
    
    var waterWeight = 0.0
    var hourInfo = 0.0
    var weightInfo = 0.0
    var ageInfo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("text return triggereed")
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        // get data
        var ready = true
        if let ageTemp = Int(age.text!) {
            ageInfo = ageTemp
            
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Please an integer for age", preferredStyle: .alert)
            
            let myAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(myAction)
            
            present(alert, animated: true, completion: nil)

            ready = false
        }
        if let weightTemp = Double(weight.text!) {
            weightInfo = weightTemp
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Please a decimal number for weight", preferredStyle: .alert)
            
            let myAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(myAction)
            
            present(alert, animated: true, completion: nil)
            
            ready = false
        }
        if let hourTemp = Double(workoutHours.text!) {
            hourInfo = hourTemp
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Please a decimal number for average weekly workhout hours", preferredStyle: .alert)
            
            let myAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(myAction)
            
            present(alert, animated: true, completion: nil)
            ready = false
        }
        if ready {
            waterWeight = Double(weightInfo)*2/3
            var userDefaults = UserDefaults.standard
            userDefaults.set(hourInfo, forKey:"hourInfo")
            userDefaults.set(weightInfo, forKey:"weightInfo")
            userDefaults.set(ageInfo, forKey:"ageInfo")
            performSegue(withIdentifier: "createAvatar", sender: self)
        }
        else {
        // alert
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createAvatar" {
            if let dvc = segue.destination as?CreateAvatarViewController {
                dvc.waterWeight = self.waterWeight
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
