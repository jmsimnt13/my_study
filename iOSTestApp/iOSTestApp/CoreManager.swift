//
//  CoreManager.swift
//  iOSTestApp
//
//  Created by Данила on 05.04.2025.
//

import Foundation
import CoreData

class CoreManager{
	static let shared = CoreManager()
	var notes = [Note]() // var notes = [Note]()
	
	private init(){
		fetchAllNotes()
	}
	
	// MARK: - Core Data stack
	
	lazy var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "iOSTestApp")
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		return container
	}()
	
	// MARK: - Core Data Saving support
	
	func saveContext () {
		let context = persistentContainer.viewContext
		if context.hasChanges {
			do {
				try context.save()
			} catch {
				let nserror = error as NSError
				fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
			}
		}
	}
	
	
	// 1 Fetch
	func fetchAllNotes() {
		let req = Note.fetchRequest()
		if let notes = try? persistentContainer.viewContext.fetch(req) {
			self.notes = notes
		}
	}
	
	// 2 Add
	func addNewNote(title: String, text: String) {
		let note = Note(context: persistentContainer.viewContext)
		note.id = UUID().uuidString
		note.title = title
		note.text = text
		note.date = Date()
		
		saveContext()
		fetchAllNotes()
	}
}
