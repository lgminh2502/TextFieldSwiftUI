//
//  Envionment++.swift
//  TextFieldSwiftUI
//
//  Created by Admin on 20/11/2023.
//

//import Foundation
//
//import SwiftUI
//
//private struct TypeKey<T>: Hashable {}
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//private extension EnvironmentValues {
//    subscript<T: EnvironmentKey>(type: TypeKey<T>) -> T.Value {
//        get { self[T.self] }
//        set { self[T.self] = newValue }
//    }
//}
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//extension View {
//    
//    public func environment<Key: EnvironmentKey>(_ key: Key.Type, _ value: Key.Value) -> some View {
//        environment(\.[TypeKey<Key>()], value)
//    }
//}
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//extension Environment {
//    
//    public init<Key: EnvironmentKey>(_ type: Key.Type) where Key.Value == Value {
//        self.init(\.[TypeKey<Key>()])
//    }
//}
