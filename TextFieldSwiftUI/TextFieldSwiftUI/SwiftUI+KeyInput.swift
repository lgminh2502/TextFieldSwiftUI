//
//  SwiftUI+KeyInput.swift
//  TextFieldSwiftUI
//
//  Created by Admin on 20/11/2023.
//

//import SwiftUI
//
//struct KeyInput: NSViewRepresentable {
//    var isFocused: Bool // FIXME: Can this be integrated with the `focused` modifier?
//    var insertText: (String) -> Void
//    var deleteBackward: () -> Void
//    
//    class UIViewType: UIView, UIKeyInput {
//        var _insertText: (String) -> Void
//        var _deleteBackward: () -> Void
//        init(insertText: @escaping (String) -> Void, deleteBackward: @escaping () -> Void) {
//            self._insertText = insertText
//            self._deleteBackward = deleteBackward
//            super.init(frame: .zero)
//        }
//        
//        required init?(coder: NSCoder) {
//            fatalError()
//        }
//        
//        var hasText: Bool {
//            false // FIXME: Should this be exposed? How should this be set?
//        }
//        
//        func insertText(_ text: String) {
//            _insertText(text)
//        }
//        
//        func deleteBackward() {
//            _deleteBackward()
//        }
//        
//        override var canBecomeFirstResponder: Bool {
//          return true
//        }
//    }
//    
//    func makeUIView(context: Context) -> UIViewType {
//        UIViewType(insertText: insertText, deleteBackward: deleteBackward)
//    }
//    
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//        if isFocused && !uiView.isFirstResponder {
//            uiView.becomeFirstResponder()
//        } else if !isFocused && uiView.isFirstResponder {
//            uiView.resignFirstResponder()
//        }
//    }
//}
