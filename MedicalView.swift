import SwiftUI

struct MedicalView: View {
    @State private var selectedPart = "" // 선택된 신체 부위
    @State private var selectedSymptom = "" // 선택된 증상
    
    // 기획안 기반 데이터
    let symptoms = ["통증", "출혈", "의식 없음", "호흡 곤란"]
    let bodyParts = ["머리", "가슴", "복부", "다리"]

    var body: some View {
        VStack(spacing: 0) {
            // 상단 헤더 
            ZStack {
                Color.green
                    .frame(height: 60)
                Text("구급")
                    .font(.title2.bold())
                    .foregroundColor(.white)
            }
            
            ScrollView {
                VStack(spacing: 30) {
                    Text("어디가 아픈가요?")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    // 인체 모형 선택 영역 
                    ZStack {
                        Image(systemName: "person.fill") // 실제 프로젝트에선 인체 이미지 사용
                            .font(.system(size: 250))
                            .foregroundColor(.gray.opacity(0.2))
                        
                        // 부위별 선택 버튼 
                        VStack(spacing: 40) {
                            BodyPartButton(title: "머리", isSelected: selectedPart == "머리") { selectedPart = "머리" }
                            HStack(spacing: 100) {
                                BodyPartButton(title: "가슴", isSelected: selectedPart == "가슴") { selectedPart = "가슴" }
                                BodyPartButton(title: "복부", isSelected: selectedPart == "복부") { selectedPart = "복부" }
                            }
                            BodyPartButton(title: "다리", isSelected: selectedPart == "다리") { selectedPart = "다리" }
                        }
                    }
                    .frame(height: 300)
                    
                    // 증상 선택 태그 
                    VStack(spacing: 15) {
                        LazyVGrid(columns: [GridItem(), GridItem()], spacing: 10) {
                            ForEach(symptoms, id: \.self) { symptom in
                                Button(action: { selectedSymptom = symptom }) {
                                    HStack {
                                        Circle()
                                            .fill(selectedSymptom == symptom ? Color.green : Color.gray.opacity(0.3))
                                            .frame(width: 10, height: 10)
                                        Text(symptom)
                                            .foregroundColor(.black)
                                    }
                                    .frame(maxWidth: .infinity, minHeight: 45)
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(selectedSymptom == symptom ? Color.green : Color.clear, lineWidth: 2)
                                    )
                                }
                            }
                        }
                        
                        // 119 신고하기 버튼
                        NavigationLink(destination: EmergencyTimerView(emergencyType: "119")) {
                            Text("119 신고하기")
                                .font(.headline)
                                .frame(maxWidth: .infinity, minHeight: 60)
                                .background(selectedPart.isEmpty || selectedSymptom.isEmpty ? Color.gray.opacity(0.5) : Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                        .disabled(selectedPart.isEmpty || selectedSymptom.isEmpty)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
    }
}

// 부위 선택 전용 작은 버튼 컴포넌트
struct BodyPartButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.caption.bold())
                .padding(8)
                .background(isSelected ? Color.green : Color.white)
                .foregroundColor(isSelected ? .white : .black)
                .cornerRadius(8)
                .shadow(radius: 2)
        }
    }
}