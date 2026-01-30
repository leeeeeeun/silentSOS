import SwiftUI

struct EmergencyTimerView: View {
    @State private var timeRemaining = 3
    let title: String // 화재, 범죄 등 제목을 받음
    let color: Color  // 해당 화면의 테마 색상
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 40) {
            Text(title + " 신고 접수 중...")
                .font(.title2.bold())
            
            ZStack {
                Circle()
                    .stroke(color.opacity(0.2), lineWidth: 20)
                    .frame(width: 200, height: 200)
                
                Circle()
                    .trim(from: 0, to: CGFloat(timeRemaining) / 3.0)
                    .stroke(color, lineWidth: 20)
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                
                Text("\(timeRemaining)")
                    .font(.system(size: 80, weight: .bold))
            }
            
            Text("3초 후 자동으로 신고가 접수됩니다.")
                .font(.subheadline)
                .foregroundColor(.gray)

            Button("신고 취소하기") {
                // 취소 로직
            }
            .buttonStyle(.bordered)
            .tint(.black)
        }
        .onReceive(timer) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }
}