// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/04/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct FormToggleRow<Style>: View where Style: ViewModifier {
    let label: String
    let variable: Binding<Bool>
    let style: Style
    
    public init(label: String, variable: Binding<Bool>, style: Style) {
        self.label = label
        self.variable = variable
        self.style = style
    }
    public var body: some View {
        FormRow(label: label, style: style) {
            Toggle("", isOn: variable)
                .labelsHidden()
        }
    }
}

public extension FormToggleRow where Style == DefaultRowStyle {
    init(label: String, variable: Binding<Bool>) {
        self.init(label: label, variable: variable, style: DefaultRowStyle())
    }
}
