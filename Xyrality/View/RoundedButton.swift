//
//  RNDMButton.swift
//  RNDM
//
//  Created by macBook pro on 6/7/19.
//  Copyright © 2019 AndriiHorban. All rights reserved.
//

import UIKit
import TransitionButton
@IBDesignable
class RoundedButton: TransitionButton {
    
    override func awakeFromNib() {
        setupView()
    }
    func setupView(){
        self.layer.cornerRadius = 10
        self.backgroundColor = COLOR_ORANGE
        self.setTitleColor(.white, for: .normal)
    }
    override func prepareForInterfaceBuilder() {
        setupView()
    }
   

}
