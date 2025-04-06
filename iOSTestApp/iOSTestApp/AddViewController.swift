//
//  AddViewController.swift
//  iOSTestApp
//
//  Created by Данила on 05.04.2025.
//

import UIKit

class AddViewController: UIViewController {

	private let manager = CoreManager.shared
	var note: Note?
	
	lazy var titleField: UITextField = {
		let title = UITextField()
		title.placeholder = "Title"
		title.text = note?.title ?? ""
		title.translatesAutoresizingMaskIntoConstraints = false
		title.heightAnchor.constraint(equalToConstant: 50).isActive = true
		title.backgroundColor = .gray
		
		return title
	}()
	
	lazy var textView: UITextView = {
		let title = UITextView()
		title.text = note?.text ?? ""
		title.translatesAutoresizingMaskIntoConstraints = false
		title.heightAnchor.constraint(equalToConstant: 100).isActive = true
		title.backgroundColor = .gray
		title.font = UIFont.systemFont(ofSize: 16)
		
		return title
	}()
	
	lazy var btn: UIButton = {
		let btn = UIButton(primaryAction: action)
		btn.setTitle( "save", for: .normal)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	lazy var action = UIAction { _ in
		if self.note == nil {
			self.manager.addNewNote(title: self.titleField.text ?? "", text: self.textView.text)
		} else {
			self.note?.updateNote(newTitle: self.titleField.text ?? "", newText: self.textView.text)
		}
		
		self.navigationController?.popViewController(animated: true)
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(titleField)
		view.addSubview(textView)
		view.addSubview(btn)
		view.backgroundColor = .white
		title = "Add"
		
		NSLayoutConstraint.activate([
			titleField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			
			textView.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 10),
			textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			
			btn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
		])
	}
}
