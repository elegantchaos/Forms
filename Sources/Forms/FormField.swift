// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/04/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct FormFieldRow<FieldStyle>: View where FieldStyle: FieldModifier {
    let label: String
    let placeholder: String
    let variable: Binding<String>
    let clearButton: Bool
    let style: FieldStyle.FormStyle
    let modifier: FieldStyle
    
    public init(label: String, placeholder: String? = nil, variable: Binding<String>, style: FieldStyle.FormStyle, settings: FieldStyle.Settings, clearButton: Bool = false) {
        self.label = label
        self.variable = variable
        self.style = style
        self.placeholder = placeholder ?? label
        self.clearButton = clearButton
        self.modifier = FieldStyle(settings: settings, form: style)
    }

    public var body: some View {
        FormRow(label: label, style: style) {
            if clearButton {
                TextField(placeholder, text: variable)
                    .modifier(style.rowStyle)
//                    .modifier(ClearButton(text: variable))
            } else {
                TextField(placeholder, text: variable)
                    .modifier(self.modifier)
            }
        }
    }
}

#if canImport(UIKit)

@available(macOS 11.0, *) public struct DefaultFormFieldSettings : FieldSettings {
    let contentType: UITextContentType?
    let autocapitalization: UITextAutocapitalizationType
    let disableAutocorrection: Bool
    let keyboardType: UIKeyboardType

    public init(contentType: UITextContentType? = nil, autocapitalization: UITextAutocapitalizationType = .none, disableAutocorrection: Bool = true, keyboardType: UIKeyboardType = .default) {
        self.contentType = contentType
        self.autocapitalization = autocapitalization
        self.disableAutocorrection = disableAutocorrection
        self.keyboardType = keyboardType
    }
}

@available(macOS 11.0, *) public struct DefaultFormFieldStyle<RowStyle: RowModifier> : FieldModifier {
    public typealias FormStyle = FormFactory<RowStyle, Self>

    let form: FormStyle
    let settings: DefaultFormFieldSettings

    public init(settings: DefaultFormFieldSettings, form: FormStyle) {
        self.settings = settings
        self.form = form
    }

    public func body(content: Content) -> some View {

        content
            .textContentType(settings.contentType)
            .autocapitalization(settings.autocapitalization)
            .disableAutocorrection(settings.disableAutocorrection)
            .keyboardType(settings.keyboardType)
            .padding(form.rowPadding)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

#endif
