//
//  DateManager.swift
//  WannaCry
//
//  Created by Apollo Zhu on 5/16/17.
//
//

import Foundation

let kDataManagerStartDate = "kDataManagerStartDate"

class DateManager {

    public static let shared = DateManager()
    private init() { }

    public func reset() {
        UserDefaults.standard.removeObject(forKey: kDataManagerStartDate)
        UserDefaults.standard.synchronize()
    }

    public var startDate: Date {
        var interval = UserDefaults.standard.double(forKey: kDataManagerStartDate)
        if interval == 0 {
            interval = Date().timeIntervalSince1970
            UserDefaults.standard.set(interval, forKey: kDataManagerStartDate)
            UserDefaults.standard.synchronize()
        }
        return Date(timeIntervalSince1970: interval)
    }

    public var priceRaiseDate: Date! {
        return Calendar.current.date(byAdding: DateComponents(day: 3), to: startDate)
    }

    public var fileDeleteDate: Date! {
        return Calendar.current.date(byAdding: DateComponents(day: 7), to: startDate)
    }

    private lazy var intervalFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()

    public func string(from interval: TimeInterval) -> String {
        return intervalFormatter
            .string(from: interval > 0 ? interval : 0)!
            .replacingOccurrences(of: "d ", with: ":")
            .components(separatedBy: ":")
            .map({ String(format: "%02d", Int($0)!) })
            .joined(separator: ":")
    }

    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d/yyyy HH:mm:ss"
        return formatter
    }()

    public func string(from date: Date) -> String {
        return dateFormatter.string(from: date)
    }

}
