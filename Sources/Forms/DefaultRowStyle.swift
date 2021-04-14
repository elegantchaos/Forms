// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/04/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct DefaultRowStyle<FormStyle>: ViewModifier where FormStyle: FormStyleDescription {
    let formStyle: FormStyle

    public init(formStyle: FormStyle) {
        self.formStyle = formStyle
    }
    
    public func body(content: Content) -> some View {
        content
            .padding(formStyle.rowPadding)
    }
}
