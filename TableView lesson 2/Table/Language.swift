import UIKit

struct Language {
    let name: String
    let year: String
    let color: UIColor
}

extension Language {
    
    static func make() -> [Language] {
        [
            Language(
                name: "Assembler",
                year: "1947",
                color: .systemGray
            ),
            Language(
                name: "C",
                year: "1973",
                color: .systemYellow
            ),
            Language(
                name: "C++",
                year: "1985",
                color: .systemGreen
            ),
            Language(
                name: "Java",
                year: "1996",
                color: .systemRed
            ),
            Language(
                name: "Kotlin",
                year: "2011",
                color: .systemBlue
            ),
            Language(
                name: "PHP",
                year: "1994",
                color: .systemPurple
            ),
            Language(
                name: "Javascript",
                year: "1995",
                color: .systemIndigo
            ),
            Language(
                name: "Objective-C",
                year: "1981",
                color: .systemPink
            ),
            Language(
                name: "Go",
                year: "2009",
                color: .systemTeal
            ),
            Language(
                name: "Rust",
                year: "2010",
                color: .systemOrange
            ),
            Language(
                name: "Ruby",
                year: "1995",
                color: .systemGray
            ),
            Language(
                name: "Scala",
                year: "2004",
                color: .systemYellow
            ),
            Language(
                name: "Pascal",
                year: "1970",
                color: .systemGreen
            ),
            Language(
                name: "Swift",
                year: "2014",
                color: .systemRed
            ),
            Language(
                name: "Python",
                year: "1991",
                color: .systemBlue
            ),
            Language(
                name: "C#",
                year: "2001",
                color: .systemPurple
            ),
            Language(
                name: "Bash",
                year: "1989",
                color: .systemIndigo
            ),
            Language(
                name: "Typescript",
                year: "2012",
                color: .systemPink
            ),
            Language(
                name: "Smalltalk",
                year: "1980",
                color: .systemTeal
            ),
            Language(
                name: "Dart",
                year: "2011",
                color: .systemOrange
            ),
        ]
    }
}
