//
//  String+Extensions.swift
//  herbs
//
//  Created by Fernando Marins on 04/04/22.
//

import UIKit

extension String {
    func withBoldText(boldPartsOfString: Array<NSString>, font: UIFont, boldFont: UIFont) -> NSAttributedString {
        let nonBoldFontAttribute = [NSAttributedString.Key.font: font]
        let boldFontAttribute = [NSAttributedString.Key.font: boldFont]
        let boldString = NSMutableAttributedString(string: self as String, attributes: nonBoldFontAttribute)
        for i in 0 ..< boldPartsOfString.count {
            boldString.addAttributes(boldFontAttribute, range: (self as NSString).range(of: boldPartsOfString[i] as String))
        }
        return boldString
    }
}
