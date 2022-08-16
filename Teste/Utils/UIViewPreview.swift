//
//  UIViewPreview.swift
//  Teste
//
//  Created by user217584 on 16/08/22.
//

import UIKit


#if canImport(SwiftUI) && DEBUG

import SwiftUI

struct UIViewPreview<View: UIView>: UIViewRepresentable {

    let view: View

    init(_ builder: @escaping () -> View) {

        view = builder()

    }

    func makeUIView(context: Context) -> View {

        view

    }

    func updateUIView(_ uiView: View, context: Context) {

        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)

    }

}

#endif
