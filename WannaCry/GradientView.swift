//
//  GradientView.swift
//  WannaCry
//
//  Created by Apollo Zhu on 5/15/17.
//
//

import Cocoa

class GradientView: NSView {

    override func makeBackingLayer() -> CALayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [NSColor.red.cgColor, NSColor.green.cgColor]
        return gradientLayer
    }

    func setBackgroundColor(_ color: NSColor) {
        let gradientLayer = layer as? CAGradientLayer
        gradientLayer?.colors = [CGColor](repeatElement(color.cgColor, count: gradientLayer?.locations?.count ?? 2))
    }

}
