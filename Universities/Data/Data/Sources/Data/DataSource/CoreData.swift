//
//  CoreData.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation
import CoreData
import Entities
import Protocols


public class UniversityCoreDataSourceImpl: UniversityDataSource  {
 
    let container: NSPersistentContainer
    
    public init() {
        guard let modelURL = Bundle.module.url(forResource: "MyUniversities", withExtension: "momd") else {
            fatalError("Unable to locate Core Data model file")
        }
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to initialize managed object model")
        }
        container = NSPersistentContainer(name: "MyUniversities", managedObjectModel: managedObjectModel)
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
    
    public func getAll() throws -> UniversitiesListModel {
        let request = MyUniversityEntity.fetchRequest()
        return try container.viewContext.fetch(request).map({ universityCoreDataEntity in
            
            UniversityModel(stateProvince: universityCoreDataEntity.state ?? "", domains: [], webPages: [], name: universityCoreDataEntity.name ?? "", alphaTwoCode: universityCoreDataEntity.code ?? "AE", country: universityCoreDataEntity.country ?? "")

        })
        
    }
    
    
    public func create(todo: UniversitiesListModel) throws -> (){

        for item in todo {

            let universityCoreDataEntity = MyUniversityEntity(context: container.viewContext)

            universityCoreDataEntity.name = item.name
            universityCoreDataEntity.code = item.alphaTwoCode
            universityCoreDataEntity.country = item.country
            universityCoreDataEntity.state = item.stateProvince
            saveContext()
          }
        
        
    }
    
    
    private func saveContext(){
        let context = container.viewContext
        if context.hasChanges {
            do{
                try context.save()
            }catch{
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
}

