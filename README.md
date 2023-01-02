# SwiftBar

CLI Progress Bar in Swift.

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
