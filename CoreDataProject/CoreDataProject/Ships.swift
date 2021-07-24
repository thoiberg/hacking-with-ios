//
//  Ships.swift
//  CoreDataProject
//
//  Created by Tim Hoiberg on 24/7/21.
//

import SwiftUI

struct Ships: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH[c] %@", "E")) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add Examples") {
                let ship1 = Ship(context: self.viewContext)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: self.viewContext)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: self.viewContext)
                ship3.name = "Millennium Falcom"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: self.viewContext)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? self.viewContext.save()
            }
        }
    }
}

struct Ships_Previews: PreviewProvider {
    static var previews: some View {
        Ships()
    }
}
