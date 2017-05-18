//
//  ViewController.swift
//  WannaCry
//
//  Created by 阿卡琳 on 14/05/2017.
//
//

import Cocoa

class ViewController: NSViewController {

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        let timer = segue.destinationController as? TimerViewController
        timer?.config = segue.identifier == "priceRaise" ? .priceRaise : .fileDelete
    }

    // MARK: Message Displaying

    @IBOutlet var textView: NSTextView!

    var language = Language.english {
        didSet {
            textView.readRTFD(fromFile: language.rtfPath)
        }
    }

    // TODO: Either automatically determines the scale, or use a fixed value
    @IBInspectable var scale = 1.2 {
        didSet {
            textView.scaleUnitSquare(to: NSSize(width: scale, height: scale))
        }
    }

    override func awakeFromNib() {
        view.layer?.backgroundColor = CGColor(red: 0.56, green: 0, blue: 0, alpha: 1)
        scale = 1.2
        language = .english
    }

    // MARK: Copy Bitcoin Address

    @IBOutlet weak var bitcoinTextFieldCell: NSTextFieldCell!
    @IBAction func copy(_ sender: Any) {
        let pasteboard = NSPasteboard.general()
        pasteboard.clearContents()
        pasteboard.setString(bitcoinTextFieldCell.title, forType: NSPasteboardTypeString)
    }
    
}
