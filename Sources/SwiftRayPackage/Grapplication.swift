//
//  File.swift
//  
//
//  Created by Adam Mitchell on 8/1/22.
//

import Foundation
import Raylib
import PhysacSwiftBindings

public struct Grapplication {

    static let screenWidth: Int32 = 1280
    static let screenHeight: Int32 = 720
    static var dropdownBox000Active: Int32 = 0
    static var dropDown000EditMode = false

    static var dropdownBox001Active: Int32 = 0
    static var dropDown001EditMode = false

    static var spinner001Value: Int32 = 0
    static var spinner001Text: CChar = 0
    static var spinnerEditMode = false

    static var valueBox002Text: CChar = 0
    static var valueBox002Value: Int32 = 0
    static var valueBoxEditMode = false

//    char textBoxText[64] = "Text box"
    static var textBoxText = "abilam"
    static var textBoxEditMode = false

    static var listViewScrollIndex: Int32 = 0
    static var listViewActive: Int32 = -1

    static var listViewExScrollIndex: Int32 = 0
    static var listViewExActive: Int32 = 2
    static var listViewExFocus: Int32 = -1
//    let exList: [String] = [ "This", "is", "a", "list view", "with", "disable", "elements", "amazing!" ]
//    withUnsafePointer(to: &exList) {
//
//    }
//    let exList: Array<String> = [ "This", "is", "a", "list view", "with", "disable", "elements", "amazing!" ]
//    let listViewExList: UnsafeMutablePointer<[String]> =
//    const char *listViewExList[8] = { "This", "is", "a", "list view", "with", "disable", "elements", "amazing!" };

//    char multiTextBoxText[256] = "Multi text box";
    static var multiTextBoxText = "Multi text box"
    static var listViewExList = [ "This", "is", "a", "list view", "with", "disable", "elements", "amazing!" ]
    static var multiTextBoxEditMode = false
    static var colorPickerValue = Color(r: 230, g: 41, b: 55, a: 255)
//    Color colorPickerValue = RED;

    static var sliderValue = 50
    static var sliderBarValue = 60
    static var progressValue: Float = 0.4

    static var forceSquaredChecked = false

    static var alphaValue: Float = 0.5

    static var comboBoxActive: Int32 = 1

    static var toggleGroupActive: Int32 = 0

    static var viewScroll = Vector2(x: 0,y: 0)
//    Vector2 viewScroll = { 0, 0 };
    
    static var exitWindow = false
    static var showMessageBox = false

    static var textInput = ""
//    char textInput[256] = { 0 };
    static var showTextInputBox = false

    static var textInputFileName = ""
//    char textInputFileName[256] = { 0 };
    
    public static func launchGrapp() {
        
        var exList: [String] = [ "This", "is", "a", "list view", "with", "disable", "elements", "amazing!" ]

    //    let exList: Array<String> = [ "This", "is", "a", "list view", "with", "disable", "elements", "amazing!" ]
//        let listViewExList: UnsafeMutablePointer<[String]> =

        Raylib.initWindow(screenWidth, screenHeight, "raygui - controls test suite")
        Raylib.setExitKey(.escape)
        Raylib.setTargetFPS(60)

        while (!exitWindow) {

            exitWindow = Raylib.windowShouldClose

            if (Raylib.isKeyDown(.escape)) {
                showMessageBox = !showMessageBox
            }

            if (Raylib.isKeyDown(.leftControl) && Raylib.isKeyDown(.letterS)) {

                showTextInputBox = true

            }
            if (Raylib.isFileDropped)
            {
                Raylib.clearDroppedFiles()
//                var droppedFiles: FilePathList = Raylib.loadDroppedFiles()
//
//                if ((droppedFiles.count > 0) && Raylib.isFileExtension(droppedFiles.paths[0], ".rgs"))
//                {
//                    Raygui.guiLoadStyle(droppedFiles.paths[0])
//
//                }
//
//                Raylib.unloadDroppedFiles(droppedFiles);    // Clear internal buffers
            }

            Raylib.beginDrawing()

            Raylib.clearBackground(Raylib.getColor(UInt32(abs((Raygui.guiGetStyle(Int32(DEFAULT.rawValue), Int32(BACKGROUND_COLOR.rawValue)))))))

                // raygui: controls drawing
                //----------------------------------------------------------------------------------
                if (dropDown000EditMode || dropDown001EditMode) {
                    Raygui.guiLock()
                }
                else if (!dropDown000EditMode && !dropDown001EditMode) {
                    Raygui.guiUnlock()
                }
                //GuiDisable();

                // First GUI column
                //GuiSetStyle(CHECKBOX, TEXT_ALIGNMENT, TEXT_ALIGN_LEFT);
            forceSquaredChecked = Raygui.guiCheckBox(Rectangle(x:  25, y: 108, width: 15, height: 15 ), "FORCE CHECK!", forceSquaredChecked)

            Raygui.guiSetStyle(Int32(TEXTBOX.rawValue), Int32(TEXT_ALIGNMENT.rawValue), Int32(GUI_TEXT_ALIGN_CENTER.rawValue))
                //GuiSetStyle(VALUEBOX, TEXT_ALIGNMENT, TEXT_ALIGN_LEFT);
            if (Raygui.guiSpinner(Rectangle(x: 25, y: 135, width: 125, height: 30 ), &spinner001Text, &spinner001Value, 0, 100, spinnerEditMode))
                {
                    spinnerEditMode = !spinnerEditMode
                }
            if (Raygui.guiValueBox(Rectangle(x: 25, y: 175, width: 125, height: 30), &valueBox002Text, &valueBox002Value, 0, 100, valueBoxEditMode)) {
                    valueBoxEditMode = !valueBoxEditMode
                }

            Raygui.guiSetStyle(Int32(TEXTBOX.rawValue), Int32(TEXT_ALIGNMENT.rawValue), Int32(GUI_TEXT_ALIGN_LEFT.rawValue))

            if (Raygui.guiTextBox(Rectangle(x: 25, y: 215, width: 125, height: 30 ), &textBoxText, 64, textBoxEditMode)) {
                    textBoxEditMode = !textBoxEditMode
                }

            Raygui.guiSetStyle(Int32(BUTTON.rawValue), Int32(TEXT_ALIGNMENT.rawValue), Int32(GUI_TEXT_ALIGN_CENTER.rawValue))

            if (Raygui.guiButton(Rectangle(x: 25, y: 255, width: 125, height: 30 ), Raygui.guiIconText(6, "Save File"))) { //6 is the value for ICON_FILE_SAVE, but it's not defined in this version of raygui
                    showTextInputBox = true
                }

            Raygui.guiGroupBox(Rectangle(x: 25, y: 310, width: 125, height: 150 ), "STATES")

                                   //GuiLock();
            Raygui.guiSetState(Int32(GUI_STATE_NORMAL.rawValue)); if (Raygui.guiButton(Rectangle(x: 30, y: 320, width: 115, height: 30 ), "NORMAL")) { }
            Raygui.guiSetState(Int32(GUI_STATE_FOCUSED.rawValue)); if (Raygui.guiButton(Rectangle(x: 30, y: 355, width: 115, height: 30 ), "FOCUSED")) { }
            Raygui.guiSetState(Int32(GUI_STATE_PRESSED.rawValue)); if (Raygui.guiButton(Rectangle(x: 30, y: 390, width: 115, height: 30 ), "#15#PRESSED")) { }
            Raygui.guiSetState(Int32(GUI_STATE_DISABLED.rawValue)); if (Raygui.guiButton(Rectangle(x: 30, y: 425, width: 115, height: 30 ), "DISABLED")) { }
            Raygui.guiSetState(Int32(GUI_STATE_NORMAL.rawValue))
               //GuiUnlock();

            comboBoxActive = Raygui.guiComboBox(Rectangle(x: 25, y: 470, width: 125, height: 30 ), "ONE;TWO;THREE;FOUR", comboBoxActive)

               // NOTE: GuiDropdownBox must draw after any other control that can be covered on unfolding
            Raygui.guiSetStyle(Int32(DROPDOWNBOX.rawValue), Int32(TEXT_ALIGNMENT.rawValue), Int32(GUI_TEXT_ALIGN_LEFT.rawValue))
            if (Raygui.guiDropdownBox(Rectangle(x: 25, y: 65, width: 125, height: 30), "#01#ONE;#02#TWO;#03#THREE;#04#FOUR", &dropdownBox001Active, dropDown001EditMode)) {
                    dropDown001EditMode = !dropDown001EditMode
               }
               Raygui.guiSetStyle(Int32(DROPDOWNBOX.rawValue), Int32(TEXT_ALIGNMENT.rawValue), Int32(GUI_TEXT_ALIGN_CENTER.rawValue))
            if (Raygui.guiDropdownBox(Rectangle(x: 25, y: 25, width: 125, height: 30 ), "ONE;TWO;THREE", &dropdownBox000Active, dropDown000EditMode)) {
                    dropDown000EditMode = !dropDown000EditMode

                }

               // Second GUI column
            listViewActive = Raygui.guiListView(Rectangle(x: 165, y: 25, width: 140, height: 140 ), "Charmander;Bulbasaur;#18#Squirtel;Pikachu;Eevee;Pidgey", &listViewScrollIndex, listViewActive)
            listViewExActive = Raygui.guiListViewEx(Rectangle(x: 165, y: 180, width: 140, height: 200), listViewExList, 8, &listViewExFocus, &listViewExScrollIndex, listViewExActive)

            toggleGroupActive = Raygui.guiToggleGroup(Rectangle(x: 165, y: 400, width:  140, height: 25 ), "#1#ONE\n#3#TWO\n#8#THREE\n#23#", Int32(toggleGroupActive))


                                   // Third GUI column
            if (Raygui.guiTextBoxMulti(Rectangle(x: 320, y: 25, width: 225, height: 140 ), &multiTextBoxText, 256, multiTextBoxEditMode)) {
                    multiTextBoxEditMode = !multiTextBoxEditMode
                }
            colorPickerValue = Raygui.guiColorPicker(Rectangle(x: 320, y: 185, width: 196, height: 192 ), colorPickerValue)

            sliderValue = Int(Raygui.guiSlider(Rectangle(x: 355, y: 400, width: 165, height: 20 ), "TEST", String(format: "%2.2f", Float(sliderValue)), Float(sliderValue), -50.0, 100.0))
            sliderBarValue = Int(Raygui.guiSliderBar(Rectangle(x: 320, y: 430, width: 200, height: 20 ), "", String(format: "%i", Float(sliderBarValue)), Float(sliderBarValue), 0.0, 100.0))
            progressValue = Float(Raygui.guiProgressBar(Rectangle(x: 320, y: 460, width: 200, height: 20 ), "", "", progressValue, 0, 1))

               // NOTE: View rectangle could be used to perform some scissor test
            var view: Rectangle = Raygui.guiScrollPanel(Rectangle (x: 560, y: 25, width: 100, height: 160 ), Rectangle(x: 560, y: 25, width: 200, height: 400 ), &viewScroll)

            Raygui.guiPanel(Rectangle(x: 560, y: 25 + 180, width: 100, height: 160 ))

            Raygui.guiGrid(Rectangle(x: 560, y: 25 + 180 + 180, width: 100, height: 120 ), 20, 2)

            Raygui.guiStatusBar(Rectangle(x: 0, y: Float(Raylib.getScreenHeight() - 20), width: Float(Raylib.getScreenWidth()), height: 20), "This is a status bar")

            alphaValue = Raygui.guiColorBarAlpha(Rectangle(x: 320, y: 490, width: 200, height: 30 ), alphaValue)


               if (showMessageBox)
               {
                   Raylib.drawRectangle(0, 0, Raylib.getScreenWidth(), Raylib.getScreenHeight(), Raylib.fade(.init(r: 1, g: 1, b: 1, a: 1), Float(0.8)));
                   let result = Raygui.guiMessageBox(Rectangle(x: Float(Raylib.getScreenWidth()/2 - 125), y: Float(Raylib.getScreenHeight()/2 - 50), width: 250, height: 100 ), Raygui.guiIconText(159, "Close Window"), "Do you really want to exit?", "Yes;No") // 159 is the value for ICON_EXIT for what this example is doing.

                if ((result == 0) || (result == 2)) {showMessageBox = false}
                else if (result == 1) {exitWindow = true}
               }

               if (showTextInputBox)
               {
                Raylib.drawRectangle(0, 0, Raylib.getScreenWidth(), Raylib.getScreenHeight(), Raylib.fade(.init(r: 1, g: 1, b: 1, a: 1), Float(0.8)))
                   let result = Raygui.guiTextInputBox(Rectangle(x: Float(Raylib.getScreenWidth()/2 - 120), y: Float(Raylib.getScreenHeight()/2 - 60), width: 240, height: 140 ), "Save", Raygui.guiIconText(6, "Save file as..."), "Ok;Cancel", textInput) // 6 is the value of ICON_FILE_SAVE in the version of raygui this example was build for

                   if (result == 1)
                   {
                       // TODO: Validate textInput value and save

                       strcpy(UnsafeMutablePointer<CChar>(mutating:(textInputFileName as NSString).utf8String), UnsafeMutablePointer<CChar>(mutating:(textInput as NSString).utf8String))
                   }

                   if ((result == 0) || (result == 1) || (result == 2))
                   {
                       showTextInputBox = false;
                       strcpy(UnsafeMutablePointer<CChar>(mutating:(textInput as NSString).utf8String), "\0"); //there's bad memory access here
                   }
                }

           Raylib.endDrawing()
        }

       Raylib.closeWindow()

       
    }
}
