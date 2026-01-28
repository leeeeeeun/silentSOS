import SwiftUI

struct MainHomeView: View {
    var body: some View {
        VStack(spacing: 30) {
            // 1. 로고 섹션
            VStack {
                Text("silent")
                    .font(.system(size: 24, weight: .light))
                Text("SOS")
                    .font(.system(size: 48, weight: .black))
                    .foregroundColor(.red)
            }
            .padding(.top, 50)
            
            Spacer()
            
            // 2. 신고 버튼 리스트
            VStack(spacing: 15) {
                SOSButton(title: "화재", subtitle: "불/연기", color: .red, icon: "flame.fill")
                SOSButton(title: "범죄", subtitle: "위험한 상황", color: .orange, icon: "shield.fill")
                SOSButton(title: "구급", subtitle: "아픔/부상", color: .green, icon: "cross.case.fill")
                SOSButton(title: "납치", subtitle: "클릭형", color: .purple, icon: "person.fill.viewfinder")
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
        .background(Color.white)
    }
}

// 재사용 가능한 버튼 컴포넌트
struct SOSButton: View {
    let title: String
    let subtitle: String
    let color: Color
    let icon: String
    
    var body: some View {
        Button(action: {
            print("\(title) 신고 페이지로 이동")
        }) {
            HStack {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 40)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(subtitle)
                        .font(.caption)
                }
                .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.7))
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .cornerRadius(12)
        }
    }
}

// 미리보기
struct MainHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeView()
    }
}