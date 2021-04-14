// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/04/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

/// Protocol that FormFactories conform to.
/// Returns standard style information used by the various form components.

public protocol FormStyle {
    associatedtype RowStyle: RowModifier
    associatedtype FieldStyle: FieldModifier

    var headerFont: Font { get }
    var headerOpacity: Double { get }
    var footerFont: Font { get }
    var footerOpacity: Double { get }
    var labelFont: Font { get }
    var labelOpacity: Double { get }
    var contentFont: Font { get }
    var contentOpacity: Double { get }
    var rowPadding: CGFloat { get }
    var rowStyle: RowStyle { get }
}
