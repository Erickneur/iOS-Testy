//
//  LocalizableButton.swift
//  sidemenu
//
//  Created by Erick Dávila on 3/3/20.
//  Copyright © 2020 Erick Dávila. All rights reserved.
//

import UIKit

class LocalizableButton: UIButton {

    override func awakeFromNib() {
        for state in [UIControl.State.normal, UIControl.State.highlighted, UIControl.State.selected, UIControl.State.disabled]{
            if let title = title(for: state){
                setTitle(NSLocalizedString(title, comment: ""), for: state)
            }
        }
    }
}
