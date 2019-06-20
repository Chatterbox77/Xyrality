//
//  UIVIew+XyralityExtensions.swift
//  Xyrality
//
//  Created by macBook pro on 6/20/19.
//  Copyright © 2019 AndriiHorban. All rights reserved.
//

import UIKit
extension UIView
{
    func fixInputAssistant()
    {
        for subview in self.subviews
        {
            if type(of: subview) is UITextField.Type
            {
                let item = (subview as! UITextField).inputAssistantItem
                item.leadingBarButtonGroups = []
                item.trailingBarButtonGroups = []
            }
            else if subview.subviews.count > 0
            {
                subview.fixInputAssistant()
            }
        } 
    }
}

