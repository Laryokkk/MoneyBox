import SwiftUI

struct Heading: View {
    @Binding var scrollViewContentSize: CGSize
    
    let balance: String = "1000"
    let income: String = "2000"
    let expense: String = "1000"
    
    var body: some View {
        VStack {
            Balance(balance: balance, income: income, expense: expense)
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
