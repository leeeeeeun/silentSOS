import SwiftUI

struct CrimeView: View {

    @State private var currentStep = 1 // 1: 범죄유형 선택 2: 카메라 및 최종 신고
    @State private var selectedCrime = ""

    let crimeTypes = ["스토킹", "위협당함(칼/둔기)", "몰래촬영/성추행", "도난/폭행"]

    var body: some View {

        VStack(spacing: 20){
            ProgressView(value: Double(currentStep), total: 2)
                .tint(.orange)
                .padding()

            if currentStep == 1{
                Text("어떤 범죄 피해인가요?")
                    .font(.title2.bold())
                
                VStack(spacing: 15){
                    ForEach(crimeTypes, id: \.self){ type in 
                        GridSelectionButton(title: type, isSelected: selectedCrime == type){
                            selectedCrime = type
                            currentStep = 2
                        }
                    }
                }
            }else {

                Text("현장 상황 전송")
                    .font(.title2.bold())

                VStack(spacing: 20){
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.black. opacity(0.1))
                            .frame(height: 300)

                            VStack{
                                Image(systemName: "video.fill")
                                    .font(.largeTitle)
                                Text("카메라 연결됨")
                                    .font(.headline)
                                Text("위치가 실시간으로 공유중입니다...")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                    }

                    Text("선택된 유형: \(selectedCrime)")
                        .font(.subheadline)
                        .padding(.top)
                    
                    NavigationLink(destination: EmergencyTimerView(emergencyType: "112")){
                        Text("112 신고")
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("범죄 신고")
    }
    

    
}