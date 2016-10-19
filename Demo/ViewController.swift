//
//  ViewController.swift
//  Demo
//
//  Created by Andolasoft on 10/18/16.
//  Copyright © 2016 Jan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    var tblList:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        designMainScreen();
    }

    func designMainScreen() -> Void
    {
        tblList = UITableView();
        tblList.frame = CGRectMake(0, 64, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height-64);
        tblList.delegate = self;
        tblList.dataSource = self;
        tblList.backgroundColor = UIColor.clearColor();
        
        tblList.registerClass(SampleTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tblList);
        
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 100;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SampleTableViewCell
        
        cell.imgVwLogo.image = UIImage(named: "BG.png")
        cell.lblTitle.text = NSString(format: "index %ld", indexPath.row) as String
        
        let imageView = UIImageView()
        imageView.frame = (cell.imgVwLogo.frame)
        imageView.image = UIImage(named: "Default.png")
        cell.imgVwLogo.addSubview(imageView)
        imageView.backgroundColor = UIColor.redColor();
        
        
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.separatorColor = UIColor.redColor()
        
        cell.txtFld.delegate = self;
        cell.txtFld.tag = indexPath.row + 100
        
        cell.selectionStyle = UITableViewCellSelectionStyle.Gray;
        
        
        return cell;
    }
    //MARK:UITextField Delegate
    
    // return NO to disallow editing.
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool
    {
        return true;
    }
    
    func textFieldDidBeginEditing(textField: UITextField)
    {
        
        //textField.inputAccessoryView = numberToolbar
        if(textField.tag == 100)
        {
            textField.returnKeyType = UIReturnKeyType.Done
        }
        else
        {
            textField.returnKeyType = UIReturnKeyType.Next
        }
    }

    // called when 'return' key pressed. return NO to ignore.
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder();
        
        if(textField.tag >= 100 && textField.tag < 110)
        {
            let txtFld = self.tblList.viewWithTag(textField.tag + 1);
            txtFld?.becomeFirstResponder();
        }
        
        return true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

