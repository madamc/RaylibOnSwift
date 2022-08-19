//
//  File.swift
//  
//
//  Created by Adam Mitchell on 6/22/22.
//

import Foundation
import ExtraHeaders
import _RaylibC

public struct Raygui {
    
    public static func guiEnable() {
        GuiEnable()
    }

    public static func guiDisable() {
        GuiDisable()
    }

    public static func guiLock() {
        GuiLock()
    }

    public static func guiUnlock() {
        GuiUnlock()
    }

    public static func guiIsLocked() -> Bool {
        return GuiIsLocked()
    }

    public static func guiFade(_ alpha: Float) {
        GuiFade(alpha)
    }

    public static func guiSetState(_ state: Int32) {
        GuiSetState(state)
    }

    public static func guiGetState() -> Int32 {
        return GuiGetState()
    }

    public static func guiSetFont(_ font: Font) {
        GuiSetFont(font)
    }

    public static func guiGetFont() -> Font {
        return GuiGetFont()
    }

    public static func guiSetStyle(_ control: Int32, _ property: Int32, _ value: Int32) {
        GuiSetStyle(control, property, value)
    }

    public static func guiGetStyle(_ control: Int32, _ property: Int32) -> Int32 {
        return GuiGetStyle(control, property)
    }
    
    public static func guiWindowBox(_ bounds: Rectangle, _ title: UnsafePointer<CChar>) -> Bool {
        return GuiWindowBox(bounds, title)
    }

    public static func guiGroupBox(_ bounds: Rectangle, _ text: UnsafePointer<CChar>) {
        GuiGroupBox(bounds, text)
    }

    public static func guiLine(_ bounds: Rectangle, _ text: UnsafePointer<CChar>) {
        GuiLine(bounds, text)
    }

    public static func guiPanel(_ bounds: Rectangle) {
        GuiPanel(bounds)
    }

    public static func guiScrollPanel(_ bounds: Rectangle, _ content: Rectangle, _ scroll: UnsafeMutablePointer<Vector2>) -> Rectangle {
        return GuiScrollPanel(bounds, content, scroll)
    }

    public static func guiLabel(_ bounds: Rectangle, _ text: UnsafePointer<CChar>) {
        GuiLabel(bounds, text)
    }

    public static func guiButton(_ bounds: Rectangle, _ text: UnsafePointer<CChar>) -> Bool {
        return GuiButton(bounds, text)
    }

    public static func guiLabelButton(_ bounds: Rectangle, _ text: UnsafePointer<CChar>) -> Bool {
        return GuiLabelButton(bounds, text)
    }

    public static func guiToggle(_ bounds: Rectangle, _ text: UnsafePointer<CChar>, _ active: Bool) -> Bool {
        return GuiToggle(bounds, text, active)
    }

    public static func guiToggleGroup(_ bounds: Rectangle, _ text: UnsafePointer<CChar>, _ active: Int32) -> Int32 {
        return GuiToggleGroup(bounds, text, active)
    }

    public static func guiCheckBox(_ bounds: Rectangle, _ text: UnsafePointer<CChar>, _ checked: Bool) -> Bool {
        return GuiCheckBox(bounds, text, checked)
    }

    public static func guiComboBox(_ bounds: Rectangle, _ text: UnsafePointer<CChar>, _ active: Int32) -> Int32 {
        return GuiComboBox(bounds, text, active)
    }

    public static func guiDropdownBox(_ bounds: Rectangle, _ text: UnsafePointer<CChar>, _ active: UnsafeMutablePointer<Int32>, _ editMode: Bool) -> Bool {
        return GuiDropdownBox(bounds, text, active, editMode)
    }

    public static func guiSpinner(_ bounds: Rectangle, _ text: UnsafePointer<CChar>, _ value: UnsafeMutablePointer<Int32>, _ minValue: Int32, _ maxValue: Int32, _ editMode: Bool) -> Bool {
        return GuiSpinner(bounds, text, value, minValue, maxValue, editMode)
    }

    public static func guiValueBox(_ bounds: Rectangle, _ text: UnsafePointer<CChar>, _ value: UnsafeMutablePointer<Int32>, _ minValue: Int32, _ maxValue: Int32, _ editMode: Bool) -> Bool {
        return GuiValueBox(bounds, text, value, minValue, maxValue, editMode)
    }

    public static var guiTextBoxChar: CChar = 0
    public static func guiTextBox(_ bounds: Rectangle, _ text: inout String, _ textSize: Int32, _ editMode: Bool) -> Bool {
        guiTextBoxChar = text.cString(using: .utf8)!.first!
        var returnValue = GuiTextBox(bounds, &guiTextBoxChar, textSize, editMode)
        if let textOpt = String( validatingUTF8: &guiTextBoxChar) {
//            text = textOpt
        }
        return returnValue
    }

    public static var guiTextBoxMultiChar: CChar = 0
    public static func guiTextBoxMulti(_ bounds: Rectangle, _ text: inout String, _ textSize: Int32, _ editMode: Bool) -> Bool {
//        var cCharText = UnsafeMutablePointer<CChar>(mutating: (text as NSString).utf8String!)
//        return GuiTextBoxMulti(bounds, cCharText, textSize, editMode)
        guiTextBoxMultiChar = (text as NSString).utf8String!.pointee//text.cString(using: .utf8)!.first!
        withUnsafePointer(to: guiTextBoxMultiChar) {ptr in
            print("Jagoola")
            print(ptr)
        }
        var returnValue = GuiTextBoxMulti(bounds, &guiTextBoxMultiChar, textSize, editMode)
        if let textOpt = String( validatingUTF8: &guiTextBoxMultiChar) {
//            text = textOpt
        }
        return returnValue
    }

    public static func guiSlider(_ bounds: Rectangle, _ textLeft: UnsafePointer<CChar>, _ textRight: UnsafePointer<CChar>, _ value: Float, _ minValue: Float, _ maxValue: Float) -> Float {
        return GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue)
    }

    public static func guiSliderBar(_ bounds: Rectangle, _ textLeft: UnsafePointer<CChar>, _ textRight: UnsafePointer<CChar>, _ value: Float, _ minValue: Float, _ maxValue: Float) -> Float {
        return GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue)
    }

    public static func guiProgressBar(_ bounds: Rectangle, _ textLeft: UnsafePointer<CChar>, _ textRight: UnsafePointer<CChar>, _ value: Float, _ minValue: Float, _ maxValue: Float) -> Float {
        return GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue)
    }

    public static func guiStatusBar(_ bounds: Rectangle, _ text: UnsafePointer<CChar>) {
        GuiStatusBar(bounds, text)
    }

    public static func guiDummyRec(_ bounds: Rectangle, _ text: UnsafePointer<CChar>) {
        GuiDummyRec(bounds, text)
    }

    public static func guiScrollBar(_ bounds: Rectangle, _ value: Int32, _ minValue: Int32, _ maxValue: Int32) -> Int32 {
        return GuiScrollBar(bounds, value, minValue, maxValue)
    }

    public static func guiGrid(_ bounds: Rectangle, _ spacing: Float, _ subdivs: Int32) -> Vector2 {
        return GuiGrid(bounds, spacing, subdivs)
    }

    public static func guiListView(_ bounds: Rectangle, _ text: UnsafePointer<CChar>, _ scrollIndex: UnsafeMutablePointer<Int32>, _ active: Int32) -> Int32 {
        return GuiListView(bounds, text, scrollIndex, active)
    }

    public static func guiListViewEx(_ bounds: Rectangle, _ textList: [String], _ count: Int32, _ focus: UnsafeMutablePointer<Int32>, _ scrollIndex: UnsafeMutablePointer<Int32>, _ active: Int32) -> Int32 {
        var cCharPointerArray: [UnsafePointer<CChar>?] = []
        for str in textList {
            cCharPointerArray.append((str as NSString).utf8String)
        }
 
        return GuiListViewEx(bounds, &cCharPointerArray, count, focus, scrollIndex, active)
    }

    public static func guiMessageBox(_ bounds: Rectangle, _ title: UnsafePointer<CChar>, _ message: UnsafePointer<CChar>, _ buttons: UnsafePointer<CChar>) -> Int32 {
        return GuiMessageBox(bounds, title, message, buttons)
    }

    public static func guiTextInputBox(_ bounds: Rectangle, _ title: UnsafePointer<CChar>, _ message: UnsafePointer<CChar>, _ buttons: UnsafePointer<CChar>, _ text: String) -> Int32 {
        var cCharText = UnsafeMutablePointer<CChar>(mutating: (text as NSString).utf8String!)
        return GuiTextInputBox(bounds, title, message, buttons, cCharText)
    }

    public static func guiColorPicker(_ bounds: Rectangle, _ color: Color) -> Color {
        return GuiColorPicker(bounds, color)
    }

    public static func guiColorPanel(_ bounds: Rectangle, _ color: Color) -> Color {
        return GuiColorPanel(bounds, color)
    }

    public static func guiColorBarAlpha(_ bounds: Rectangle, _ alpha: Float) -> Float {
        return GuiColorBarAlpha(bounds, alpha)
    }

    public static func guiColorBarHue(_ bounds: Rectangle, _ value: Float) -> Float {
        return GuiColorBarHue(bounds, value)
    }

    public static func guiLoadStyle(_ fileName: UnsafePointer<CChar>) {
        GuiLoadStyle(fileName)
    }

    public static func guiLoadStyleDefault() {
        GuiLoadStyleDefault()
    }

    public static func guiIconText(_ iconId: Int32, _ text: UnsafePointer<CChar>) -> UnsafePointer<CChar> {
//        var cCharText = UnsafeMutablePointer<CChar>(mutating: (text as NSString).utf8String!)f
        return GuiIconText(iconId, text)
    }

    public static func guiDrawIcon(_ iconId: Int32, _ posX: Int32, _ posY: Int32, _ pixelSize: Int32, _ color: Color) {
        GuiDrawIcon(iconId, posX, posY, pixelSize, color)
    }

    public static func guiGetIcons() {
        GuiGetIcons()
    }

    public static func guiGetIconData(_ iconId: Int32) -> UnsafeMutablePointer<UInt32> {
        return GuiGetIconData(iconId)
    }

    public static func guiSetIconData(_ iconId: Int32, _ data: UnsafeMutablePointer<UInt32>) {
        GuiSetIconData(iconId, data)
    }

    public static func guiSetIconPixel(_ iconId: Int32, _ x: Int32, _ y: Int32) {
        GuiSetIconPixel(iconId, x, y)
    }

    public static func guiClearIconPixel(_ iconId: Int32, _ x: Int32, _ y: Int32) {
        GuiClearIconPixel(iconId, x, y)
    }

    public static func guiCheckIconPixel(_ iconId: Int32, _ x: Int32, _ y: Int32) -> Bool {
        return GuiCheckIconPixel(iconId, x, y)
    }
    
}
