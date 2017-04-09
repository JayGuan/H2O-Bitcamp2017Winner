//
//  CreateAvatarViewController.swift
//  H2O
//
//  Created by Jay Guan on 4/8/17.
//  Copyright © 2017 Jay Guan. All rights reserved.
//

import UIKit


class CreateAvatarViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var img: UIImageView!
    var i = 1
    var nameInfo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rightArrowClicked(_ sender: UIButton) {
        i += 1
        img.image = UIImage(named: "Asset \(i)")
    }
    
    @IBAction func leftArrowClicked(_ sender: UIButton) {
        i -= 1
        img.image = UIImage(named: "Asset \(i)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "status" {
            print("go to status")
            if let dvc = segue.destination as? AvatarStatusViewController {
                dvc.i = self.i
                dvc.name = self.nameInfo
                print("name: \(self.nameInfo)")
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("text return triggereed")
        textField.resignFirstResponder()

        return true
    }
    
    @IBAction func DoneClicked(_ sender: UIButton) {
        if let tempName = String(name.text!) {
            var userDefaults = UserDefaults.standard
            nameInfo = tempName
            userDefaults.set(nameInfo, forKey:"nameInfo")
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Please enter a name for your avatar", preferredStyle: .alert)
            
            let myAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(myAction)
            
            present(alert, animated: true, completion: nil)
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
