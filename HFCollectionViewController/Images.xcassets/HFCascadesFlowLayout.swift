//
//  HFCascadesFlowLayout.swift
//  HFCollectionViewController
//
//  Created by Hufei on 15/4/2.
//  Copyright (c) 2015年 Hufei. All rights reserved.
//

import UIKit

class HFCascadesFlowLayout: UICollectionViewLayout {
    let defaultInset = UIEdgeInsetsMake(10, 10, 10, 10)
    let defaultColumnMargin:CGFloat = 10.0
    let defaultRowMargin:CGFloat = 10.0
    let defaultColumnCount = 3
    var currentColumnIndex = 0
    var currentRowHeight:[CGFloat] = [0,0,0]
    var attributes = [AnyObject]()
    override func prepareLayout() {
        super.prepareLayout()
        currentRowHeight = [0,0,0]
        var array = [UICollectionViewLayoutAttributes]()
        let totalCount:Int = collectionView!.numberOfItemsInSection(0)
        for i in 0 ..< totalCount{
            let attribute = layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: i, inSection: 0))
            array.append(attribute)
        }
        attributes = array;

    }

    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        let columnWidth:CGFloat = (UIScreen.mainScreen().bounds.width - CGFloat(defaultColumnCount + 1) * defaultColumnMargin) / CGFloat(defaultColumnCount)
        for (index, oldHeight) in enumerate(currentRowHeight){
            if oldHeight < currentRowHeight[currentColumnIndex]{
            currentColumnIndex = index
            }
        }
        var x:CGFloat = defaultRowMargin + CGFloat(currentColumnIndex) * (columnWidth + defaultRowMargin)
        var y:CGFloat = currentRowHeight[currentColumnIndex]
        var width:CGFloat = columnWidth
        var height:CGFloat = CGFloat(arc4random_uniform(80)) + CGFloat(50)
        attribute.frame = CGRectMake(x, y, width, height)
        currentRowHeight[currentColumnIndex] = y + height;
        return attribute
    }
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        return attributes
        
    }
    override func collectionViewContentSize() -> CGSize {
        var width:CGFloat = 0.0
        var height:CGFloat = currentRowHeight[currentColumnIndex]
        return CGSizeMake(width, height)
    }
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return false
    }
}
