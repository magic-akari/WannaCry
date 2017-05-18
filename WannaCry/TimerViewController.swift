//
//  TimerViewController.swift
//  WannaCry
//
//  Created by Apollo Zhu on 5/16/17.
//
//

import Cocoa

struct TimerViewControllerConfig {

    fileprivate let title: String
    fileprivate let dueDate: () -> Date

    public static let priceRaise = TimerViewControllerConfig(title: "Payment will be raised on", dueDate: { DateManager.shared.priceRaiseDate })

    public static let fileDelete = TimerViewControllerConfig(title: "Your files will be lost on", dueDate: { DateManager.shared.fileDeleteDate })

}

class TimerViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }

    public var config: TimerViewControllerConfig? { didSet { update() } }

    @IBOutlet private weak var titleCell: NSTextFieldCell!
    @IBOutlet private weak var endDateCell: NSTextFieldCell!
    @IBOutlet private weak var timeLeftCell: NSTextFieldCell!
    @IBOutlet private weak var gradientView: GradientView!

    private var timer = Timer()

    private func update() {
        guard  let config = config, let titleCell = titleCell else { return }

        titleCell.title = config.title
        let dueDate = config.dueDate()
        endDateCell.title = DateManager.shared.string(from: dueDate)

        timer.invalidate()
        var interval = dueDate.timeIntervalSinceNow
        timeLeftCell.title = DateManager.shared.string(from: interval)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            interval -= 1
            guard interval >= 0 else {
                self?.gradientView.setBackgroundColor(#colorLiteral(red: 0.96, green: 0.94, blue: 0.95, alpha: 1))
                return timer.invalidate()
            }
            self?.timeLeftCell.title = DateManager.shared.string(from: interval)
        }
    }

}
