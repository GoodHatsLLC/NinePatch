import NinePatch
import SwiftUI
import UIKit

struct ContentView: View {

    var body: some View {
        NinePatch(config: .hard) {
            VStack(alignment: .center) {
                HStack {
                    Text("SwiftUI 9-Patch Borders:")
                        .font(
                            .largeTitle.monospaced()
                        )
                    Spacer()
                }
                Spacer()
                NinePatch(config: .rounded) {
                    Text("My shadows...")
                        .font(.largeTitle)
                        .padding(8)
                }
                .fill(.cyan.opacity(0.3))
                .fixedSize()
                .padding(8)

                NinePatch(config: .rounded) {
                    Text("...are made of nightmares...")
                        .font(.largeTitle)
                        .padding(8)
                }
                .fill(.yellow.opacity(0.4))
                .fixedSize()
                .aspectRatio(1, contentMode: .fit)
                .padding(8)

                NinePatch(config: .rounded) {
                    Text("...and images.")
                        .font(.largeTitle)
                        .padding(8)
                }
                .fill(.pink.opacity(0.4))
                .fixedSize()
                .aspectRatio(1, contentMode: .fit)
                .padding(8)

                Spacer()
            }
            .padding(16)
        }
        .fill(.regularMaterial)
        .aspectRatio(1, contentMode: .fit)
        .padding(48)
    }
}

extension NinePatchConfig {
    static var rounded: NinePatchConfig {
        .init(
            patchImage: #imageLiteral(resourceName: "rounded_rect_shadow"),
            cornerRadius: 14,
            capInsets: .init(
                top: 26,
                leading: 23,
                bottom: 27,
                trailing: 23
            ),
            contentPadding: .init(
                top: 3,
                leading: 8,
                bottom: 12,
                trailing: 8
            )
        )
    }

    static var hard: NinePatchConfig {
        .init(
            patchImage: #imageLiteral(resourceName: "rect_shadow"),
            cornerRadius: 0,
            capInsets: .init(
                top: 19,
                leading: 15,
                bottom: 19,
                trailing: 15
            ),
            contentPadding: .init(
                top: 4,
                leading: 8,
                bottom: 12,
                trailing: 8
            )
        )
    }
}
