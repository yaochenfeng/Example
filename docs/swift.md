## 条件编译

```swift
        // 操作系统：macOS/iOS/tvOS/watchOS/Linux/Android/Windows/FreeBSD
        #if os(macOS) || os(iOS)
            print("操作系统")
        // CPU构架：i386\x86_64\arm\arm64
        #elseif arch(x86_64) || arch(arm64)
            print("CPU构架")
        // swift 版本
        #elseif swift(<5) && swift(>=3)
            print("swift 版本")
        // 模拟器
        #elseif targetEnvironment(simulator)
            print("模拟器")
        // 可以导入某模块
        #elseif canImport(Foundation)
            print("可以导入Foundation")
        #else
            print("else")
        #endif
```