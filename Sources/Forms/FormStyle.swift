// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/04/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public protocol FieldSettings {
}

public protocol FieldModifier: ViewModifier {
    associatedtype SettingsType: FieldSettings
    associatedtype FormStyleType: FormStyleDescription
    init(settings: SettingsType, formStyle: FormStyleType)
}

public protocol FormStyleDescription where FieldStyleType.FormStyleType == Self {
    associatedtype RowStyleType: ViewModifier
    associatedtype FieldStyleType: FieldModifier

    var headerFont: Font { get }
    var headerOpacity: Double { get }
    var footerFont: Font { get }
    var footerOpacity: Double { get }
    var labelFont: Font { get }
    var labelOpacity: Double { get }
    var contentFont: Font { get }
    var contentOpacity: Double { get }
    var rowPadding: CGFloat { get }
    var rowStyle: RowStyleType { get }
    
    func fieldStyle(settings: FieldStyleType.SettingsType) -> FieldStyleType
}

public class FormStyle<R, F>: ObservableObject, FormStyleDescription where R: ViewModifier, F: FieldModifier {
    public typealias RowStyleType = R
    public typealias FieldStyleType = F
    
    public let headerFont: Font
    public let headerOpacity: Double
    public let footerFont: Font
    public let footerOpacity: Double
    public let labelFont: Font
    public let labelOpacity: Double
    public let contentFont: Font
    public let contentOpacity: Double
    public let rowPadding: CGFloat
    public let rowStyle: RowStyleType

    public init(
        headerFont: Font = .headline, headerOpacity: Double = 1.0,
        footerFont: Font = .body, footerOpacity: Double = 1.0,
        labelFont: Font = .body, labelOpacity: Double = 0.8,
        contentFont: Font = .body, contentOpacity: Double = 1.0,
        rowPadding: CGFloat = 4.0, rowStyle: RowStyleType) {
        self.headerFont = headerFont
        self.headerOpacity = headerOpacity
        self.footerFont = footerFont
        self.footerOpacity = footerOpacity
        self.labelFont = labelFont
        self.labelOpacity = labelOpacity
        self.contentFont = contentFont
        self.contentOpacity = contentOpacity
        self.rowPadding = rowPadding
        self.rowStyle = rowStyle
    }

    public func fieldStyle(settings: FieldStyleType.SettingsType) -> FieldStyleType {
        FieldStyleType(settings: settings, formStyle: self)
    }
    
    func row<Content>(label: String, content: @escaping () -> Content) -> FormRow<Content, RowStyleType> where Content: View {
        FormRow(label: label, style: rowStyle, content: content)
    }

    func field(label: String, placeholder: String? = nil, variable: Binding<String>, settings: FieldStyleType.SettingsType) -> FieldStyleType {
        FormFieldRow<Self>(label: label, placeholder: placeholder, variable: variable, style: self, settings: settings)
    }
    func picker<Variable>(label: String, variable: Binding<Variable>, cases: [Variable]) -> FormPickerRow<Variable, RowStyleType> where Variable: Labelled {
        FormPickerRow(label: label, variable: variable, cases: cases, style: rowStyle)
    }
}

