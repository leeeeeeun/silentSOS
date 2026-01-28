import SwiftUI

struct MainHomeView: View {
    var body: some View {
        NavigationView { // 1. 화면 전환을 위해 네비게이션 뷰로 감쌉니다.
            VStack(spacing: 30) {
                // 로고 섹션
                VStack {
                    Text("silent")
                        .font(.system(size: 24, weight: .light))
                    Text("SOS")
                        .font(.system(size: 48, weight: .black))
                        .foregroundColor(.red)
                }
                .padding(.top, 50)
                
                Spacer()
                
                // 2. 버튼들을 NavigationLink로 감싸서 클릭 시 이동하게 만듭니다.
                VStack(spacing: 15) {
                    NavigationLink(destination: DetailSelectionView(title: "화재", color: .red, options: ["아파트", "주택", "대형건물", "지하"])) {
                        SOSButton(title: "화재", subtitle: "불/연기", color: .red, icon: "flame.fill")
                    }
                    
                    NavigationLink(destination: DetailSelectionView(title: "범죄", color: .orange, options: ["폭행/싸움", "성폭력", "강도/절도", "기타"])) {
                        SOSButton(title: "범죄", subtitle: "위험한 상황", color: .orange, icon: "shield.fill")
                    }
                    
                    NavigationLink(destination: DetailSelectionView(title: "구급", color: .green, options: ["의식불명", "호흡곤란", "외상/출혈", "기타"])) {
                        SOSButton(title: "구급", subtitle: "아픔/부상", color: .green, icon: "cross.case.fill")
                    }
                    
                    NavigationLink(destination: DetailSelectionView(title: "납치", color: .purple, options: ["차량납치", "감금", "스토킹", "기타"])) {
                        SOSButton(title: "납치", subtitle: "클릭형", color: .purple, icon: "person.fill.viewfinder")
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
            .background(Color.white)
            .navigationBarHidden(true) // 메인 화면의 상단 바는 숨깁니다.
        }
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

// 상세 선택 화면
struct DetailSelectionView: View {
    let title: String
    let color: Color
    let options: [String]
    
    // 화면을 닫기 위한 변수
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 0) {
            // 상단 헤더
            HStack {
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .font(.title2)
                }
                Spacer()
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                // 좌우 균형을 위한 투명 아이콘
                Image(systemName: "chevron.left").opacity(0)
            }
            .padding()
            .background(color)
            
            Text("상황에 맞는 항목을 선택해주세요")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 20)

            // 2x2 그리드 메뉴
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        print("\(option) 신고 접수 준비")
                    }) {
                        Text(option)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(Color(.systemGray6))
                            .foregroundColor(.black)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    }
                }
            }
            .padding(20)
            
            Spacer()
            
            // 하단 긴급 버튼
            Button(action: { /* 즉시 신고 로직 */ }) {
                Text("상황 설명 없이 즉시 신고")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationBarHidden(true) // 기본 네비게이션 바 숨김
    }
}

// 신고 진행 및 완료 화면
struct ReportingProcessView: View {
    let title: String
    let color: Color
    @State private var remainingTime = 3
    @State private var isReported = false
    @Environment(\.presentationMode) var presentationMode
    
    // 타이머 설정
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 40) {
            if !isReported {
                // --- 1. 3초 카운트다운 화면 ---
                Text("\(title) 신고 접수 중...")
                    .font(.title)
                    .fontWeight(.bold)
                
                ZStack {
                    Circle()
                        .stroke(lineWidth: 15)
                        .opacity(0.3)
                        .foregroundColor(color)
                    
                    Circle()
                        .trim(from: 0.0, to: CGFloat(remainingTime) / 3.0)
                        .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                        .foregroundColor(color)
                        .rotationEffect(Angle(degrees: 270.0))
                        .animation(.linear(duration: 1.0), value: remainingTime)
                    
                    Text("\(remainingTime)")
                        .font(.system(size: 80, weight: .bold))
                }
                .frame(width: 200, height: 200)
                
                Text("3초 후 자동으로 신고가 접수됩니다.")
                    .foregroundColor(.gray)

                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Text("신고 취소하기")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 40)
                
            } else {
                // --- 2. 신고 완료 화면 (Section 1 디자인 참고) ---
                VStack(spacing: 20) {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.green)
                    
                    Text("신고 접수 완료")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    Text("사용자의 위치와 상황이\n119/112로 전달되었습니다.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Text("홈으로 돌아가기")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding()
                    }
                    .padding(.top, 20)
                }
                .transition(.scale)
            }
        }
        .onReceive(timer) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                withAnimation {
                    isReported = true
                }
            }
        }
        .navigationBarHidden(true)
    }
}