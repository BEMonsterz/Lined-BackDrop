//
//  ViewController.swift
//  Scenes
//
//  Created by Bryan Ayllon on 1/4/18.
//  Copyright © 2018 Bryan Ayllon. All rights reserved.
//

import UIKit
import Firebase

extension UIViewController {
    
    @objc func swipeAction(swipe:UISwipeGestureRecognizer){
        switch swipe.direction.rawValue {
        case 1:
            performSegue(withIdentifier: "swipeLeft", sender: self)
        case 2:
            performSegue(withIdentifier: "swipeRight", sender: self)
        default:
            break
        }
    }
    }
    
    

class ViewController: UIViewController {

    @IBOutlet weak var txtStatus: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(leftSwipe)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Get a reference to the storage service using the default Firebase App
    
    // Create a storage reference from our storage service
    @IBAction func btn1Tap(sender: AnyObject) {
        txtStatus.text = "Button 1 Tapped";
        
        Analytics.logEvent("Button1Click", parameters: nil);
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    }


