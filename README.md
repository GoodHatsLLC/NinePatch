# NinePatch

A SwiftUI interface for using [`resizableImage(withCapInsets:)`](https://developer.apple.com/documentation/uikit/uiimage/1624102-resizableimage/) / [9-Patch](https://developer.android.com/studio/write/draw9patch) images as view backgrounds.

![Example use screenshot](https://github.com/GoodHatsLLC/NinePatch/blob/main/preview.png?raw=true)

## Usage

1. Install via SPM. `https://github.com/GoodHatsLLC/NinePatch`.
2. Design a background image for tiling similar to [9-Patch](https://developer.android.com/studio/write/draw9patch)) and note the dimensions.
3. Create a `NinePatchConfig`.
4. Create your SwiftUI view with `NinePatch(config:)`.
5. Optionally, give it a fill color like: `.fill(.red)`.


```swift
struct NinePatchConfigs {
  static let roundedRect = NinePatchConfig(
    // Your tiling UIImage
    patchImage: #imageLiteral(resourceName: "rounded_rect_shadow"),
    // The radius of the content's corners.
    // Allows coloring only the contents if using a partially transparent rounded rect.
    cornerRadius: 15,
    // The dimentions of the corner and side segments of your image.
    capInsets: .init(
        top: 19,
        leading: 15,
        bottom: 19,
        trailing: 15
    ),
    // The padding required to align the content area with the border images.
    contentPadding: .init(
        top: 4,
        leading: 8,
        bottom: 12,
        trailing: 8
    )
)
```

```swift
import NinePatch
import SwiftUI

struct ContentView: View {
    var body: some View {
        NinePatch(config: NinePatchConfigs.roundedRect)
            .fill(.red)
    }
}
```
