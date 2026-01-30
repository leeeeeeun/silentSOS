import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                // 상단 로고 
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .padding(.top, 50)
                    .padding(.bottom, 30)

            
                VStack(spacing: 12) {
                    NavigationLink(destination: FireView()) {
                        SOSMenuButton(title: "화재", subTitle: "불/연기", icon: "ic_fire", color: Color(hex: "FF4141"))
                    }
                    
                    NavigationLink(destination: CrimeView()) {
                        SOSMenuButton(title: "범죄", subTitle: "위험한 사람", icon: "ic_crime", color: Color(hex: "FF9900"))
                    }
                    
                    NavigationLink(destination: MedicalView()) {
                        SOSMenuButton(title: "구급", subTitle: "아픔/부상", icon: "ic_medical", color: Color(hex: "74D37A"))
                    }
                    
                    NavigationLink(destination: KidnapView()) {
                        SOSMenuButton(title: "납치", subTitle: "끌려감", icon: "ic_kidnap", color: Color(hex: "D182E1"))
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .background(Color.white)
        }
    }
}