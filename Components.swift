import SwiftUI

struct SOSButtonStyle: ButtonStyle {
    let color: Color

    func makeBody(ｃonfiguration: Configuration) -> some View{
        configuration.label
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(color)
            .cornerRadius(15)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct GridSelectionButton: View{
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View{
        Button(action: action){
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .frame(maxWidth: .infinity, minHeight: 100)
                .background(isSelected ? .white : .black)
                .cornerRadius(12)
        }
    }
}