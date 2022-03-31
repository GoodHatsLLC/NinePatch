#if canImport(UIKit)

import Foundation
import SwiftUI
import UIKit

public struct NinePatchConfig {
    public init(
        patchImage: UIImage,
        cornerRadius: CGFloat = 0,
        capInsets: EdgeInsets,
        contentPadding: EdgeInsets
    ) {
        self.patchImage = patchImage
        self.cornerRadius = cornerRadius
        self.capInsets = capInsets
        self.contentPadding = contentPadding
    }
    let patchImage: UIImage
    let cornerRadius: CGFloat
    let capInsets: EdgeInsets
    let contentPadding: EdgeInsets
}

public struct NinePatch<Content: View>: View {

    private let content: () -> Content
    private let config: NinePatchConfig
    private let fillStyle: FillStyle
    private let shapeStyle: AnyShapeStyle

    public init(
        config: NinePatchConfig,
        shapeStyle: AnyShapeStyle = .init(.clear),
        fillStyle: FillStyle = FillStyle(),
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self.config = config
        self.shapeStyle = shapeStyle
        self.fillStyle = fillStyle
    }

    public init<S>(
        config: NinePatchConfig,
        shapeStyle: S,
        fillStyle: FillStyle = FillStyle(),
        @ViewBuilder content: @escaping () -> Content
    ) where S: ShapeStyle {
        self.init(
            config: config,
            shapeStyle: AnyShapeStyle(shapeStyle),
            fillStyle: fillStyle,
            content: content
        )
    }

    public var body: some View {
        ZStack {
            Rectangle()
                .fill(shapeStyle, style: fillStyle)
                .cornerRadius(config.cornerRadius)
                .padding(config.contentPadding)

            Image(
                uiImage: config.patchImage
            ).resizable(
                capInsets: config.capInsets,
                resizingMode: .stretch
            )
            content()
                .padding(config.contentPadding)
        }
    }

    public func fill<S>(
        _ content: S,
        style: FillStyle = FillStyle()) -> some View
    where S : ShapeStyle {
        NinePatch(config: self.config,
                  shapeStyle: content,
                  fillStyle: fillStyle,
                  content: self.content)
    }
}
#endif
