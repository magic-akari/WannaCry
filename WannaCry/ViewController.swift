//
//  ViewController.swift
//  WannaCry
//
//  Created by 阿卡琳 on 14/05/2017.
//  Copyright © 2017 阿卡琳. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    @IBOutlet weak var webView: WKWebView!

    let html = "<h2>What Happened to My Computer?</h2><p>Your important files are encrypted. </p><p>Many of your documents, photos, videos, databases and other files are no longer accessible because they have been encrypted. Maybe you are busy looking for a way to recover your files, but do not waste your time. Nobody can recover your files without our decryption service.</p><h2>Can I Recover My Files?</h2><p>Sure. We guarantee that you can recover all your files safely and easily. But you have not so enough time. </p><p>You can decrypt some of your files for free. Try now by clicking . </p><p>But if you want to decrypt all your files, you need to pay. </p><p>You only have 3 days to submit the payment. After that the price will be doubled. </p><p>Also, if you don’t pay in 7 days, you won’t be able to recover your files forever.</p><p>We will have free events for users who are so poor that they couldn’t pay in 6 months. </p><h2>How Do I Pay?</h2><p>Payment is accepted in Bitcoin only. For more information, click . </p><p>Please check the current price of Bitcoin and buy some bitcoins. For more information, click . </p><p>And send the correct amount to the address specified in this window.</p><p>After your payment, click . Best time to check: 9:00am – 11:00am GMT from Monday to Friday. </p><p>Once the payment is checked, you can start decrypting your files immediately.</p><h2>Contact</h2><p>If you need our assistance, send a message by clicking contact Us.</p><p>We strongly recommend you to not remove this software, and disable your anti-virus for a while, until you pay and the payment gets processed. If your anti-virus gets updated and removes this software automatically, it will not be able to recover your files even if you pay!</p>"




    override func viewDidLoad() {
        super.viewDidLoad()



        webView.loadHTMLString(html, baseURL: nil)

    }

    override func awakeFromNib() {
        if self.view.layer != nil {
            let color = CGColor.init(red: CGFloat(0.56), green: 0, blue: 0, alpha: 1)
            self.view.layer?.backgroundColor = color
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}
