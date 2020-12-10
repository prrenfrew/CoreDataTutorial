//
//  ViewController.swift
//  CoreDataTutorial
//
//  Created by MAC on 12/10/20.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let allPeople = CoreDataManager.shared.getAllPeople()
    print(allPeople)
    let newPerson = CoreDataManager.shared.createPerson(with: "Paul")
    print(newPerson)
//    CoreDataManager.shared.saveContext()
    
    for person in allPeople {
      print(person.name)
    }
    DispatchQueue.main.async {
      print(allPeople)
    }
  }


}

