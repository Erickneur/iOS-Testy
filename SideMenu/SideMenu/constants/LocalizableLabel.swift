//
//  LocalizableLabel.swift
//  sidemenu
//
//  Created by Erick Dávila on 3/3/20.
//  Copyright © 2020 Erick Dávila. All rights reserved.
//

import UIKit

class LocalizableLabel: UILabel {

    override func awakeFromNib() {
        if let text = text {
            self.text = NSLocalizedString(text, comment: "")
        }
    }

}
