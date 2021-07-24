//
//  Wizards.swift
//  CoreDataProject
//
//  Created by Tim Hoiberg on 24/7/21.
//

import SwiftUI

struct Wizards: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: self.viewContext)
                
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try self.viewContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct Wizards_Previews: PreviewProvider {
    static var previews: some View {
        Wizards()
    }
}
