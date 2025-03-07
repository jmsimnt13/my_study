let result = "failure"
let result2 = "fail"
// путанница....

enum Result {
    case success
    case failure
}

var result4 = Result.failure
result4 = .success
let result5: Result

result5 = .success


enum Activity {
    case dancing
    case running(destination: String)
    case singing(volume: Int)
    case talking(topic: String)
}

let currentActivity = Activity.dancing

switch currentActivity {
case .dancing : print("Dance")
case .running(destination: let destination): print("In \(destination)")
case .singing(volume: let volume): print("At \(volume)")
case .talking(topic: let topic): print("About \(topic)")
}

print(currentActivity)

let talking = Activity.talking(topic: "Football")

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet.earth
print(earth.rawValue)

enum Phone: String {
    case Apple = "iPhone 14 Pro"
    case Samsung = "Galaxy s25 Ultra"
    case Google = "Pixel 9 Pro"
}

var myPhone = Phone.Apple
print(myPhone)
print(myPhone.rawValue)
