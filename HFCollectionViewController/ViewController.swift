//
//  ViewController.swift
//  HFCollectionViewController
//
//  Created by Hufei on 15/4/2.
//  Copyright (c) 2015年 Hufei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
        var dataAr = [collectionModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = HFCascadesFlowLayout()
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
        collectionView.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.greenColor()
        collectionView.dataSource = self
        for _ in 0 ..< 30 {
            let model = collectionModel(width: 0, height: CGFloat(arc4random_uniform(50) + 50))
            dataAr.append(model)
            }
        view.addSubview(collectionView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
        let red:CGFloat = CGFloat(arc4random_uniform(256))/255
        let green:CGFloat = CGFloat(arc4random_uniform(256))/255
        let blue:CGFloat = CGFloat(arc4random_uniform(256))/255
        cell.backgroundColor = UIColor(red:red, green: green, blue:blue, alpha: 1.0)
        cell.layer.borderColor = UIColor.cyanColor().CGColor
        cell.layer.borderWidth = 1.0
        return cell
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataAr.count
    }


}

