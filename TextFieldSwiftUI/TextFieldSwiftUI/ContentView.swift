//
//  ContentView.swift
//  TextFieldSwiftUI
//
//  Created by Admin on 20/11/2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var text1: String = ""
    @State private var text2: String = ""
    @State private var text3: String = ""
    @State private var text4: String = ""
    
    @State var isTextFieldFocus1: Bool = false
    @State var isTextFieldFocus2: Bool = false
    @State var isTextFieldFocus3: Bool = false
    @State var isTextFieldFocus4: Bool = false
    
    @State var triggersFocus1: Bool = false
    @State var triggersFocus2: Bool = false
    @State var triggersFocus3: Bool = false
    @State var triggersFocus4: Bool = false
    
    @State var isHovering1: Bool = false
    @State var isHovering2: Bool = false
    @State var isHovering3: Bool = false
    @State var isHovering4: Bool = false
    
    private enum Constant {
        static let characterLimit = 3
    }
    
    func getValidIPValue(_ text: String) -> Int {
        return min(max(0, Int(text) ?? 0 ), 255)
    }
    
    var body: some View {
        VStack {
            HStack {
                DidEndEditingTextField(tag: 0, placeholder: "N", limit: Constant.characterLimit, digitOnly: true, text: $text1, isFocus: $isTextFieldFocus1, triggersFocus: $triggersFocus1, onDeleteBackward: {
                    print("onDeleteBackward text1")
                }, shouldMoveToNextFocusWhenReachedLimit: {
                    triggersFocus2 = true
                })
                .onChange(of: isTextFieldFocus1) { newValue in
                    print("isTextFieldFocus1 newValue \(newValue)")
                }
                .onChange(of: text1, perform: { newValue in
                    print("onChange text1 \(newValue)")
                    if newValue.isEmpty {
                        return
                    }
//                    let value = String(newValue.prefix(3))
//                    let intValue = Int(value) ?? 0
//                    let min = min(intValue, 255)
                    
                    text1 = "\(getValidIPValue(newValue))"
                    if text1.count == Constant.characterLimit {
                        if !triggersFocus2 {
                            triggersFocus2 = true
                        }
                    }
                    //          if newValue.count > 3 {
                    //            let value = String(newValue.prefix(3))
                    //            let intValue = Int(value) ?? 0
                    //            let min = min(intValue, 255)
                    //            text1 = "\(min)"
                    //            text2 = String(newValue.suffix(1))
                    //            triggersFocus2 = true
                    //          } else {
                    //              let value = String(newValue.prefix(3))
                    //              let intValue = Int(value) ?? 0
                    //              let min = min(intValue, 255)
                    //              text1 = "\(min)"
                    //          }
                })
                .frame(width: 50, height: 50)
                DidEndEditingTextField(tag: 1, placeholder: "N", limit: Constant.characterLimit, digitOnly: true, text: $text2, isFocus: $isTextFieldFocus2, triggersFocus: $triggersFocus2, onDeleteBackward: {
                    print("onDeleteBackward text2")
                    triggersFocus1 = true
                }, shouldMoveToNextFocusWhenReachedLimit: {
                    triggersFocus3 = true
                })
                .onChange(of: isTextFieldFocus2) { newValue in
                    print("isTextFieldFocus2 newValue \(newValue)")
                }
                .onChange(of: text2, perform: { newValue in
                    print("onChange text2 \(newValue)")
                    if newValue.isEmpty {
                        return
                    }
                    let value = Int(newValue) ?? 0
                    let min = min(value, 255)
                    text2 = "\(min)"
                    //          if newValue.count > 3 {
                    //            text3 = String(newValue.suffix(1))
                    //            triggersFocus3 = true
                    //          }
                })
                .frame(width: 50, height: 50)
                DidEndEditingTextField(tag: 2, placeholder: "N", limit: Constant.characterLimit, digitOnly: true, text: $text3, isFocus: $isTextFieldFocus3, triggersFocus: $triggersFocus3, onDeleteBackward: {
                    print("onDeleteBackward text3")
                    triggersFocus2 = true
                }, shouldMoveToNextFocusWhenReachedLimit: {
                    triggersFocus4 = true
                })
                .onChange(of: isTextFieldFocus3) { newValue in
                    print("isTextFieldFocus3 newValue \(newValue)")
                }
                .onChange(of: text3, perform: { newValue in
                    print("onChange text3 \(newValue)")
                    if newValue.isEmpty {
                        return
                    }
                    let value = Int(newValue) ?? 0
                    let min = min(value, 255)
                    text3 = "\(min)"
                    if newValue.count > 3 {
                        text4 = String(newValue.suffix(1))
                        triggersFocus4 = true
                    }
                })
                .frame(width: 50, height: 50)
                DidEndEditingTextField(tag: 3, placeholder: "N", limit: Constant.characterLimit, digitOnly: true, text: $text4, isFocus: $isTextFieldFocus4, triggersFocus: $triggersFocus4, onDeleteBackward: {
                    print("onDeleteBackward text4")
                    triggersFocus3 = true
                }, shouldMoveToNextFocusWhenReachedLimit: {
                    
                })
                .onSubmit {
                    print("onSubmit text1 \(text1) -- text2 \(text2) -- text3 \(text3) -- text4 \(text4)")
                }
                .onChange(of: isTextFieldFocus4) { newValue in
                    print("isTextFieldFocus4 newValue \(newValue)")
                }
                .onChange(of: text4, perform: { newValue in
                    print("onChange text4 \(newValue)")
                    if newValue.isEmpty {
                        return
                    }
                    let value = Int(newValue) ?? 0
                    let min = min(value, 255)
                    text4 = "\(min)"
                })
                .frame(width: 50, height: 50)
                
                
                //                DidEndEditingTextField(tag: 0, text: $text1, isHovering: $isHovering1, didEndEditing: { string in
                //                    print("didEndEditing String \(string)")
                //                })
                //                .onChange(of: text1, perform: { newValue in
                //                    print("newValue \(newValue)")
                //                })
                ////                .limitInputLength(value: $text1, length: 3)
                //                .frame(width: 40, height: 40)
                //                .overlay(content: {
                //                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                //                        .strokeBorder(Color.gray, lineWidth: 1)
                //                })
                //                .onHover(perform: { hovering in
                //                    print("hovering \(hovering)")
                //                    isHovering1 = hovering
                //                })
                //                .background(
                //                    RoundedRectangle(cornerRadius: 8)
                //                        .fill(isHovering1 ? .yellow : .white)
                //                )
                //                DidEndEditingTextField(tag: 1, text: $text2, isHovering: $isHovering2, didEndEditing: { string in
                //                    print("didEndEditing String \(string)")
                //                })
                ////                .limitInputLength(value: $text2, length: 3)
                //                .frame(width: 40, height: 40)
                //                .onHover(perform: { hovering in
                //                    print("hovering \(hovering)")
                //                    isHovering2 = hovering
                //                })
                //                .background(.green)
                //                DidEndEditingTextField(tag: 2, text: $text3, isHovering: $isHovering3, didEndEditing: { string in
                //                    print("didEndEditing String \(string)")
                //                })
                ////                .limitInputLength(value: $text3, length: 3)
                //                .frame(width: 40, height: 40)
                //                .onHover(perform: { hovering in
                //                    print("hovering \(hovering)")
                //                    isHovering3 = hovering
                //                })
                //                .background(.white)
                //                DidEndEditingTextField(tag: 3, text: $text4, isHovering: $isHovering4, didEndEditing: { string in
                //                    print("didEndEditing String \(string)")
                //                })
                ////                .limitInputLength(value: $text4, length: 3)
                //                .frame(width: 40, height: 40)
                //                .onHover(perform: { hovering in
                //                    print("hovering \(hovering)")
                //                    isHovering4 = hovering
                //                })
                //                .background(.green)
            }
            .padding()
            Button("Button") {
                print("onSubmit text1 \(text1) -- text2 \(text2) -- text3 \(text3) -- text4 \(text4)")
            }
        }
    }
}

class FocusAwareTextField: NSTextField {
    var onFocusChange: (Bool) -> Void = { _ in }
    
    override func becomeFirstResponder() -> Bool {
        let textView = window?.fieldEditor(true, for: nil) as? NSTextView
        textView?.insertionPointColor = NSColor.systemPink // R.nsColor.action
        onFocusChange(true)
        return super.becomeFirstResponder()
    }
}

struct DidEndEditingTextField: NSViewRepresentable {
    let tag: Int
    let placeholder: String
    var limit: Int = -1
    let digitOnly: Bool
    @Binding var text: String
    @Binding var isFocus: Bool
    @Binding var triggersFocus: Bool
    var onDeleteBackward: () -> Void
    var onReturnKey: () -> Void = {}
    var shouldMoveToNextFocusWhenReachedLimit: () -> Void
    
    @Environment(\.isEnabled) private var isEnabled

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeNSView(context: Context) -> NSTextField {
        let textField = FocusAwareTextField()
        textField.tag = tag
        textField.placeholderAttributedString = NSAttributedString(
            string: placeholder,
            attributes: [
                NSAttributedString.Key.foregroundColor: NSColor.gray,
            ]
        )
        textField.isBordered = false
        textField.delegate = context.coordinator
        textField.backgroundColor = NSColor.clear
        textField.textColor = NSColor.green // R.nsColor.text
        textField.font = NSFont(name: "Monaco", size: 20) // R.font.text
        textField.focusRingType = .none
        textField.onFocusChange = { isFocus in
            self.isFocus = isFocus
        }
        return textField
    }
    
    func updateNSView(_ nsView: NSTextField, context _: Context) {
        nsView.stringValue = text
        print("isFocus \(isFocus) --- nsview \(nsView.tag)")
        if triggersFocus {
            DispatchQueue.main.async {
                nsView.window?.makeFirstResponder(nsView)
                nsView.currentEditor()?.moveToEndOfDocument(nil)
                triggersFocus = false
            }
        }
        print("updateNSView === isEnabled \(isEnabled)")
    }
    
    class Coordinator: NSObject, NSTextFieldDelegate {
        let parent: DidEndEditingTextField
        
        init(_ textField: DidEndEditingTextField) {
            parent = textField
        }
        
        func controlTextDidEndEditing(_: Notification) {
            parent.isFocus = false
        }
        
        func controlTextDidChange(_ obj: Notification) {
            guard let textField = obj.object as? NSTextField else { return }
            print("controlTextDidChange textField.stringValue \(textField.stringValue)")
            var textFieldValue = textField.stringValue
            if parent.digitOnly {
                textFieldValue = textFieldValue.digits
            }
            if parent.limit > -1 {
                textField.stringValue = String(textFieldValue.prefix(parent.limit))
                print("controlTextDidChange prefix textField.stringValue \(textField.stringValue)")
            }
            parent.text = textField.stringValue
            if textField.stringValue.count >= parent.limit {
                parent.shouldMoveToNextFocusWhenReachedLimit()
            }
        }
        
        func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
            if (commandSelector == #selector(NSResponder.deleteBackward(_:))) {
                // Do something against BACKSPACE key
                print("BACKSPACE")
                if !parent.text.isEmpty {
                    return false
                }
                parent.onDeleteBackward()
                return true
            } else  if (commandSelector == #selector(NSResponder.insertNewline(_:))) {
                //Do something against ENTER key
                print("insertNewline")
                return true
            }
            return false
        }
    }
}

//struct DidEndEditingTextField: NSViewRepresentable {
//    var limit: Int = 1
//    var tag: Int = 0
//    @Binding var text: String
//    @Binding var isHovering: Bool
//    var didEndEditing: (String) -> Void
//    var onFocus: () -> Void = {
//        print("onFocus")
//    }
//    var onUnfocus: () -> Void = {
//        print("onUnfocus")
//    }
//
//    class Coordinator: NSObject, NSTextFieldDelegate {
//        var parent: DidEndEditingTextField
//
//        init(_ parent: DidEndEditingTextField) {
//            self.parent = parent
//        }
//
//        func controlTextDidChange(_ obj: Notification) {
//            if let textField = obj.object as? NSTextField {
//                if textField.stringValue.count <= parent.limit {
//                    parent.text = textField.stringValue
//                } else {
//                    let value = String(textField.stringValue.prefix(parent.limit))
//                    parent.text = value
//                    if let nextField = textField.superview?.superview?.viewWithTag(parent.tag + 1) as? NSTextField {
//                        nextField.becomeFirstResponder()
//                        nextField.stringValue = String(value.suffix(1))
//                    }
//                }
//            }
//        }
//
//        func controlTextDidEndEditing(_ obj: Notification) {
//            if let textField = obj.object as? NSTextField {
//                parent.didEndEditing(textField.stringValue)
//            }
//            print("controlTextDidEndEditing tag \(parent.tag)")
//        }
//
//        func controlTextDidBeginEditing(_ obj: Notification) {
//            print("controlTextDidBeginEditing tag \(parent.tag)")
//        }
//
//        func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
//            if (commandSelector == #selector(NSResponder.insertNewline(_:))) {
//                // Do something against ENTER key
//                print("enter")
//                return true
//            } else if (commandSelector == #selector(NSResponder.deleteForward(_:))) {
//                // Do something against DELETE key
//                return true
//            } else if (commandSelector == #selector(NSResponder.deleteBackward(_:))) {
//                // Do something against BACKSPACE key
//                print("BACKSPACE")
//                if !parent.text.isEmpty {
//                    return false
//                }
//                if let prevField = textView.superview?.superview?.superview?.superview?.viewWithTag(parent.tag - 1) as? NSTextField {
//                    prevField.becomeFirstResponder()
//               } else {
//                   return false
////                   textView.resignFirstResponder()
//               }
//                return true
//            } else if (commandSelector == #selector(NSResponder.insertTab(_:))) {
//                // Do something against TAB key
//                return false
//            } else if (commandSelector == #selector(NSResponder.cancelOperation(_:))) {
//                // Do something against ESCAPE key
//                return true
//            }
//            // return true if the action was handled; otherwise false
//            return false
//        }
//
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func makeNSView(context: Context) -> NSTextField {
//        let textField = FocusAwareTextField()
//        print("makeNSView tag \(tag)")
//        textField.tag = tag
//        let centeredParagraphStyle = NSMutableParagraphStyle()
//        centeredParagraphStyle.alignment = .center
//        let font = NSFont.systemFont(ofSize: 15)
//
//        let attributes: [NSAttributedString.Key: Any] = [
//            .foregroundColor: isHovering ? NSColor.red : NSColor.yellow,
//            .paragraphStyle: centeredParagraphStyle,
//            .font: font
//            ]
//
//        textField.placeholderAttributedString = NSAttributedString(string: "N", attributes: attributes)
//        textField.font = font
//        textField.textColor = NSColor.blue
//        textField.bezelStyle = .roundedBezel
//        textField.isBordered = false
//        textField.alignment = .center
//        textField.drawsBackground = true
//        textField.backgroundColor = NSColor.clear
//        textField.textColor = NSColor.black
//        textField.focusRingType = .none
//        let onlyIntFormatter = OnlyIntegerValueFormatter()
//        textField.formatter = onlyIntFormatter
//        textField.delegate = context.coordinator
//        return textField
//    }
//
//    func updateNSView(_ nsView: NSTextField, context: Context) {
//        let centeredParagraphStyle = NSMutableParagraphStyle()
//        centeredParagraphStyle.alignment = .center
//        let font = NSFont.systemFont(ofSize: 15)
//
//        let attributes: [NSAttributedString.Key: Any] = [
//            .foregroundColor: isHovering ? NSColor.red : NSColor.yellow,
//            .paragraphStyle: centeredParagraphStyle,
//            .font: font
//            ]
//        nsView.placeholderAttributedString = NSAttributedString(string: "N", attributes: attributes)
//        nsView.stringValue = text
//    }
//}
//
//class FocusAwareTextField: NSTextField {
//    var onFocusChange: (Bool) -> Void = { _ in }
//
//    override func becomeFirstResponder() -> Bool {
//        print("onFocus tag \(tag)")
//        let textView = window?.fieldEditor(true, for: nil) as? NSTextView
//        textView?.insertionPointColor = NSColor.black
//        onFocusChange(true)
//        return super.becomeFirstResponder()
//    }
//
//}
//
struct TextFieldLimitModifier: ViewModifier {
    @Binding var value: String
    var length: Int
    
    func body(content: Content) -> some View {
        if #available(iOS 14, *) {
            content
                .onChange(of: $value.wrappedValue) {
                    value = String($0.prefix(length))
                }
        } else {
            content
                .onReceive(Just(value)) {
                    value = String($0.prefix(length))
                }
        }
    }
}

extension View {
    func limitInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextFieldLimitModifier(value: value, length: length))
    }
}
//
//
//class OnlyIntegerValueFormatter: NumberFormatter {
//
//    override func isPartialStringValid(_ partialString: String, newEditingString newString: AutoreleasingUnsafeMutablePointer<NSString?>?, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
//
//        // Ability to reset your field (otherwise you can't delete the content)
//        // You can check if the field is empty later
//        if partialString.isEmpty {
//            return true
//        }
//
//        // Optional: limit input length
//        /*
//         if partialString.characters.count>3 {
//         return false
//         }
//         */
//
//        // Actual check
//        return Int(partialString) != nil
//    }
//
//}
extension String {
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}
