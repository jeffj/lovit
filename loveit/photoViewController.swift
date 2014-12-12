//
//  photoViewController.swift
//  loveit
//
//  Created by jeff jenkins on 12/10/14.
//  Copyright (c) 2014 jeff jenkins. All rights reserved.
//

import UIKit
import AVFoundation

class photoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var responseMsg: UILabel!

    var imageData = NSData()
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func photViewButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            println("Button capture")
            
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        
    }

    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        
        imageView.image = image
        imageData = UIImagePNGRepresentation(image);
      //  base64String = imageData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        
        //println(imageData);
        
        
    }

//

    @IBAction func requst(sender: AnyObject) {

//        url;NSURL = [NSURL URLWithString:[kBaseURL stringByAppendingPathComponent:kFiles]]; //1
//        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
//        request.HTTPMethod = @"POST"; //2
        
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000")!)
        
        request.HTTPMethod = "POST"
    
        request.addValue("image/png", forHTTPHeaderField: "Content-Type")
//        [request addValue:@"image/png" forHTTPHeaderField:@"Content-Type"]; //3
        
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration();
        
//        NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
       // NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
        
        var session = NSURLSession(configuration: config);
        
        
       // NSData* bytes = UIImagePNGRepresentation(location.image); //4
       
        var task = session.uploadTaskWithRequest(request,fromData: imageData)

//        NSURLSessionUploadTask* task = [session uploadTaskWithRequest:request fromData:bytes completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { //5
//        if (error == nil && [(NSHTTPURLResponse*)response statusCode] < 300) {
//        NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
//        location.imageId = responseDict[@"_id"]; //6
//        [self persist:location]; //7
//        }
//        }];
        
//        
//        
//        
//        
//        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000")!)
//        
//        var session = NSURLSession.sharedSession()
//        
//        request.HTTPMethod = "POST"
//        
//        //\(usenNameTF.text)
//        //\(passwordTF.text)
//        
//        var params = ["email":"ss", "password":"ss", "image":base64String] as Dictionary
//        
//        
//        
//        var err: NSError?
//
//        
//       request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
////        var body = NSMutableString();
////        let boundary = "Boundary-(NSUUID.UUID().UUIDString)"
////        let filePathKey = "stuff"
////        let filename = "stuff.png"
////        body.appendString("Content-Disposition: form-data; name=\"file[]\"; filename=\"Stuff.png\"")
////        body.appendString("\r\n")
////        body.appendString("Content-Type:\"image/png\"")
////        body.appendString("\r\n")
////        body.appendString("123")
////        body.appendString("\r\n")
//        
//      //  request.HTTPBody=body.dataUsingEncoding(NSUTF8StringEncoding);
//        
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        
//        
//        
//        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//            
//            println("Response: \(response)")
//            
//            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
//            
//            println("Body: \(strData)\n\n")
//            
//            var err: NSError?
//            
//            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as NSDictionary
//            
//            // json = {"response":"Success","msg":"User login successfully."}
//            if((err) != nil) {
//                
//                println(err!.localizedDescription)
//                
//            }
//                
//            else {
//                
//                var success = json["response"] as? String
//                
//                println("Succes: \(success)")
//                
//                
//                
////                if json["response"] as NSString == "Success"
////                    
////                {
////                    
////                    println("Login Successfull")
////                    
////                }
//                
//                self.responseMsg.text=json["msg"] as? String
//                
//                dispatch_async(dispatch_get_main_queue(), {
//                    
//                    //self.loginStatusLB.text=self.responseMsg
//                    
//                })
//                
//                
//                
//            }
//            
//        })
        
        task.resume()

        
    }

}

//class photoViewController: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    /*
//    // MARK: - Navigation
//    
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//    // Get the new view controller using segue.destinationViewController.
//    // Pass the selected object to the new view controller.
//    }
//    */
//    
//}
