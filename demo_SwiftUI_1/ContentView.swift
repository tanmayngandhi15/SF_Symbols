
import SwiftUI

struct ContentView: View {
    
    var activities = ["archery", "baseball", "basketball", "bowling", "boxing", "cricket", "curling", "fencing", "golf", "hiking", "lacrosse", "rugby", "squash"]
    
    let systemColors: [Color] = [.black, .red, .blue, .green, .orange, .purple, .pink]
    @State var selected = "archery"
    @State var randomSystemColor = Color.black
    
    @State var id = 0
    
    
    var body: some View {

        VStack {

            Circle()
                .fill(randomSystemColor)
                .overlay(

                    VStack {
                        
                        Image(systemName: "figure.\(selected)")
                            .font(.system(size: 144))
                            .foregroundStyle(.yellow)
                        
                        Text(selected.uppercased())
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.white)
                    }
 
                )
                .padding(.minimum(10, 10))
                .transition(.slide)
                .id(selected)

            
            Text("Color: \(randomSystemColor.description)")
                .font(.system(size: 40))
                .italic()
                .underline()
                .foregroundStyle(.brown)
            
            Button("Click") {

                withAnimation(.easeInOut(duration: 1)) {
                    selected = activities.randomElement() ?? "archery"

                    randomSystemColor = systemColors.randomElement() ?? .black
                    id = activities.firstIndex(of: selected)!
  
                }
                
            }
            .padding()
            .font(.system(size: 30))
            .buttonStyle(.bordered)
            .foregroundStyle(.mint)
            .tint(.orange)
            
            
            Spacer()
        }
        .padding()
        
    }
    
}

#Preview {
    ContentView()
}
