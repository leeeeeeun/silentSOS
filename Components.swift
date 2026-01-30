import SwiftUI

// 1. 메인 화면 버튼 컴포넌트
struct SOSMenuButton: View {
    var title: String
    var subTitle: String
    var icon: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 15) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 28, weight: .bold))
                Text(subTitle)
                    .font(.system(size: 14))
                    .opacity(0.8)
            }
            .foregroundColor(.white)
            
            Spacer()
        }
        .padding(.horizontal, 25)
        .frame(height: 100)
        .background(color)
        .cornerRadius(50)
        .shadow(color: color.opacity(0.3), radius: 5, x: 0, y: 5)
    }
}

// 2. 상단 헤더 컴포넌트 (중복 제거 및 높이 최적화)
struct HeaderView: View {
    let title: String
    let subTitle: String
    let color: Color
    
    var body: some View {
        ZStack {
            color
                .frame(height: 120) // 노치 디자인 고려한 높이
            VStack {
                Spacer()
                Text(title)
                    .font(.title.bold())
                Text(subTitle)
                    .font(.caption)
            }
            .foregroundColor(.white)
            .padding(.bottom, 20)
        }
    }
}

// 3. 질문지 선택 버튼 컴포넌트
struct QuestionView: View {
    let question: String
    let options: [String]
    let icons: [String]
    var onSelect: () -> Void
    
    var body: some View {
        VStack(spacing: 15) {
            Text(question)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            ForEach(0..<options.count, id: \.self) { index in
                Button(action: onSelect) {
                    HStack(spacing: 20) {
                        Image(icons[index]) 
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                        
                        Text(options[index])
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.horizontal, 25)
                    .frame(maxWidth: .infinity)
                    .frame(height: 75)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                }
                .padding(.horizontal, 25)
            }
        }
    }
}

// 4. 단계 표시 점 (Step Indicator)
struct StepIndicator: View {
    var currentStep: Int
    var body: some View {
        HStack(spacing: 8) {
            ForEach(1...3, id: \.self) { i in
                Circle()
                    .fill(i == currentStep ? Color.black : Color.gray.opacity(0.3))
                    .frame(width: 8, height: 8)
            }
        }
    }
}

// 5. Hex 색상 코드 사용을 위한 Color 확장
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}