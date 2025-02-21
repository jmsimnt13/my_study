import Cocoa

var str = "Hello, playground"

// Conditions_lvl_1
print("Введите ваш возраст: ", terminator: "")
if let input = readLine(), let age = Int(input), age >= 18
{
    print("\(age)")
}

