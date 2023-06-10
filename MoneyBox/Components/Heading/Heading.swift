import SwiftUI

struct Heading: View {
    @Binding var scrollViewContentSize: CGSize
    
    var body: some View {
        VStack {
            Balance()
                .frame(width: UIScreen.main.bounds.width)
                .background(
                    GeometryReader { geo -> Color in
                        DispatchQueue.main.async {
                            scrollViewContentSize = geo.size
                        }
                        return Color.clear
                    }
                )
        }.padding()
    }
}
