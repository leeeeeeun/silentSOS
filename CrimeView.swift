import SwiftUI

struct CrimeView: View {
    @State private var step = 1 // 1: 상황 선택, 2: 신고 중
    
    var body: some View {
        VStack(spacing: 0) {
            // 1. 상단 헤더 
            HeaderView(title: "범죄", subTitle: "위험한 사람", color: Color(hex: "FF9900"))
            
            if step == 1 {
                // 2. 단계 표시 (범죄는 단계가 짧으므로 점 표시 생략 가능 혹은 유지)
                Spacer()
                
                // 3. 상황 선택 질문지
                QuestionView(
                    question: "상황에 맞는 항목을 선택해 주세요",
                    options: ["스토킹", "위협당함(칼/둔기)", "몰래 촬영/성추행", "도난/폭행"],
                    icons: ["ic_stalking", "ic_threat", "ic_molka", "ic_assault"],
                    onSelect: { step = 2 }
                )
                
                Spacer()
                
                // 4. 즉시 신고 버튼
                Button(action: { step = 2 }) {
                    Text("상황 설명 없이 즉시 신고하기")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 65)
                        .background(Color.black)
                        .cornerRadius(15)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 30)
                }
            } else {
                // 2단계: 신고 접수 중 (카운트다운)
                EmergencyTimerView(title: "범죄", color: Color(hex: "FF9900"))
            }
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.white)
    }
}