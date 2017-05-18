//
//  Language.swift
//  WannaCry
//
//  Created by Apollo Zhu on 5/16/17.
//
//

import Foundation

struct Language: Equatable {

    public let name: String

    init(named name: String) {
        self.name = name
    }

    private init?(fileName: String) {
        name = fileName.replacingOccurrences(of: "m_", with: "").replacingOccurrences(of: ".wnry", with: "")
    }

    public var localizedName: String {
        switch name {
        case "chinese (simplified)":
            return "简体中文"
        case "japanese":
            return "日本語"
        default:
            return name.capitalized
        }
    }

    public var rtfPath: String! {
        return Bundle.main.path(forResource: "m_\(name)", ofType: "wnry")
    }

    public static let english = Language(named: "english")

    public static let all: [Language] = {
        guard let res = Bundle.main.resourcePath,
            let files = try? FileManager.default.contentsOfDirectory(atPath: res).filter({$0.hasSuffix("wnry")})
            else { return [] }
        return files.flatMap { Language(fileName: $0) }
    }()

    public static func ==(lhs: Language, rhs: Language) -> Bool {
        return lhs.name == rhs.name
    }
    
}

