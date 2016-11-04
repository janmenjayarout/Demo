//
//  ParseDemoViewController.swift
//  Demo
//
//  Created by Andolasoft on 11/2/16.
//  Copyright © 2016 Jan. All rights reserved.
//

import UIKit

class ParseDemoViewController: UIViewController {

    var tblViewScr : UITableView!
    var scrolVw : UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        txtView.textContainer.maximumNumberOfLines = 2;
//        txtView.layoutManager.textContainerChangedGeometry(txtView.textContainer);

        self.extraDesignAfterStoryboard();

    }

    override func viewDidAppear(animated: Bool) {
        
        //        self.UITableView_Auto_Height();
    }
    
    
    
    //MARK: Design Method
    func extraDesignAfterStoryboard()
    {
        getLocalJsonData();
        //        tblViewScr = UITableView(frame: CGRectMake(0, 80, scrolVw.frame.size.width, 120), style: UITableViewStyle.Plain);
        //        tblViewScr.delegate = self;
        //        tblViewScr.tag = 100;
        //        tblViewScr.dataSource = self;
        //        tblViewScr.scrollEnabled = false;
        //        tblViewScr.backgroundColor = UIColor.redColor();
        //        scrolVw.addSubview(tblViewScr);
    }
    
    func UITableView_Auto_Height()
    {
        if(self.tblViewScr.contentSize.height > self.tblViewScr.frame.height){
            var frame: CGRect = self.tblViewScr.frame;
            frame.size.height = self.tblViewScr.contentSize.height;
            self.tblViewScr.frame = frame;
            
            var contentSize = self.scrolVw.contentSize;
            contentSize.height = CGRectGetMaxY(self.tblViewScr.frame);
            self.scrolVw.contentSize = contentSize;
        }
    }
    
    func getLocalJsonData()
    {
        let filePath = NSBundle.mainBundle().pathForResource("test", ofType: "json");
        
        let data = NSData.init(contentsOfFile: filePath!);
        
        var json : NSArray!
        var jsonTemp : NSDictionary = NSDictionary()
        
        do{
            jsonTemp = try  NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary;
        }catch{
            
        }
        
        print("jsonTemp \(jsonTemp)");
        
        json = jsonTemp["myorders"] as! NSArray;
        
        print("json \(json)");
        
        let arrEvents = NSMutableArray(array: json);
        
        for dictTemp in json
        {
            
            print("oredr id \(dictTemp["orderID"])");
            print("Status id \(dictTemp["orderStatus"])");
            print("Price id \(dictTemp["orderPrice"])");
            
        }
     
        print("array : \(arrEvents)")
    }

    
    /*
    func getLocalJsonData()
    {
    let filePath = NSBundle.mainBundle().pathForResource("test", ofType: "json");
    
    let data = NSData.init(contentsOfFile: filePath!);
    
    var jsonMyOrder : NSArray!
    var jsonTemp : NSDictionary = NSDictionary()
    
    do{
    jsonTemp = try  NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary;
    }catch{
    
    }
    
    print("jsonTemp \(jsonTemp)");
    
    jsonMyOrder = jsonTemp["myorders"] as! NSArray;
    
    print("json \(jsonMyOrder)");
    
    for dictTemp in jsonMyOrder
    {
    
    print("oredr id \(dictTemp["orderID"])");
    print("Status id \(dictTemp["orderStatus"])");
    print("Price id \(dictTemp["orderPrice"])");
    
    }
    }
    */

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
