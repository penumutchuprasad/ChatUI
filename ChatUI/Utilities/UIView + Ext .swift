//UIView.swift
/*
 * ChatUI
 * Created by penumutchu.prasad@gmail.com on 07/04/19
 * Is a product created by abnboys
 * For the ChatUI in the ChatUI
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

extension UIView {
    
    /** Adds Constraints in Visual Formate Language. It is a helper method defined in extensions for convinience usage
     
     - Parameter format: string formate as we give in visual formate, but view placeholders are like v0,v1, etc
     - Parameter views: It is a variadic Parameter, so pass the sub-views with "," seperated.
     */
    func addConstraintsWithVisualStrings(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    /** This method binds the view with frame of keyboard frame. So, The View will change its frame with the height of the keyboard's height */
    func bindToTheKeyboard(_ bottomConstaint: NSLayoutConstraint? = nil) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: bottomConstaint)
    }
    
    @objc func keyboardWillChange(_ notification: NSNotification) {
        
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let curveframe = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let targetFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let deltaY = targetFrame.origin.y - curveframe.origin.y
        
        if let constraint = notification.object as? NSLayoutConstraint {
            constraint.constant = deltaY
            UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions.init(rawValue: curve), animations: {
                self.layoutIfNeeded()
            }, completion: nil)
            
        } else {
            UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions.init(rawValue: curve), animations: {
                self.frame.origin.y += deltaY
            }, completion: nil)
        }
    }
}
