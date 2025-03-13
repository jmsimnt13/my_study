struct Weapon {
    var type: String = "Sword"
    var range: Int = 1
}

class Person {
    let id = Int.random(in: 1...100)
    var name = "Danila"
    var personClass = "anykey"
    var hp = 89
    var mp = 20
    
    func greating() {
        print("hello my name is \(name), I'm \(personClass)")
    }
}

let person1 = Person()
person1.greating()
var weapon = Weapon()
person1.personClass = "iOS Developer"
person1.hp = 98
person1.greating()

class Animal {
    var name: String
    var type: String
    var numberOfLegs: Int
    
    init(nameOfAnimal: String, typeOfAnimal: String, numberOfLegsOfAnimal: Int) {
        name = nameOfAnimal
        type = typeOfAnimal
        numberOfLegs = numberOfLegsOfAnimal
    }
}

let human = Animal(nameOfAnimal: "Danila", typeOfAnimal: "Human", numberOfLegsOfAnimal: 2)
human.name

var axe = Weapon()
var sword = Weapon()
var copy = axe
axe.type = "axe"
copy.type = "copy"


sword.type
axe.type
copy.type

let tiger = Animal(nameOfAnimal: "Ruletik", typeOfAnimal: "cats", numberOfLegsOfAnimal: 4)
let dove = tiger
dove.type = "dove"

tiger.type
dove.type

// === !==

if tiger === dove {
    print("Две переменные ссылаются на один экземпляр класса Animal")
}

struct A: Equatable {
    static func == (lhs: A, rhs: A) -> Bool {
        return lhs.a == rhs.a
    }
    
    var a: Int
}

let one = A(a: 1)
let two = A(a: 2)
one == two
