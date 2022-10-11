//
//  Extension.swift
//  Sleep iOS
//
//  Created by srivats venkataraman on 10/7/22.
//

import Foundation

extension DateComponentsFormatter{
    static let positional: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
    }()
}
