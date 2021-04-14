// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/04/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

/// Contains all style settings for the form.
/// Defines factory methods which create form rows.

public struct FormFactory<RowType, FieldType>: FormStyle where RowType: RowModifier, FieldType: FieldModifier {
    public typealias RowStyle = RowType
    public typealias FieldStyle = FieldType
    
    public let headerFont: Font
    public let headerOpacity: Double
    public let footerFont: Font
    public let footerOpacity: Double
    public let labelFont: Font
    public let labelOpacity: Double
    public let contentFont: Font
    public let contentOpacity: Double
    public let rowPadding: CGFloat
    public let rowStyle: RowStyle
    
    public init(
        headerFont: Font = .headline, headerOpacity: Double = 1.0,
        footerFont: Font = .body, footerOpacity: Double = 1.0,
        labelFont: Font = .body, labelOpacity: Double = 0.8,
        contentFont: Font = .body, contentOpacity: Double = 1.0,
        rowPadding: CGFloat = 4.0, rowStyle: RowStyle) {
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

    func row<Content>(label: String, content: @escaping () -> Content) -> FormRow<Content, Self> where Content: View {
        FormRow(label: label, style: self, content: content)
    }
    
    func field(label: String, placeholder: String? = nil, variable: Binding<String>, settings: FieldType.Settings) -> FieldRow<FieldType> where FieldType.Form == Self {
        FieldRow<FieldType>(label: label, placeholder: placeholder, variable: variable, style: self, settings: settings)
    }
    
    //    func picker<Variable>(label: String, variable: Binding<Variable>, cases: [Variable]) -> FormPickerRow<Variable, RowStyleType> where Variable: Labelled {
    //        FormPickerRow(label: label, variable: variable, cases: cases, style: rowStyle)
    //    }
}
