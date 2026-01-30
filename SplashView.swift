import SwiftUI

struct SplashView: View {
    @State private var isLanguageSelected = false // 언어 선택 여부
    @State private var showDropdown = false      // 드롭다운 표시 여부
    
    let languages = ["한국어", "English", "中文", "日本語"]
    
    var body: some View {
        if isLanguageSelected {
            MainView() // 언어를 선택하면 메인으로 이동
        } else {
            VStack(spacing: 40) {
                Spacer()
                
                // 로고 이미지 (피그마 디자인 반영)
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                
                // 언어 선택 드롭다운 영역
                VStack(spacing: 0) {
                    Button(action: {
                        withAnimation { showDropdown.toggle() }
                    }) {
                        HStack {
                            Text("언어 선택...")
                                .foregroundColor(.gray)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    }
                    .frame(width: 280)
                    
                    // 드롭다운 리스트 
                    if showDropdown {
                        VStack(spacing: 0) {
                            ForEach(languages, id: \.self) { lang in
                                Button(action: {
                                    // 언어를 선택하면 메인 화면으로 전환
                                    withAnimation { isLanguageSelected = true }
                                }) {
                                    Text(lang)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding()
                                        .foregroundColor(.black)
                                        .background(Color.gray.opacity(0.1))
                                }
                                Divider()
                            }
                        }
                        .frame(width: 280)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}