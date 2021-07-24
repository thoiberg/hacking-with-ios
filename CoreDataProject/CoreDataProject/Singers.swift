//
//  Singers.swift
//  CoreDataProject
//
//  Created by Tim Hoiberg on 24/7/21.
//

import SwiftUI

struct Singers: View {
    @Environment(\.managedObjectContext) var viewContext
    @State private var lastNameFilter = "A"

    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) {
                (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            Button("Add Examples") {
                let taylor = Singer(context: self.viewContext)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.viewContext)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.viewContext)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                print("boop")
                try? self.viewContext.save()
            }
            
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}

struct Singers_Previews: PreviewProvider {
    static var previews: some View {
        Singers()
    }
}
