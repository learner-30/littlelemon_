//
//  Styles.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/10.
//

import SwiftUI

extension Font {
    static var displayTitle = markaziMedium(size: 64)
    static var subTitle = markaziMedium(size: 40)
    static var leadText = karlaMedium(size: 18)
    static var sectionTitle = karlaExtraBold(size: 20)
    static var weekSpecialSection = karlaExtraBold(size: 16)
    
    static func markaziMedium(size: CGFloat) -> Font {
        return Font.custom("MarkaziText-Medium", size: size)
    }
    
    static func markaziRegular(size: CGFloat) -> Font {
        return Font.custom("MarkaziText-Regular", size: size)
    }
    
    static func karlaMedium(size: CGFloat) -> Font {
        return Font.custom("Karla-Regular_Medium", size: size)
    }
    
    static func karlaExtraBold(size: CGFloat) -> Font {
        return Font.custom("Karla-Regular_ExtraBold", size: size)
    }
}

