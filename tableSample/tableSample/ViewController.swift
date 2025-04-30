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

enum myColors: String, CaseIterable {
	case Green = "Green", ProductRed = "Product Red", Yellow = "Yellow", Purple = "Purple", DeepPurple = "Deep Purple", Violet = "Violet", Gray = "Gray", SpaceGray = "Space Gray",
		 RoseGold = "Rose Gold", Gold = "Gold", Brat = "Brat Green", Lime = "Lime", Cyan = "Cyan", Magenta = "Magenta", Brown = "Brown", Orange = "Orange", Blue = "Blue", Red = "Red"
}

//let colSamp = myColors.DeepPurple
//colSamp.rawValue

struct colorItem: Identifiable {
	let id = UUID().uuidString
	let typeOfColor: myColors
	let nameOfColor: String
	
	static func mockData() -> [colorItem] {
		let allColors = myColors.allCases
		
		var mockData: [colorItem] = []
		for _ in 0..<20 {
			if let randColor = allColors.randomElement() {
				let newItemOfMockData = colorItem(typeOfColor: randColor, nameOfColor: randColor.rawValue)
				mockData.append(newItemOfMockData)
			}
		}
		return mockData
	}
}

class ViewController: UIViewController {
	
	// *
	// Создание таблицы
	// Массив для таблицы
	var colors: [colorItem] = colorItem.mockData()
	
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
		$0.backgroundColor = .white
		$0.setTitle("randomize again", for: .normal) // Называю кнопку
		$0.titleLabel?.font = UIFont.systemFont(ofSize: 12) // Задаю ей размер шрифта
		$0.tintColor = .appRed
		$0.frame.origin = CGPoint(
			x: view.safeAreaLayoutGuide.layoutFrame.maxX - $0.frame.width - 20, // Отступ от правого края
			y: view.safeAreaLayoutGuide.layoutFrame.minY + 105                  // Отступ от верхнего края
		)
		return $0
	}(UIButton(primaryAction: generateAction))
	
	lazy var generateAction: UIAction = UIAction { _ in
		self.colors = colorItem.mockData()
	}
	
	
	// Добавление содержимого на экран
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		view.addSubview(tableView) // Добавили таблицу
		view.addSubview(addBtn) // Добавили кнопку
		
		tableView.rowHeight = 150 // Задали высоту ячейки таблицы
		title = "Colors Table" // Задали название View
		navigationController?.navigationBar.prefersLargeTitles = true
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
		switch colors[indexPath.row].typeOfColor {
			
		case .Green:
			cell.backgroundColor = .appGreen
		case .ProductRed:
			cell.backgroundColor = .appRed
		case .Yellow:
			cell.backgroundColor = .appYellow
		case .Purple:
			cell.backgroundColor = .appPurple
		case .DeepPurple:
			cell.backgroundColor = .appDeepPurple
		case .Violet:
			cell.backgroundColor = .appViolet
		case .Gray:
			cell.backgroundColor = .gray
		case .SpaceGray:
			cell.backgroundColor = .appSpaceGray
		case .RoseGold:
			cell.backgroundColor = .appRoseGold
		case .Gold:
			cell.backgroundColor = .appGold
		case .Brat:
			cell.backgroundColor = .appBrat
		case .Lime:
			cell.backgroundColor = .appLime
		case .Cyan:
			cell.backgroundColor = .cyan
		case .Magenta:
			cell.backgroundColor = .magenta
		case .Brown:
			cell.backgroundColor = .brown
		case .Orange:
			cell.backgroundColor = .orange
		case .Blue:
			cell.backgroundColor = .blue
		case .Red:
			cell.backgroundColor = .red
		}
		
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
