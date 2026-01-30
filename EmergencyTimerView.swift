import SwiftUI

struct EmergencyTimerView: View{

    @State private var timeRemaining = 3
    let emergencyType: String // 112 or 119
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // 1초마다 신호 발생

    var body: some View {
        VStack(spacing: 40) {
            Text("\(timeRemaining)")
                .font(.system(size: 120, weight: .black))
                .foregroundColor(.red)
                
            Text("\(emergencyType)에 자동으로 신고를 접수합니다. \n위치 정보와 카메라 정보가 전송됩니다.")
                .multilineTextAlignment(.center)
                .font(.headline)

            // 지도 이미지 시뮬레이션

            Image("map_sample")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(15)

            Button("신고 취소"){
                //
            }
            .buttonStyle(.bordered)
           
        }
        .onReceive(timer){ _ in

            if timeRemaining > 0{
                timeRemaining -= 1
            }else{
                //
                print("\(emergencyType ) 신고 완료!")
            }

        }
    }
}