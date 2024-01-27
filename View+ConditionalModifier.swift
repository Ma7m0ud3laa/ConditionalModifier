//
//  View+ConditionalModifier.swift
//  Condition Modifier
//
//  Created by Mahmoud Alaa on 27/01/2024.
//

import SwiftUI

/// A set of extensions for SwiftUI's `View` protocol, providing conditional modifiers and transformations.

extension View {
    
    /// Conditionally applies a transformation to the view based on a given condition.
    ///
    /// - Parameters:
    ///   - condition: A Boolean value determining whether the transformation should be applied.
    ///   - transform: A closure taking the original view and returning a modified content.
    /// - Returns: If the condition is true, returns the transformed content; otherwise, returns the original view.
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    /// Conditionally applies a transformation to the view based on the unwrapped value of an optional.
    ///
    /// - Parameters:
    ///   - value: An optional value that determines whether the transformation should be applied.
    ///   - transform: A closure taking the original view and the unwrapped value, returning a modified content.
    /// - Returns: If the optional value is non-nil, returns the transformed content; otherwise, returns the original view.
    @ViewBuilder
    func `ifLet`<T, Content: View>(_ value: T?, transform: (Self, T) -> Content) -> some View {
        if let value = value {
            transform(self, value)
        } else {
            self
        }
    }
    
    /// Conditionally applies a custom view modifier to the view based on a given condition.
    ///
    /// - Parameters:
    ///   - condition: A Boolean value determining whether the modifier should be applied.
    ///   - modifier: The view modifier to be applied if the condition is true.
    /// - Returns: If the condition is true, returns the view with the applied modifier; otherwise, returns the original view.
    @ViewBuilder
    func `modifierIf`<Modifier: ViewModifier>(_ condition: Bool, modifier: Modifier) -> some View {
        if condition {
            self.modifier(modifier)
        } else {
            self
        }
    }
    
}
