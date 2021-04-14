// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/04/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct FormPickerRow<Variable, Style>: View where Variable: Labelled, Style: FormStyleDescription {
    let label: String
    let variable: Binding<Variable>
    let cases: [Variable]
    let style: Style
    
    public init(label: String, variable: Binding<Variable>, cases: [Variable], style: Style) {
        self.label = label
        self.variable = variable
        self.cases = cases
        self.style = style
    }
    
    public var body: some View {
        return FormRow(label: label, style: style) {
            Picker(variable.wrappedValue.label, selection: variable) {
                ForEach(cases, id: \.self) { rate in
                    Text(rate.label)
                }
            }
        }
    }
}
