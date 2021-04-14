// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/04/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct FormFieldRow<Style>: View where Style: FormStyleDescription {
    let label: String
    let placeholder: String
    let variable: Binding<String>
    let clearButton: Bool
    let style: Style
    let modifier: Style.FieldStyleType
    
    public init(label: String, placeholder: String? = nil, variable: Binding<String>, style: Style, settings: Style.FieldStyleType.SettingsType, clearButton: Bool = false) {
        self.label = label
        self.variable = variable
        self.style = style
        self.placeholder = placeholder ?? label
        self.clearButton = clearButton
        self.modifier = Style.FieldStyleType(settings: settings, formStyle: style)
    }

    public var body: some View {
        FormRow(label: label, style: style) {
            if clearButton {
                TextField(placeholder, text: variable)
                    .modifier(style.rowStyle)
                    .modifier(ClearButton(text: variable))
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

@available(macOS 11.0, *) public struct DefaultFormFieldStyle<FormStyle> : FieldStyleP where FormStyle: FormStyleDescription {
    let settings: DefaultFormFieldSettings
    let formStyle: FormStyle

    public init(settings: DefaultFormFieldSettings, formStyle: FormStyle) {
        self.settings = settings
        self.formStyle = formStyle
    }

    public func body(content: Content) -> some View {

        content
            .textContentType(settings.contentType)
            .autocapitalization(settings.autocapitalization)
            .disableAutocorrection(settings.disableAutocorrection)
            .keyboardType(settings.keyboardType)
            .padding(formStyle.rowPadding)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

#endif
