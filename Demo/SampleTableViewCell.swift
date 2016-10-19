//
//  SampleTableViewCell.swift
//  SwiftLearn
//
//  Created by Andolasoft on 9/7/16.
//  Copyright © 2016 Andolasoft. All rights reserved.
//

import UIKit

class SampleTableViewCell: UITableViewCell {

    var imgVwLogo : UIImageView!
    var lblTitle  : UILabel!
    var txtFld    : UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imgVwLogo = UIImageView(frame: CGRectMake(5, 0, 70, 70))
        imgVwLogo.backgroundColor = UIColor.redColor();
        self.addSubview(imgVwLogo);
        
        lblTitle = UILabel();
        lblTitle.textAlignment = NSTextAlignment.Left;
        lblTitle.font = UIFont(name: "Avenir", size: 20);
        self.addSubview(lblTitle);
        
        txtFld = UITextField();
        txtFld.textAlignment = NSTextAlignment.Left;
        txtFld.font = UIFont(name: "Avenir", size: 20);
        txtFld.backgroundColor = UIColor.yellowColor()
        self.addSubview(txtFld);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        lblTitle.frame = CGRectMake(CGRectGetMaxX(imgVwLogo.frame) + 10, 5, CGRectGetWidth(self.frame) - CGRectGetWidth(imgVwLogo.frame) - 30, 30);
        
        txtFld.frame = CGRectMake(CGRectGetMinX(lblTitle.frame), CGRectGetMaxY(lblTitle.frame) + 5, CGRectGetWidth(lblTitle.frame), 30);
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
