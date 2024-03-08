//
//  CategoryHome.swift
//  Tutorial
//
//  Created by Josafath Sosa Jimenez on 06/03/24.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modeldata: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView{
            List {
                PageView(pages: modeldata.features.map { FeatureCard(landmark: $0) })
                                   .listRowInsets(EdgeInsets())
                    
                ForEach(modeldata.categories.keys.sorted(), id: \.self){key in
                    CategoryRow(categoryName: key, items: ModelData().categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
                .toolbar{
                    Button{
                        showingProfile.toggle()
                    }label: {
                        Label("User profile", systemImage: "person.crop.circle")
                    }
                }
                .sheet(isPresented: $showingProfile){
                    ProfileHost().environmentObject(ModelData())
                }
        }detail: {
            Text("Select a landmark")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(ModelData())
    }
}
