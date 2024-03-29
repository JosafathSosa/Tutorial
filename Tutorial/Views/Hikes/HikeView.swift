//
//  HikeView.swift
//  Tutorial
//
//  Created by Josafath Sosa Jimenez on 06/03/24.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        //AnyTransition.move(edge: .trailing)
        .asymmetric(
                    insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal: .scale.combined(with: .opacity)
                )
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = true

    var body: some View {
        
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    withAnimation{
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        
                }
            }

            if showDetail {
                HikeDetail(hike: hike).transition(.moveAndFade)
            }
        
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
