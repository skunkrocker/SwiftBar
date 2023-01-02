
import Foundation
import TSCBasic

extension FileHandle {
    
    func write(string: String) {
        write(string.data(using: .utf8)!)
    }
    
    public func clearLine() {
        write(string:"\r")
    }
}

extension String {
    static func *(char: String, count: Int) -> String {
        var s = ""
        for _ in 0..<count {
            s.append(char)
        }
        return s
    }
}

extension Int {
    func to_d() -> Double {
        Double(self)
    }
}

extension Double {
    func to_i() -> Int {
        Int(self)
    }
}