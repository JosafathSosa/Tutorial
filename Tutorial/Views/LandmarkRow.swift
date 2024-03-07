import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50).padding()
            Text(landmark.name)
            Spacer()
            
            if(landmark.isFavorite){
                Image(systemName: "star.fill").foregroundColor(.yellow).padding()
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            LandmarkRow(landmark: ModelData().landmarks[0])
        }
    }
}

