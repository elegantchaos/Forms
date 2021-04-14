// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 12/08/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public protocol Labelled: Hashable {
    var label: String { get }
}

@available(iOS 14, macOS 11.0, tvOS 14, *) public extension View {
    func bestFormPickerStyle() -> some View {
        #if targetEnvironment(macCatalyst)
                return self
                    .labelsHidden()
                    .pickerStyle(MenuPickerStyle())
        #elseif !os(tvOS)
            return self
                .pickerStyle(MenuPickerStyle())
        #else
            return self
                .pickerStyle(InlinePickerStyle())
        #endif
    }
}

