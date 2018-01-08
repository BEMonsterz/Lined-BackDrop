//
//  TestViewController.swift
//  Lined Backdrop
//
//  Created by Bryan Ayllon on 1/5/18.
//  Copyright © 2018 Bryan Ayllon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class TestViewController: UIViewController {
  
    @IBOutlet var ImageViewer: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        let database = Database.database().reference()
        let storage = Storage.storage().reference()
        let tempImageRef = storage.child("tnpDir/bg1.jpg")
        
//        let image = UIImage(named: "ground1.jpg")
//
//        let metaData = StorageMetadata()
//        metaData.contentType = "image/jpeg"
//        tempImageRef.putData(UIImageJPEGRepresentation(image!, 0.8)!,metadata: metaData) {
//            (data, error) in
//            if error == nil {
//                print("upload successful")
//                }
//            else { print(error?.localizedDescription)
//            }
//            }
        
        tempImageRef.getData(maxSize: 1*1000*1000) {
            (data, error) in if error == nil {
                print(data)
                self.ImageViewer.image = UIImage(data: data!)
                
            } else {
                print(error?.localizedDescription)
            }
            
        }
    }
        
        

        
        // Do any additional setup after loading the view.
}

func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


