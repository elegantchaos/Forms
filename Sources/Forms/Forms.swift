// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/04/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI
//
//public protocol Labelled: Hashable {
//    var label: String { get }
//}
//
//@available(iOS 14, macOS 11.0, tvOS 14, *) public extension View {
//    func bestFormPickerStyle() -> some View {
//        #if targetEnvironment(macCatalyst)
//                return self
//                    .labelsHidden()
//                    .pickerStyle(MenuPickerStyle())
//        #elseif !os(tvOS)
//            return self
//                .pickerStyle(MenuPickerStyle())
//        #else
//            return self
//                .pickerStyle(InlinePickerStyle())
//        #endif
//    }
//}
//

func test() {
    struct TestFieldSettings: FieldConfiguration {
        var flag = false
    }

    struct TestRowStyle: RowModifier {
        func body(content: Content) -> some View {
            content
        }
    }
    
    struct TestFieldStyle<A: RowModifier>: FieldModifier {
        typealias Form = FormFactory<A,Self>

        let form: Form
        let settings: TestFieldSettings
        
        init(settings: TestFieldSettings, form: Form) {
            self.settings = settings
            self.form = form
        }

        func body(content: Content) -> some View {
            content
        }
    }
    
    let settings = TestFieldSettings()
    let form = FormFactory<TestRowStyle, TestFieldStyle<TestRowStyle>>(rowStyle: TestRowStyle())
    let row = form.row(label: "Test") {
        Text("blah")
    }
    let field = form.field(label: "test", placeholder: "test", variable: .constant("test"), settings: settings)
}

//public protocol FieldSettings {
//}
//
//public protocol FieldModifier: ViewModifier {
//    associatedtype SettingsType: FieldSettings
//    associatedtype FormStyleType: FormStyleDescription where FormStyleType.FieldType == Self
//    init(settings: SettingsType, formStyle: FormStyleType)
//}
//
//public protocol FormStyleDescription {
//    associatedtype RowType: ViewModifier
//    associatedtype FieldType: FieldModifier where FieldType.FormStyleType == Self
//
//    var headerFont: Font { get }
//    var headerOpacity: Double { get }
//    var footerFont: Font { get }
//    var footerOpacity: Double { get }
//    var labelFont: Font { get }
//    var labelOpacity: Double { get }
//    var contentFont: Font { get }
//    var contentOpacity: Double { get }
//    var rowPadding: CGFloat { get }
//    var rowStyle: RowType { get }
//
//    func fieldStyle(settings: FieldType.SettingsType) -> FieldType
//}
//
//public class FormStyle<R: ViewModifier, F: FieldModifier>: ObservableObject, FormStyleDescription where F.FormStyleType == Self {
//    public typealias RowStyleType = R
//    public typealias FieldType = F
//
//    public let headerFont: Font
//    public let headerOpacity: Double
//    public let footerFont: Font
//    public let footerOpacity: Double
//    public let labelFont: Font
//    public let labelOpacity: Double
//    public let contentFont: Font
//    public let contentOpacity: Double
//    public let rowPadding: CGFloat
//    public let rowStyle: RowStyleType
//
//    public init(
//        headerFont: Font = .headline, headerOpacity: Double = 1.0,
//        footerFont: Font = .body, footerOpacity: Double = 1.0,
//        labelFont: Font = .body, labelOpacity: Double = 0.8,
//        contentFont: Font = .body, contentOpacity: Double = 1.0,
//        rowPadding: CGFloat = 4.0, rowStyle: RowStyleType) {
//        self.headerFont = headerFont
//        self.headerOpacity = headerOpacity
//        self.footerFont = footerFont
//        self.footerOpacity = footerOpacity
//        self.labelFont = labelFont
//        self.labelOpacity = labelOpacity
//        self.contentFont = contentFont
//        self.contentOpacity = contentOpacity
//        self.rowPadding = rowPadding
//        self.rowStyle = rowStyle
//    }
//
//    public func fieldStyle(settings: F.SettingsType) -> F {
//        FieldType(settings: settings, formStyle: self)
//    }
//
//    func row<Content>(label: String, content: @escaping () -> Content) -> FormRow<Content, RowStyleType> where Content: View {
//        FormRow(label: label, style: rowStyle, content: content)
//    }
//
//    func field(label: String, placeholder: String? = nil, variable: Binding<String>, settings: FieldType.SettingsType) -> FieldType {
//        FormFieldRow<Self>(label: label, placeholder: placeholder, variable: variable, style: self, settings: settings)
//    }
//    func picker<Variable>(label: String, variable: Binding<Variable>, cases: [Variable]) -> FormPickerRow<Variable, RowStyleType> where Variable: Labelled {
//        FormPickerRow(label: label, variable: variable, cases: cases, style: rowStyle)
//    }
//}
//
