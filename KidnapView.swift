import SwiftUI

struct KidnapView: View {

    var body: some View{
        VStack(spacing: 0){

            // 상단 헤더

            ZStack{
                Color.purple
                    .frame(height: 60)

                Text("납치")
                    .font(.title2.bold())
                    .foregroundColor(.white)
            }
            VStack(spacing: 30){
                Spacer()

                //카메라 아이콘 및 상태 설명

                Image(systemName: "video.circle.fill")
                    .font(.title2.bold())
                    .foregroundColor(.black)
                
                //카메라 프리뷰

                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(maxWidth: .infinity, minHeight: 400)
                    
                    VStack(spacing: 20){

                        Text("카메라 끄기")
                            .font(.caption)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 8)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(20)

                        Text("카메라 연결")
                            .font(.system(size: 32, weight: .bold))

                        Text("위치가 실시간으로 공유중입니다...")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 20)

                NavigationLink(destination: EmergencyTimerView(emergencyType: "112")){
                    Text("112 신고")
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity, minHeight: 65)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
    }

    
}