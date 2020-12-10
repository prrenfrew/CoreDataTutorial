//
//  CoreDataManager.swift
//  CoreDataTutorial
//
//  Created by MAC on 12/10/20.
//

import CoreData
import Foundation

/*
 CoreData Stack
 
 persistent store - this is where the data is saved
 managed object - this is an object that represents a stored object, similar to a database row
 managed object context - This will be where we get and save our managed objects
 persistent coordinator - This is the go between, between the context and the store
 
 Something to keep in mind with CoreData.
 
 When retrieving NSManagedObjects, it will not get the properties until we need them
 */

final class CoreDataManager {
  
  static let shared = CoreDataManager()
  
  lazy var container: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "MyContainer")
    container.loadPersistentStores { (description, error) in
      print(description)
      print(error)
    }
    return container
  }()
  
  var context: NSManagedObjectContext {
    return self.container.viewContext
  }
  
  private init() { }
  
  func createPerson(with name: String) -> Person? {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Person", in: self.context) else { return nil }
    let person = Person(entity: entityDescription, insertInto: self.context)
    person.name = name
    return person
  }
  
  func saveContext() {
    try? self.context.save()
  }
  
  func getAllPeople() -> [Person] {
    let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
    do {
      return try self.context.fetch(fetchRequest)
    } catch {
      return []
    }
  }
}
