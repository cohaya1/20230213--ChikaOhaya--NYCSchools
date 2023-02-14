//
//  SchoolListIteam.swift
//  SchoolSystem
//
//  Created by Chika Ohaya on 2/13/23.
//
import SwiftUI

struct SchoolListItem: View {
    @State var schoollists: SchoolsDataModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: 353, height: 360)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.08), radius: 25, x: 8, y: 4)
            
            VStack(spacing: 30) {
                Text("\(schoollists.schoolName ?? "")")
                    .font(.system(size: 28, weight: .semibold, design: .rounded)).multilineTextAlignment(.center)
                    .frame(maxWidth: 353, alignment: .center)
                Text("Number of sat take Test Takers:\(schoollists.numOfSatTestTakers ?? "")")
                    .font(.system(size: 18, weight: .semibold, design: .rounded)).multilineTextAlignment(.center)
                    .frame(maxWidth: 353, alignment: .center)
            }
            .padding(.top, 10)
                  .padding(.bottom, 10)
                  .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SchoolListItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SchoolListItem(schoollists: SchoolsDataModel(dbn: "123", schoolName: "Test School", numOfSatTestTakers: "100", satCriticalReadingAvgScore: "200", satMathAvgScore: "300", satWritingAvgScore: "400"))
        }
    }
}
