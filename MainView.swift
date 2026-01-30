import SwiftUI

struct MainView: View {
    var body: some View{
        // 화면전환 관리
        NavigationStack{
            VStack(spacing: 20){
                Text("Silent SOS")
                    .font(.largeTitle.bold())
                    .padding(.bottom, 30)

                // NaviationLink: 클릭 시 해당 View로 이동

                NavigationLink(destination: FireView()){Text("화재")}
                    .buttonStyle(SOSButtonStyle(color: .red))
                NavigationLink(destination: CrimeView()){Text("범죄")}
                    .buttonStyle(SOSButtonStyle(color: .orange))
                NavigationLink(destination: MedicalView()){Text("구급")}
                    .buttonStyle(SOSButtonStyle(color: .green))
                NavigationLink(destination: KidnapView()){Text("납치")}
                    .buttonStyle(SOSButtonStyle(color: .purple))
            }
            .padding()
        }
    }

    
}