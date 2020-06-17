//
//  ViewController.swift
//  images
//
//  Created by Shree Marella on 2020-06-16.
//  Copyright © 2020 Shree Marella. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideshow: UIImageView!
    var imageNames = ["tinkerbell","bugsbunny","dexter","mrbean","bravo","Mickey","scooby","spiderman","bheem","dora"]
        var count:Int = 0;
       var isPaused = true
       var timer = Timer()
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
    
           
           let tap2 = UITapGestureRecognizer(target: self, action: #selector(Tapped))
             tap2.numberOfTapsRequired = 1
             view.addGestureRecognizer(tap2)
           let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
                   tap.numberOfTapsRequired = 2
                   view.addGestureRecognizer(tap)
          
               self.slideshow.image = UIImage(named: "\(imageNames[count])")
                
           
       }
    
       
       @objc func Tapped() {
              // do something here
               if isPaused{
                   timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.someAction), userInfo: nil, repeats: true)
                 isPaused = false
                   print("timer fired")
             } else {
                 timer.invalidate()
                 isPaused = true
             }
           
              
          }
       
       @objc func doubleTapped() {
               timer.fire()
           print("timer fired")
                 
             }
       
    


       @objc func someAction() {
              // do something here
              self.slideshow.image = UIImage(named: self.imageNames[self.count])
                              if(self.count == 9){
                                      self.count = 0
                                     
                                 }else{
                                    self.count += 1
                                 }

           
          }
       
       
       @IBAction func previous(_ sender: UIButton) {
           if(count <= 1){
                     count = 9
                       self.slideshow.image = UIImage(named: self.imageNames[self.count])
                  }else{
                      count -= 1
                    self.slideshow.image = UIImage(named: self.imageNames[self.count])
               
               
                  }
           
       }
       
       
       @IBAction func next(_ sender: Any) {
           
           if(count >= 9){
                              count = 0
                               self.slideshow.image = UIImage(named: self.imageNames[self.count])
                          }else{
                              count += 1
                            self.slideshow.image = UIImage(named: self.imageNames[self.count])
                          }
       }


}

