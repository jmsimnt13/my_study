struct Circle {
    var coordinates: (x: Int, y: Int)
    var radius: Float
    var perimetr: Float {
        get {
            return 2.0 * 3.14 * radius
        }
        set {
            radius = newValue / (2.0 * 3.14)
        }
    }
}

var myNewCircle = Circle(coordinates: (0,0), radius: 10)
print(myNewCircle.perimetr)
myNewCircle.perimetr = 100
print(myNewCircle.radius)

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0: return .zero
        case let x where x > 0:
            return .positive
        default :
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, -5, 2, -10, 0, 4, -1])


extension Array {
	func safeElement(_ index: Index) -> Element? {
		guard index < count else { return nil }
		
		return self[index]
	}
}


struct Application {
	static func main() throws {
		let a = ["Ivan", "Petr", "Danila"]
		let elem = a.safeElement(4)
		print(elem ?? "Not found")
	}
}
