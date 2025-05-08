//
//  StorageManager.swift
//  bookshelf
//
//  Created by Данила on 08.05.2025.
//

import Foundation

class StorageManager {
	
	private var path = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)[0]
	
	//MARK: Save cover
	///`saveCover` функция для сохранения обложки
	///`cover.jpeg` стандартное название обложки
	func saveCover(bookId: String, cover: Data){
		let bookPath = path.appending(component: bookId)
		try? FileManager.default.createDirectory(at: bookPath, withIntermediateDirectories: true)
		var coverPath = bookPath.appending(component: "cover.jpg")
		
		do{
			try cover.write(to: coverPath)
		} catch {
			print(error.localizedDescription)
		}
	}
	
	///`getColor` метод для получения файла
	func getCover(bookId: String) -> Data?{
		var coverPath = path
			.appending(component: bookId)
			.appending(component: "cover.jpg")
		do {
			let coverData = try Data(contentsOf: coverPath)
			return coverData
		} catch {
			print(error.localizedDescription)
			return nil
		}
	}
}
