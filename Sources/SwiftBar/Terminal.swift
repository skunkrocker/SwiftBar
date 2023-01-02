import TSCBasic
import Foundation

public func localTerminal() -> (get: () -> TerminalController, width: () -> Int) {
    let std_out = stdoutStream as WritableByteStream
    let terminal = TerminalController(stream: std_out)
    let termWidth = TerminalController.self.terminalWidth()!.to_d() * 0.9

    let width = (termWidth / 1.2).to_i()

    return (
            get: { terminal! },
            width: { width }
    )
}

public let terminal = localTerminal()

public struct VintageInfo {
    let lineHead: String
    let lineTails: String
    let lineIcon: String
    var isPath = false


    public init(lineHead: String, lineTails: String, lineIcon: String, isPath: Bool) {
        self.lineHead = lineHead
        self.lineTails = lineTails
        self.lineIcon = lineIcon
        self.isPath = isPath
    }

     public init(lineHead: String, lineTails: String, lineIcon: String) {
        self.init(lineHead: lineHead,lineTails: lineTails, lineIcon: lineIcon, isPath: false)
    }
}

extension TerminalController {

    public func vintagePrint(_ info: VintageInfo) {
        let message = self.vintageMessage(info)
        terminal.get().write(message + "\n")
    }

    public func vintagePrint(_ infos: [VintageInfo]) {
        for info in infos {
            vintagePrint(info)
        }
    }

    public func vintagePrint(_ infos: [VintageInfo], header: String) {
        let width = terminal.width()
        let boldHeader = header.uppercased().bold
        let widthWithoutHeader = (width - boldHeader.utf8.count) / 2
        let beforeHeader = " " * widthWithoutHeader

        terminal.get().write(beforeHeader + boldHeader + "\n")
        for info in infos {
            let message = self.vintageMessage(info)
            terminal.get().write(message + "\n")
        }
    }

    public func vintageMessage(_ info: VintageInfo) -> String {
        let width = terminal.width()

        let lineHeadBold = info.lineHead.uppercased().bold
        let tails = info.isPath ? info.lineTails : info.lineTails.capitalized
        let lineTailsBold = " " + tails.bold
        let lineHeadBoldCount = lineHeadBold.utf8.count
        let lineTailBoldCount = lineTailsBold.utf8.count

        let paddingCount = width - lineTailBoldCount - lineHeadBoldCount + 2

        let message = info.lineIcon +
                lineHeadBold +
                " ".padding(toLength: paddingCount, withPad: "•", startingAt: 0) +
                lineTailsBold
        return message
    }
}
