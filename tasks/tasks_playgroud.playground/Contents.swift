struct Person {
	let name: String
	let age: Int
}

func sort(persons: [Person], compare: (Person, Person) -> Bool) -> [Person] {
	var persons = persons
	for i in 0..<persons.count - 1 {
		for j in (i + 1)..<persons.count {
			if compare(persons[i], persons[j]) {
				let tmp = persons[i]
				persons[i] = persons[j]
				persons[j] = tmp
			}
		}
	}
	return persons
}


let persons: [Person] = [
	Person(name: "Ирина", age: 51),
	Person(name: "Владимир", age: 32),
	Person(name: "Данила", age: 25),
	Person(name: "Александра", age: 22)
]

let personsToOlder = sort(persons: persons, compare: { $0.age > $1.age })
let personToYonger = sort(persons: persons, compare: { $0.age < $1.age })
let personsByName = sort(persons: persons, compare: { $0.name > $1.name })

print(personsToOlder)
print(personToYonger)
print(personsByName)

let closure: () -> Void = { print("Hello") }
closure()




struct Point {
	var x: Int
	var y: Int
	
	mutating func moveBy(dx: Int, dy: Int) {
		x += dx
		y += dy
	}
}

var point = Point(x: 10, y: 20)
point.moveBy(dx: 4, dy: -2)
print(point)

enum Light {
	case on
	case off
	
	mutating func toggle() {
		switch self {
		case .on : self = .off
		case .off : self = .on
		}
	}
}

var light = Light.on
light.toggle()
print(light)


var greeting = "Hello!"

protocol EngineerDelegate: AnyObject {
	func taskHasEnded()
	func didFinishResearch(data: String)
	func didFinishAnalyzeRequirements(results: [String])
}

class Engineer {
	var tasks: Int = 0 {
		didSet {
			if tasks == 0 {
				delegate?.taskHasEnded()
			}
		}
	}
	
	func taskDone(_ numberOfTasks: Int = 1) {
		tasks -= numberOfTasks
	}
	
	func startResearch(_ data: String = "") {
		// google
		// create doc
		// review doc
		delegate?.didFinishResearch(data: "document")
	}
	
	func analyze(requirements: [String]) {
		// read
		// questions
		// document
		delegate?.didFinishAnalyzeRequirements(results: ["q1", "q2"])
	}
	
	weak var delegate: EngineerDelegate?
}

class ProjectManager {
	var engineer: Engineer?
	
	func addTasksToEngineer(_ numberOfTasks: Int = 1) {
		engineer?.tasks += numberOfTasks
	}
}

extension ProjectManager: EngineerDelegate {
	
	func didFinishResearch(data: String) {
		addTasksToEngineer(2)
	}
	
	func didFinishAnalyzeRequirements(results: [String]) {
		print("Client: Clearify requirements.")
	}
	
	func taskHasEnded() {
		print("Client: Give me tasks.")
	}
}

class Client {
	var engineer: Engineer?
}

extension Client: EngineerDelegate {
	func taskHasEnded() {
		// think about requirements
		// think about tasks
		print("Add task to engineer")
		engineer?.tasks += 1
	}
	
	func didFinishResearch(data: String) {
		engineer?.tasks += 2
	}
	
	func didFinishAnalyzeRequirements(results: [String]) {
		print("Answers")
	}
	
	
}

var engineer = Engineer()
var manager = ProjectManager()
engineer.delegate = manager
manager.engineer = engineer
manager.addTasksToEngineer()

engineer.tasks
engineer.taskDone()

engineer.analyze(requirements: [])

engineer.tasks
engineer.startResearch()
engineer.tasks

engineer.taskDone(2)

engineer.tasks

// Project Manager
manager.engineer = nil
engineer.delegate = nil

var client = Client()
client.engineer = engineer
engineer.delegate = client

engineer.tasks += 1
engineer.taskDone()
engineer.tasks

// 1. protocol - AnyObject
// 2. obj1: property weak var delegate: ProtocolDelegate?
// 3. obj2: :ProtocolDelegate
// 4.

class ViewController {
	var payView: [PayView]
	
	// view did load
	// init
	
	init(payView: [PayView]) {
		self.payView = payView
		payView.forEach { $0.delegate = self }
	}
}

extension ViewController: PayViewDelegate {
	func didPressPayButton(_ view: PayView) {
		// show pay screen
		print("Pay button tapped for price \(view.price)")
	}
}

protocol PayViewDelegate: AnyObject {
	func didPressPayButton(_ view: PayView) // UIView
}

class PayView {
	var price: Double = 0.0
	weak var delegate: PayViewDelegate?
	
	func payButtonTapped() {
		// add animation
		delegate?.didPressPayButton(self)
	}
}

var monitor = PayView()
monitor.price = 500
var headset = PayView()
headset.price = 200
var mouse = PayView()
mouse.price = 50

var screen = ViewController(payView: [monitor, headset, mouse])

monitor.payButtonTapped()
mouse.payButtonTapped()
headset.payButtonTapped()

// Примерная реализация MVC подхода

import UIKit

// Model
struct User {
	let id: Int
	let name: String
	var email: String?
}

// View
class UserView: UIView {
	let nameLabel = UILabel()
	let emailLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupUI() {
		addSubview(nameLabel)
		addSubview(emailLabel)
		
		nameLabel.frame = CGRect(x: 20, y: 20, width: 200, height: 30)
		emailLabel.frame = GCRect(x: 20, y: 60, width: 200, height: 30)
	}
}

// Controller

class UserController: UIViewContoller {
	var user: User?
	let userView = UserView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		view.addSubview(userView)
		updateView()
	}
	
	private func updateView() {
		guard let user = user else { return }
		userView.nameLabel.text = "Name: \(user.name)"
		userView.emailLabel.text = "Email: \(user.email)" ?? "No email"
	}
}

// Use

let user = User(id: 1, name: "Danila", email: "example@gmail.com")
let controller = UserController()
controller.user = user

// Start of app
window?.rootViewController = controller
window?.makeKeyAndVisible()
