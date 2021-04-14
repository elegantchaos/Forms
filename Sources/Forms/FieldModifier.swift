// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/04/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

/// Settings that change on a per-field basis.
public protocol FieldConfiguration {
    
}

/// Modifier that sets the style of all fields in the form.
public protocol FieldModifier: ViewModifier {
    associatedtype Settings: FieldConfiguration
    associatedtype Form: FormStyle where Form.FieldStyle == Self
    init(settings: Settings, form: Form)
}
