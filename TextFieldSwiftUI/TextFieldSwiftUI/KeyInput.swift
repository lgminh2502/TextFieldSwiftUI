//
//  KeyInput.swift
//  TextFieldSwiftUI
//
//  Created by Admin on 20/11/2023.
//

//import Foundation
//import SwiftUI
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//@dynamicMemberLookup
//public struct EnvironmentViewBuilder<Body: View, Value> {
//    var body: Body
//    var keyPath: WritableKeyPath<EnvironmentValues, Value>
//    
//    public subscript<T>(dynamicMember keyPath: WritableKeyPath<Value, T>) -> EnvironmentViewBuilder<Body, T> {
//        EnvironmentViewBuilder<Body, T>(body: body, keyPath: self.keyPath.appending(path: keyPath))
//    }
//    
//    public func callAsFunction(_ value: Value) -> EnvironmentView<Body, Value> {
//        EnvironmentView(content: body, keyPath: keyPath, value: value)
//    }
//}
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//@dynamicMemberLookup
//public struct EnvironmentView<Content: View, Value>: View {
//    var content: Content
//    var keyPath: WritableKeyPath<EnvironmentValues, Value>
//    var value: Value
//    
//    public var body: some View {
//        content.environment(keyPath, value)
//    }
//    
//    public subscript<T>(dynamicMember keyPath: WritableKeyPath<EnvironmentValues, T>) -> EnvironmentViewBuilder<Self, T> {
//        EnvironmentViewBuilder<Self, T>(body: self, keyPath: keyPath)
//    }
//}
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//extension View {
//    public var environment: EnvironmentViewBuilder<Self, EnvironmentValues> {
//        EnvironmentViewBuilder(body: self, keyPath: \.self)
//    }
//}
//
//import Foundation
//
//import SwiftUI
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//public protocol KeyInput {
//    func insertText(_ text: String)
//    func deleteBackward()
//}
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//public protocol KeyOutput {
//    func setInput(_ input: KeyInput)
//}
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//public final class KeyBridge: ObservableObject, KeyInput, KeyOutput {
//    
//    private var currentInput: KeyInput?
//    
//    public init() {}
//    
//    public func insertText(_ text: String) {
//        currentInput?.insertText(text)
//    }
//    
//    public func deleteBackward() {
//        currentInput?.deleteBackward()
//    }
//    
//    public func setInput(_ input: KeyInput) {
//        currentInput = input
//        //        objectWillChange.send()
//    }
//}
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//enum KeyOutputKey: EnvironmentKey {
//    static var defaultValue: KeyOutput? { nil }
//}
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//extension EnvironmentValues {
//    public var keyOutput: KeyOutput? {
//        get { self[KeyOutputKey.self] }
//        set { self[KeyOutputKey.self] = newValue }
//    }
//}
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//extension Binding: KeyInput where Value == String {
//    
//    public func insertText(_ text: String) {
//        wrappedValue.append(text)
//    }
//    
//    public func deleteBackward() {
//        guard !wrappedValue.isEmpty else { return }
//        wrappedValue.removeLast()
//    }
//}
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//extension View {
//    
//    public func field(keyOutput: KeyOutput?) -> some View {
//        environment(KeyOutputKey.self, keyOutput)
//    }
//}
//
