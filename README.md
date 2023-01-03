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
### Unknown duration

Usage for Tasks of unknown duration, call the infinite (aeon) function block: 

```swift
print("Signal Type".bold)
let signalMsg = "🔥 Long Job".bold + " .signal ".blue + " type".bold
let signalCompleteMsg = "Long Job".bold + " .signal ".blue + "type done".bold
waitForAsync { stopWaiting in
    aeon(.signal, signalMsg, signalCompleteMsg) { start, complete in
       let wget = SwiftShell.run("which", "wget").stdout
        runAsync(wget,"-P", "/tmp" , "http://ipv4.download.thinkbroadband.com/20MB.zip").onCompletion { command in
            complete()
            stopWaiting()
        }
        start()
   }
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

### Known duration

To show the progress bar for Tasks with known duration
```swift
print("Pac Bar".bold)
print()
        
var index = 0
        
let pacMan = barz(total: files.count)
files.forEach { file in
   let  headerMessage = "Copying file ".blue.bold + TRAFIC_LIGHT + " " + file.green.bold
            
    pacMan.update(index + 1, headerMessage)
         
    //Do the Job here
    
    index += 1
}
pacMan.complete()
```


https://user-images.githubusercontent.com/6974023/210350009-5cee71c7-b8ab-4ba4-a811-509a740b6b12.mov


## Suggestions
You may suggest new features.
Please do so in a Pull Request.
