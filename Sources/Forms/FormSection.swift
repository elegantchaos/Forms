// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/04/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct FormSection<Header,Footer,Content>: View where Content: View, Header: View, Footer: View {
    @EnvironmentObject var style: FormStyle

    let header: () -> Header
    let footer: () -> Footer
    let content: () -> Content

    public init(@ViewBuilder header: @escaping () -> Header, @ViewBuilder footer: @escaping () -> Footer, @ViewBuilder content: @escaping () -> Content) {
        self.header = header
        self.footer = footer
        self.content = content
    }

    public init(header: String, footer: String, @ViewBuilder content: @escaping () -> Content) where Header == Text, Footer == FormDefaultFooter {
        self.header = { return Text(header) }
        self.footer = { return FormDefaultFooter(text: footer) }
        self.content = content
    }
    
    public var body: some View {
        Section(
            header:
                header()
                .font(style.headerFont)
                .opacity(style.headerOpacity),
            
            footer:
                footer()
                .font(style.footerFont)
                .opacity(style.footerOpacity),
            
            content: content
        )
    }
}

public struct FormDefaultHeader: View {
    @EnvironmentObject var style: FormStyle

    let text: String
    
    public var body: some View {
        Text(text)
            .font(style.headerFont)
    }
}

public struct FormDefaultFooter: View {
    @EnvironmentObject var style: FormStyle

    let text: String
    
    public var body: some View {
        HStack {
            Spacer()
            Text(text)
            .multilineTextAlignment(.trailing)
        }
    }
}
