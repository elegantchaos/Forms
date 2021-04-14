// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/04/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct FormRow<Content, FormStyle>: View where Content: View, FormStyle: FormStyleDescription {
    let label: String
    let alignment: VerticalAlignment
    let style: FormStyle
    let content: () -> Content
    
    public init(label: String, alignment: VerticalAlignment = .firstTextBaseline, style: FormStyle, @ViewBuilder content: @escaping () -> Content) {
        self.label = label
        self.alignment = alignment
        self.style = style
        self.content = content
    }

    public var body: some View {
        HStack(alignment: alignment) {
            AlignedLabel(label)
                .font(style.labelFont)
                .opacity(style.labelOpacity)
            content()
                .font(style.contentFont)
                .opacity(style.contentOpacity)
                .modifier(style.rowStyle)
        }
    }
}
