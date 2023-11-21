//
//  ContentView.swift
//  TextFieldSwiftUI
//
//  Created by Admin on 20/11/2023.
//

import SwiftUI
import Combine

extension Color {
    static let defaultBackgroundColor: String = "#FDFDFD"
    static let hoverBackgroundColor: String = "#F5F5F6"
    
    static let defaultBorderColor: String = "#D4D7DB"
    static let hoverBorderColor: String = "#C9CDD6"
    static let selectBorderColor: String = "#3196FF"
    
    static let hintTextColor: String = "#C2C2C2"
    static let hoverTextColor: String = Color.hintTextColor
    static let dimTextColor: String = Color.hintTextColor
    
    static let normalTextColorSelecting: String = "#000000"
    static let normalTextColorNotSelecting: String = "#000000CC" // CC == 80%
}

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
        static let ipCharacterLimit = 3
        static let pinCodeCharacterLimit = 1
        
        static let ipPlaceholder: String = "000"
        static let pinCodePlaceholder: String = "N"
    }
    
    var body: some View {
        VStack {
//            HStack {
//                ESBNSTextField(tag: 0, placeholder: Constant.pinCodePlaceholder, limit: Constant.pinCodeCharacterLimit, digitOnly: true, text: $text1, isFocus: $isTextFieldFocus1, triggersFocus: $triggersFocus1, isHovering: $isHovering1, onDeleteBackward: {
//                    print("onDeleteBackward text1")
//                }, shouldMoveToNextFocusWhenReachedLimit: {
//                    triggersFocus2 = true
//                })
//                .applyPinCodeStyleModifier(isHover: $isHovering1, isFocusing: $isTextFieldFocus1.wrappedValue)
//                .limitInputLength(value: $text1, length: Constant.pinCodeCharacterLimit)
//
//                ESBNSTextField(tag: 1, placeholder: Constant.pinCodePlaceholder, limit: Constant.pinCodeCharacterLimit, digitOnly: true, text: $text2, isFocus: $isTextFieldFocus2, triggersFocus: $triggersFocus2, isHovering: $isHovering2, onDeleteBackward: {
//                    print("onDeleteBackward text1")
//                    triggersFocus1 = true
//                }, shouldMoveToNextFocusWhenReachedLimit: {
////                    triggersFocus2 = true
//                }, onReturnKey: {
//                    DispatchQueue.main.async {
//                        NSApp.keyWindow?.makeFirstResponder(nil)
//                    }
//                })
//                .applyPinCodeStyleModifier(isHover: $isHovering2, isFocusing: $isTextFieldFocus2.wrappedValue)
//                .limitInputLength(value: $text2, length: Constant.pinCodeCharacterLimit)
//            }
            
            HStack() {
                ESBNSTextField(tag: 0, placeholder: Constant.ipPlaceholder, limit: Constant.ipCharacterLimit, digitOnly: true, text: $text1, isFocus: $isTextFieldFocus1, triggersFocus: $triggersFocus1, isHovering: $isHovering1, onDeleteBackward: {
                    print("onDeleteBackward text1")
                }, shouldMoveToNextFocusWhenReachedLimit: {
                    triggersFocus2 = true
                })
                .limitIPInputLength(value: $text1, length: Constant.ipCharacterLimit)

                ESBNSTextField(tag: 1, placeholder: Constant.ipPlaceholder, limit: Constant.ipCharacterLimit, digitOnly: true, text: $text2, isFocus: $isTextFieldFocus2, triggersFocus: $triggersFocus2, isHovering: $isHovering2, onDeleteBackward: {
                    print("onDeleteBackward text2")
                    triggersFocus1 = true
                }, shouldMoveToNextFocusWhenReachedLimit: {
                    triggersFocus3 = true
                }, onReturnKey: {
                    
                })
                .limitIPInputLength(value: $text2, length: Constant.ipCharacterLimit)
                
                ESBNSTextField(tag: 2, placeholder: Constant.ipPlaceholder, limit: Constant.ipCharacterLimit, digitOnly: true, text: $text3, isFocus: $isTextFieldFocus3, triggersFocus: $triggersFocus3, isHovering: $isHovering3, onDeleteBackward: {
                    print("onDeleteBackward text3")
                    triggersFocus2 = true
                }, shouldMoveToNextFocusWhenReachedLimit: {
                    triggersFocus4 = true
                }, onReturnKey: {
                   
                })
                .limitIPInputLength(value: $text3, length: Constant.ipCharacterLimit)
                
                ESBNSTextField(tag: 3, placeholder: Constant.ipPlaceholder, limit: Constant.ipCharacterLimit, digitOnly: true, text: $text4, isFocus: $isTextFieldFocus4, triggersFocus: $triggersFocus4, isHovering: $isHovering4, onDeleteBackward: {
                    print("onDeleteBackward text4")
                    triggersFocus3 = true
                }, shouldMoveToNextFocusWhenReachedLimit: {}, onReturnKey: {
                    DispatchQueue.main.async {
                        NSApp.keyWindow?.makeFirstResponder(nil)
                    }
                })
                .limitIPInputLength(value: $text4, length: Constant.ipCharacterLimit)
            }
            .applyIPStyleModifier(isFocusing: (isTextFieldFocus1 || isTextFieldFocus2 || isTextFieldFocus3 || isTextFieldFocus4))

            Button("Button") {
                print("onSubmit text1 \(text1) -- text2 \(text2) -- text3 \(text3) -- text4 \(text4)")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .onTapGesture {
            print("onTapGesture")
            DispatchQueue.main.async {
                NSApp.keyWindow?.makeFirstResponder(nil)
            }
        }
    }
    
}

private class FocusAwareTextField: NSTextField {
    var onFocusChange: (Bool) -> Void = { _ in }
    
    override func becomeFirstResponder() -> Bool {
        let textView = window?.fieldEditor(true, for: nil) as? NSTextView
        textView?.insertionPointColor = NSColor.black
        onFocusChange(true)
        return super.becomeFirstResponder()
    }
}

struct ESBNSTextField: NSViewRepresentable {
    let tag: Int
    let placeholder: String
    var limit: Int = -1
    let digitOnly: Bool
    
    let placeholderFont: NSFont = NSFont.systemFont(ofSize: 15)
    let textFieldFont: NSFont = NSFont.systemFont(ofSize: 15)
    
    let placeholderTextColor: NSColor = NSColor(hex: Color.hintTextColor)
    
    let normalTextColorNotSelecting: NSColor = NSColor(hex: Color.normalTextColorNotSelecting)
    let hoverTextColor: NSColor = NSColor(hex: Color.hoverTextColor)
    let normalTextColorSelecting: NSColor = NSColor(hex: Color.normalTextColorSelecting)
    let dimTextColor: NSColor = NSColor(hex: Color.dimTextColor)
    
    var textAlignment: NSTextAlignment = .center
    @Binding var text: String
    @Binding var isFocus: Bool
    @Binding var triggersFocus: Bool
    @Binding var isHovering: Bool
    var onDeleteBackward: () -> Void = {}
    var shouldMoveToNextFocusWhenReachedLimit: () -> Void = {}
    var onReturnKey: () -> Void = {}

    @Environment(\.isEnabled) private var isEnabled

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeNSView(context: Context) -> NSTextField {
        let textField = FocusAwareTextField()
        textField.tag = tag
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = textAlignment
        textField.placeholderAttributedString = NSAttributedString(
            string: placeholder,
            attributes: [
                NSAttributedString.Key.foregroundColor: placeholderTextColor,
                NSAttributedString.Key.paragraphStyle: centeredParagraphStyle,
                NSAttributedString.Key.font: placeholderFont
            ]
        )
        textField.textColor = normalTextColorNotSelecting
        textField.font = textFieldFont
        textField.alignment = textAlignment
        textField.isBordered = false
        textField.delegate = context.coordinator
        textField.backgroundColor = NSColor.clear
        textField.focusRingType = .none
        textField.onFocusChange = { isFocus in
            self.isFocus = isFocus
        }
        return textField
    }
    
    private func getTextColor() -> NSColor {
        if isEnabled {
            if isFocus {
                return normalTextColorSelecting
            }
            if isHovering {
                return hoverTextColor
            }
            return normalTextColorNotSelecting
        }
        return dimTextColor
    }
    
    func updateNSView(_ nsView: NSTextField, context _: Context) {
        nsView.stringValue = text
        nsView.textColor = getTextColor()
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
        let parent: ESBNSTextField
        
        init(_ textField: ESBNSTextField) {
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
                print("ENTER")
                parent.onReturnKey()
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

struct TextFieldIPLimitModifier: ViewModifier {
    @Binding var value: String
    var length: Int

    private func getValidIPValue(_ text: String) -> Int {
        return min(Int(text) ?? 0, 255)
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 14, *) {
            content
                .onChange(of: $value.wrappedValue) {
                    if value.isEmpty {
                        return
                    }
                    value = "\(getValidIPValue(String($0.prefix(length))))"
                }
        } else {
            content
                .onReceive(Just(value)) {
                    if value.isEmpty {
                        return
                    }
                    value = "\(getValidIPValue(String($0.prefix(length))))"
                }
        }
    }
}

extension View {
    func limitInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextFieldLimitModifier(value: value, length: length))
    }
    
//    func limitIPInputLength(value: Binding<String>, length: Int) -> some View {
//        self.modifier(TextFieldLimitModifier(value: value, length: length))
//    }
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
extension NSColor {
    
    convenience init(hex: String) {
        let trimHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let dropHash = String(trimHex.dropFirst()).trimmingCharacters(in: .whitespacesAndNewlines)
        let hexString = trimHex.starts(with: "#") ? dropHash : trimHex
        let ui64 = UInt64(hexString, radix: 16)
        let value = ui64 != nil ? Int(ui64!) : 0
        // #RRGGBB
        var components = (
            R: CGFloat((value >> 16) & 0xff) / 255,
            G: CGFloat((value >> 08) & 0xff) / 255,
            B: CGFloat((value >> 00) & 0xff) / 255,
            a: CGFloat(1)
        )
        if String(hexString).count == 8 {
            // #RRGGBBAA
            components = (
                R: CGFloat((value >> 24) & 0xff) / 255,
                G: CGFloat((value >> 16) & 0xff) / 255,
                B: CGFloat((value >> 08) & 0xff) / 255,
                a: CGFloat((value >> 00) & 0xff) / 255
            )
        }
        self.init(red: components.R, green: components.G, blue: components.B, alpha: components.a)
    }
}
//
//func toHex(alpha: Bool = false) -> String? {
//    guard let components = cgColor.components, components.count >= 3 else {
//        return nil
//    }
//    
//    let r = Float(components[0])
//    let g = Float(components[1])
//    let b = Float(components[2])
//    var a = Float(1.0)
//    
//    if components.count >= 4 {
//        a = Float(components[3])
//    }
//    
//    if alpha {
//        return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
//    } else {
//        return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
//    }
//}
//}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        // swiftlint:disable:next identifier_name
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension View {
    func applyPinCodeStyleModifier(isHover: Binding<Bool>, isFocusing: Bool) -> some View {
        modifier(PinCodeStyleModifier(isHover: isHover, isFocusing: isFocusing))
    }
    
    func applyIPStyleModifier(isFocusing: Bool) -> some View {
        modifier(IPTextFieldStyleModifier(isFocusing: isFocusing))
    }
}

struct PinCodeStyleModifier: ViewModifier {
    @Binding var isHover: Bool
    let isFocusing: Bool
    @Environment(\.isEnabled) private var isEnabled

    func body(content: Content) -> some View {
        content
            .frame(width: 40, height: 40)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(getBackgroundColor())
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(getBorderColor())
            )
            .onHover(perform: { hovering in
                self.isHover = hovering
            })
    }
    
    func getBackgroundColor() -> Color {
        if isEnabled {
            if isHover && !isFocusing {
                return Color(hex: Color.hoverBackgroundColor)
            }
        }
        return Color(hex: Color.defaultBackgroundColor)
    }
    
    func getBorderColor() -> Color {
        if isEnabled {
            if isFocusing {
                return Color(hex: Color.selectBorderColor)
            } else if isHover {
                return Color(hex: Color.hoverBorderColor)
            }
        }
        return Color(hex: Color.defaultBorderColor)
    }
}

struct IPTextFieldStyleModifier: ViewModifier {
    @State private var isHover: Bool = false
    let isFocusing: Bool
    @Environment(\.isEnabled) private var isEnabled

    func body(content: Content) -> some View {
        content
            .frame(width: 226, height: 32)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(getBackgroundColor())
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(getBorderColor())
            )
            .onHover(perform: { hovering in
                self.isHover = hovering
            })
    }
    
    func getBackgroundColor() -> Color {
        if isEnabled {
            if isHover && !isFocusing {
                return Color(hex: Color.hoverBackgroundColor)
            }
        }
        return Color(hex: Color.defaultBackgroundColor)
    }
    
    func getBorderColor() -> Color {
        if isEnabled {
            if isFocusing {
                return Color(hex: Color.selectBorderColor)
            } else if isHover {
                return Color(hex: Color.hoverBorderColor)
            }
        }
        return Color(hex: Color.defaultBorderColor)
    }
}


//struct TextFieldLimitModifier: ViewModifier {
//    @Binding var value: String
//    let length: Int
//    
//    func body(content: Content) -> some View {
//        if #available(iOS 14, *) {
//            content
//                .onChange(of: $value.wrappedValue) {
//                    value = String($0.prefix(length))
//                }
//        } else {
//            content
//                .onReceive(Just(value)) {
//                    value = String($0.prefix(length))
//                }
//        }
//    }
//}

extension View {
    func limitPinCodeInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextFieldLimitModifier(value: value, length: length))
    }
    
    func limitIPInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextFieldIPLimitModifier(value: value, length: length))
    }
}
