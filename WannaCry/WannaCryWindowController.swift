//
//  WannaCryWindowController.swift
//  WannaCry
//
//  Created by 阿卡琳 on 14/05/2017.
//  Copyright © 2017 阿卡琳. All rights reserved.
//

import Cocoa

class WannaCryWindowController: NSWindowController {

    @IBOutlet weak var languagesPopUp: NSPopUpButtonCell!

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.titleVisibility = .hidden
        window?.level = Int(CGWindowLevelForKey(.floatingWindow))
        for language in Language.all {
            languagesPopUp.menu?.addItem(withTitle: language.localizedName, action: #selector(updateLanguage), keyEquivalent: "")
        }
        languagesPopUp.selectItem(withTitle: Language.english.localizedName)
    }

    func updateLanguage() {
        let controller = contentViewController as? ViewController
        controller?.language = Language.all[languagesPopUp.indexOfSelectedItem]
    }
    
}
