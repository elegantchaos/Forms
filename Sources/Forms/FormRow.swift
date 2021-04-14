// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/04/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct FormRow<Content, Form>: View where Content: View, Form: FormStyle {
    let label: String
    let alignment: VerticalAlignment
    let style: Form
    let content: () -> Content
    
    public init(label: String, alignment: VerticalAlignment = .firstTextBaseline, style: Form, @ViewBuilder content: @escaping () -> Content) {
        self.label = label
        self.alignment = alignment
        self.style = style
        self.content = content
    }

    public var body: some View {
        HStack(alignment: alignment) {
            Text(label)
                .font(style.labelFont)
                .opacity(style.labelOpacity)
            content()
                .font(style.contentFont)
                .opacity(style.contentOpacity)
                .modifier(style.rowStyle)
        }
    }
}
