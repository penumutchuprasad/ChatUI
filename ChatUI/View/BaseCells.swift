//BaseCells.swift
/*
 * ChatUI
 * Created by penumutchu.prasad@gmail.com on 07/04/19
 * Is a product created by abnboys
 * For the ChatUI in the ChatUI
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class LKBaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    /**
     * Overriding a parent method does nothing, but could use for intialising subviews
     * This will be called on at the time of cell intialisation
     */
    func setupViews() {
        
    }
}

class LKBaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    /**
     * Overriding a parent method does nothing, but could use for intialising subviews
     * This will be called on at the time of cell intialisation
     */
    func setupViews() {
        
    }
}
