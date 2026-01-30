import SwiftUI

struct FireView: View{

    @State private var currentStep = 1 // 1: 장소, 2: 규모, 3: 주변상황
    @State private var selectedLocation = ""
    @State private var selectedScale = ""
    @State private var selectedPeople = ""

    var body: some View{
        VStack(spacing: 20){

            ProgressView(value: Double(currentStep), total: 3)
                .tint(.red)
                .padding()

            if currentStep == 1{
                Text("어디에서 불이 났나요?").font(.title2.bold())
                LazyVGrid(columns: [GridItem(), GridItem()]){
                    GridSelectionButton(title: "아파트", isSelected: selectedLocation=="아파트") 
                    {selectedLocation ="아파트"; currentStep = 2}
                    GridSelectionButton(title: "주택", isSelected: selectedLocation=="주택") 
                    {selectedLocation ="주택"; currentStep = 2}
                    GridSelectionButton(title: "대형건물", isSelected: selectedLocation=="대형건물") 
                    {selectedLocation ="대형건물"; currentStep = 2}
                    GridSelectionButton(title: "지하", isSelected: selectedLocation=="지하") 
                    {selectedLocation ="지하"; currentStep = 2}

                }
            } else if currentStep == 2 {

             Text("불의 규모가 어떤가요?").font(.title2.bold())
               VStack(spacing: 10){
                    GridSelectionButton(title: "연기만", isSelected: selectedScale == "연기만"){selectedScale ="연기만"; currentStep = 3}
                    GridSelectionButton(title: "작은 불", isSelected: selectedScale == "작은 불"){selectedScale ="작은 불"; currentStep = 3}
                    GridSelectionButton(title: "대형 불", isSelected: selectedScale == "대형 불"){selectedScale ="대형 불"; currentStep = 3}

               }
               
            } else if currentStep == 3{

                Text("주변에 사람이 있나요?").font(.title2.bold())
                VStack(spacing: 10){
                    GridSelectionButton(title: "사람 많음", isSelected: selectedPeople == "사람 많음") { selectedPeople = "사람 많음"}
                    GridSelectionButton(title: "혼자", isSelected: selectedPeople == "혼자") { selectedPeople = "혼자"}
                    GridSelectionButton(title: "모름", isSelected: selectedPeople == "모름") { selectedPeople = "모름"}

                    NavigationLink(destination: EmergencyTimerView(emergencyType: "119")){
                        Text("119 신고하기")
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.top, 20)
                }
            }
        }
        .padding()
        .navigationTitle("화재 신고")
    }
}