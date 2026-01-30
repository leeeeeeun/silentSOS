import SwiftUI

struct FireView: View {
    @State private var step = 1 // 1단계: 장소, 2단계: 상태, 3단계: 인원, 4단계: 타이머
    
    var body: some View {
        VStack(spacing: 0) {
            // 1. 상단 헤더 
            HeaderView(title: "화재", subTitle: "불/연기", color: Color(hex: "FF4141"))
            
            if step < 4 {
                // 2. 단계 표시 점 
                StepIndicator(currentStep: step)
                    .padding(.top, 20)
                
                Spacer()
                
                // 3. 단계별 질문지 
                if step == 1 {
                    QuestionView(
                        question: "상황에 맞는 항목을 선택해 주세요",
                        options: ["아파트", "주택", "대형 건물", "지하"],
                        icons: ["ic_apartment", "ic_house", "ic_building", "ic_subway"],
                        onSelect: { step = 2 }
                    )
                } else if step == 2 {
                    QuestionView(
                        question: "상황에 맞는 항목을 선택해 주세요",
                        options: ["연기만 보임", "작은 불", "큰 불"],
                        icons: ["ic_smoke", "ic_small_fire", "ic_big_fire"],
                        onSelect: { step = 3 }
                    )
                } else if step == 3 {
                    QuestionView(
                        question: "상황에 맞는 항목을 선택해 주세요",
                        options: ["혼자 있음", "사람 많음", "모름"],
                        icons: ["ic_one_person", "ic_many_people", "ic_unknown"],
                        onSelect: { step = 4 }
                    )
                }
                
                Spacer()
                
                // 4. 즉시 신고 버튼 
                Button(action: { step = 4 }) {
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
                // 4단계: 카운트다운 화면 
                EmergencyTimerView(title: "화재", color: Color(hex: "FF4141"))
            }
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.white)
    }
}