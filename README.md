# SwiftBar

CLI Progress Bar for Swift.
## Fonts
It is strongly recommended to install [Nerd Fonts](https://www.nerdfonts.com)
It may not work with regular fonts.
## Term Type
Dumb terminal is not supported

## Installation
```swift
import PackageDescription

let package = Package(
        name: "Your Package",
        dependencies: [
            .package(url: "https://github.com/skunkrocker/SwiftBar.git", from: "1.0.1")
        ]
)
```

## Usage
Usage for Tasks of unknown duration, call the infinite (aeon) function block: 

```swift
aeon(.led2, tarDwonloadMsg, tarDownloadCompleteMsg) { start, complete in
            
    runAsync(wget,"-P", "/tmp" ,  "https://some-url.com/some-file").onCompletion { command in
        complete()
        deleteWgetLog()
        stopWaitingFn()
    }
    start()
}
```

Use one of the AeonType's to define the look and feel of the progress animation.
```swift
enum AeonType {
    case led
    case led2
    case moon
    case signal
}
```



https://user-images.githubusercontent.com/6974023/210327475-678ff57c-5ed1-4220-a5e0-8a5fac0e34b0.mov

## Suggestions
You may suggest new features.
Please do so in a Pull Request.
