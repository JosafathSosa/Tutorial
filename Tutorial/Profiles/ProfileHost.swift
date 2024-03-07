//
//  ProfileHost.swift
//  Tutorial
//
//  Created by Josafath Sosa Jimenez on 06/03/24.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modeldata: ModelData
    //SwiftUI maneja el almacenamiento de una propiedad que se declara como estado
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                if editMode?.wrappedValue == .active{
                    Button("Cancel", role: .cancel){
                        draftProfile = modeldata.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive{
                ProfileSummary(profile: modeldata.profile)
            }else{
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        draftProfile = modeldata.profile
                    }
                    .onDisappear{
                        modeldata.profile = draftProfile
                    }
            }
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(ModelData())
    }
}
