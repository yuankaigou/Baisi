//
//  YKMeCell.swift
//  Baisi
//
//  Created by gougou on 2017/4/26.
//  Copyright © 2017年 YKDog. All rights reserved.
//

import UIKit

class YKMeCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //不用返回？
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        self.textLabel?.backgroundColor = UIColor.darkGray
    }
    
    
    
   
    
    

}
