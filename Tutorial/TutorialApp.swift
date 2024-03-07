//
//  TutorialApp.swift
//  Tutorial
//
//  Created by Josafath Sosa Jimenez on 05/03/24.
//

import SwiftUI

@main
struct TutorialApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
