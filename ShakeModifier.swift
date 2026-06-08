
import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

// MARK: - ShakeEffect

/// A `GeometryEffect` that produces a horizontal shake translation.
///
/// Animate `animatableData` from 0 → 1 (or any integer increment) to trigger
/// the oscillation. The sine wave produces `shakesPerUnit` full back-and-forth
/// cycles over one unit of `animatableData`.
public struct ShakeEffect: GeometryEffect {

    /// Peak displacement in points (mirrors the UIKit version's 2 pt offset × 5 shakes).
    public var amount: CGFloat = 10

    /// Number of back-and-forth oscillations per unit of `animatableData`.
    public var shakesPerUnit: Int = 3

    /// The value SwiftUI interpolates to drive the animation.
    public var animatableData: CGFloat

    public init(animatableData: CGFloat, amount: CGFloat = 10, shakesPerUnit: Int = 3) {
        self.animatableData = animatableData
        self.amount = amount
        self.shakesPerUnit = shakesPerUnit
    }

    public func effectValue(size: CGSize) -> ProjectionTransform {
        let translation = amount * sin(animatableData * .pi * CGFloat(shakesPerUnit))
        return ProjectionTransform(CGAffineTransform(translationX: translation, y: 0))
    }
}

// MARK: - ShakeModifier

/// A `ViewModifier` that shakes its content horizontally whenever `trigger` changes.
///
/// Increment `trigger` (e.g. an error count) to start a new shake. When
/// VoiceOver is active the shake is suppressed — pass an `accessibilityAnnouncement`
/// to have a message read aloud instead, matching the UIKit version's behaviour.
///
/// ```swift
/// // Basic usage — shakes every time errorCount is incremented
/// TextField("Username", text: $username)
///     .modifier(ShakeModifier(trigger: errorCount))
///
/// // With a VoiceOver announcement
/// TextField("Username", text: $username)
///     .modifier(ShakeModifier(trigger: errorCount,
///                             accessibilityAnnouncement: "Username field is required"))
/// ```
public struct ShakeModifier: ViewModifier {

    /// Increment this value to trigger a new shake.
    public let trigger: Int

    /// Optional text announced via VoiceOver instead of (or alongside) the shake.
    public let accessibilityAnnouncement: String?

    public init(trigger: Int, accessibilityAnnouncement: String? = nil) {
        self.trigger = trigger
        self.accessibilityAnnouncement = accessibilityAnnouncement
    }

    public func body(content: Content) -> some View {
        content
            .modifier(ShakeEffect(animatableData: CGFloat(trigger)))
            .animation(.default, value: trigger)
            .onChangeCompat(of: trigger) { newValue in
                guard newValue != 0 else { return }
                #if canImport(UIKit)
                if UIAccessibility.isVoiceOverRunning, let announcement = accessibilityAnnouncement {
                    UIAccessibility.post(notification: .announcement, argument: announcement)
                }
                #endif
            }
    }
}

// MARK: - Compat helpers

private extension View {
    @ViewBuilder
    func onChangeCompat<T: Equatable>(of value: T, perform: @escaping (T) -> Void) -> some View {
        if #available(iOS 17, macOS 14, tvOS 17, watchOS 10, *) {
            self.onChange(of: value) { _, newValue in perform(newValue) }
        } else {
            self.onChange(of: value, perform: perform)
        }
    }
}

// MARK: - View extension

public extension View {

    /// Shakes the view horizontally whenever `trigger` changes value.
    ///
    /// - Parameters:
    ///   - trigger: Increment this integer to start a shake (e.g. your error count).
    ///   - accessibilityAnnouncement: Text read by VoiceOver when `trigger` changes.
    ///     When VoiceOver is active the visual shake is still applied; the announcement
    ///     is *additional* context for screen-reader users.
    /// - Returns: A view that shakes on each `trigger` increment.
    func shake(trigger: Int, accessibilityAnnouncement: String? = nil) -> some View {
        modifier(ShakeModifier(trigger: trigger, accessibilityAnnouncement: accessibilityAnnouncement))
    }
}
