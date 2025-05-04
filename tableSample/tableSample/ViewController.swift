//
//  ViewController.swift
//  tableSample
//
//  Created by Данила on 29.04.2025.
// Сделай экран с таблицей c рандомными цветами ячеек (допустим, высота ячейки 150).
// То есть, первая ячейка зеленая, вторая красная и так далее, чтобы общее количество было 20 шт
// * По нажатию на ячейку должен быть переход с помощью UINavigationController
// на экран с цветом аналогичным цвету ячейки на которую нажали.
// ** Вверху экрана сделай кнопку с текстом «random». По нажатию - таблица обновляется с новыми рандомными цветами для ячеек

import UIKit

enum MyColors: String, CaseIterable { // с большой
	case green = "Green",
		 productRed = "Product Red",
		 yellow = "Yellow",
		 purple = "Purple",
		 deepPurple = "Deep Purple",
		 violet = "Violet",
		 gray = "Gray",
		 spaceGray = "Space Gray",
		 roseGold = "Rose Gold",
		 gold = "Gold",
		 brat = "Brat Green",
		 lime = "Lime",
		 cyan = "Cyan",
		 magenta = "Magenta",
		 brown = "Brown",
		 orange = "Orange",
		 blue = "Blue",
		 red = "Red" // с маленькой буквы и каждый с новой строки
	
	var color: UIColor {
		switch self {
		case .green:
			return .appGreen
		case .productRed:
			return .appRed
		case .yellow:
			return .appYellow
		case .purple:
			return .appPurple
		case .deepPurple:
			return .appDeepPurple
		case .violet:
			return .appViolet
		case .gray:
			return .gray
		case .spaceGray:
			return .appSpaceGray
		case .roseGold:
			return .appRoseGold
		case .gold:
			return .appGold
		case .brat:
			return .appBrat
		case .lime:
			return .appLime
		case .cyan:
			return .cyan
		case .magenta:
			return .magenta
		case .brown:
			return .brown
		case .orange:
			return .orange
		case .blue:
			return .blue
		case .red:
			return .red
		}
	}
}

//let colSamp = myColors.DeepPurple
//colSamp.rawValue

struct ColorItem: Identifiable {
	let id = UUID().uuidString
	let typeOfColor: MyColors
	let nameOfColor: String
	
	static func mockData() -> [ColorItem] {
		let allColors = MyColors.allCases.shuffled().map {element in
			return ColorItem(typeOfColor: element, nameOfColor: element.rawValue)}//
		
//		var mockData: [colorItem] = []
//		for _ in 0..<20 {
//			if let randColor = allColors.randomElement() {
//				let newItemOfMockData = colorItem(typeOfColor: randColor, nameOfColor: randColor.rawValue)
//				mockData.append(newItemOfMockData)
//			}
//		}
		return allColors
	}
}

class ViewController: UIViewController {
	
	// *
	// Создание таблицы
	// Массив для таблицы
	var colors: [ColorItem] = ColorItem.mockData()
	
	// Сама таблица
	lazy var tableView: UITableView = {
		// 3 регистрация переиспользуемой ячейки
		$0.register(UITableViewCell.self, forCellReuseIdentifier: "mainCell")
		$0.dataSource = self
		$0.delegate = self
		return $0
	}(UITableView(frame: view.frame, style: .insetGrouped))

	// **
	// Создание кнопки генерации новой таблицы с цветами
	private lazy var addBtn: UIButton = {
		$0.frame.size = CGSize(width: 150, height: 30)
		$0.layer.cornerRadius = 10
		$0.backgroundColor = .appBrat
		$0.setTitle("randomize again", for: .normal) // Называю кнопку
		$0.titleLabel?.font = UIFont.systemFont(ofSize: 12) // Задаю ей размер шрифта
		$0.tintColor = .appRed
//		$0.frame.origin = CGPoint(
//			x: view.safeAreaLayoutGuide.layoutFrame.maxX - $0.frame.width - 20, // Отступ от правого края
//			y: view.safeAreaLayoutGuide.layoutFrame.minY + 105                  // Отступ от верхнего края
//		)
		return $0
	}(UIButton(type: .custom, primaryAction: generateAction))
	
	lazy var generateAction: UIAction = UIAction { _ in
		self.colors = ColorItem.mockData()
		self.tableView.reloadData() // для обновления содержимого
	}
	
	
	// Добавление содержимого на экран
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		view.addSubview(tableView) // Добавили таблицу
//		view.addSubview(addBtn) // Добавили кнопку
		
		tableView.rowHeight = 150 // Задали высоту ячейки таблицы
		title = "Colors Table" // Задали название View
		navigationController?.navigationBar.prefersLargeTitles = true
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: addBtn) // я хочу добавить кнопку на экран с помощью navigstioncontroller, которая будет leftbarbuttonitem чтобы она была выше всех в иерархии
	}
}

extension ViewController: UITableViewDataSource {
	// сколько ячеек
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		colors.count
	}
	
	// КАК выглядит ОДНА конкретная ячейка
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// 4 вытащить переиспользуемую ячейку
		let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
		
		var config = cell.defaultContentConfiguration()
		// Устанавливаю название ячейки по имени цвета
		config.text = colors[indexPath.row].nameOfColor
		
		cell.contentConfiguration = config
		cell.accessoryType = .disclosureIndicator
		let cellColor = colors[indexPath.row].typeOfColor.color
		cell.backgroundColor = cellColor
		
		return cell
	}
}

extension ViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = SecondVC(colorItem: colors[indexPath.row])
		navigationController?.pushViewController(vc, animated: true)
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			colors.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
	}
}

// 2
func createLabel(text: String) -> UILabel {
	let label = UILabel()
	label.translatesAutoresizingMaskIntoConstraints = false
	label.text = text
	label.numberOfLines = 0
	label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
	label.textColor = .black
	return label
}
