//
//  collectionModel.swift
//  HFCollectionViewController
//
//  Created by Hufei on 15/4/8.
//  Copyright (c) 2015年 Hufei. All rights reserved.
//

import UIKit

class collectionModel: NSObject {
    let width:CGFloat
    let height:CGFloat
    var xPoint:CGFloat = 0
    var yPoint:CGFloat = 0
    init(width:CGFloat, height:CGFloat) {
      self.width = width
        self.height = height
    }
}
