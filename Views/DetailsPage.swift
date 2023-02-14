//
//  DetailsPage.swift
//  SchoolSystem
//
//  Created by Chika Ohaya on 2/14/23.
//


import SwiftUI

struct DetailsPage: View {
    let schools:SchoolsDataModel
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background rectangle with rounded corners
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(#colorLiteral(red: 0.949999988079071, green: 0.949999988079071, blue: 0.949999988079071, alpha: 1)))
                    .frame(width: 464, height: 956)
                
                // Horizontal stack containing the back arrow icon and heart icon
                HStack(spacing: 290){
                    backarrowicon
                        .padding(.trailing, 280)
                    
                }.padding(.bottom,740)
                
                //  plate
                VStack{
                   plate
                }.padding(.bottom,460)
                
                // Vertical stack containing the school name, reading scores, and math scores
                VStack(spacing: 30) {
                    schoolname
                    readingscores
                    mathscores
                    writingscores
                    
                }.padding(.top,70)
                
                
            }
                
        }.navigationBarBackButtonHidden(true)
            .padding(.top, 10)
            .padding(.bottom, 10)
            .edgesIgnoringSafeArea(.all)
    }
    
    // Back arrow icon
    var backarrowicon: some View {
        NavigationLink(destination: ListOfSchoolsPage(), label: {
            Image("backarrowicon")
                .resizable()
                .frame(width: 15, height: 24)
                .scaledToFit()
        })
    }
    
    // Dinner plate image
    var plate: some View {
        ZStack {
            
            Circle()
                .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .opacity(0.89)
            
            
            Circle()
                .strokeBorder(Color(#colorLiteral(red: 0.949999988079071, green: 0.949999988079071, blue: 0.949999988079071, alpha: 0.25)), lineWidth: 1)
            
        }
        .compositingGroup()
        .frame(width: 261.21, height: 231.21)
        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0,alpha:1)), radius:4, x:0, y:4)
    }
    
    // School name text
    var schoolname: some View {
        Text(schools.schoolName ?? "").font(.system(size: 28, weight: .semibold, design: .rounded)).multilineTextAlignment(.center)
            .frame(maxWidth: 353, alignment: .center)
    }
    
    // Reading scores text
    var readingscores: some View {
        
        Text(schools.satCriticalReadingAvgScore ?? " ").font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(Color(#colorLiteral(red: 0.98, green:
 0.29, blue: 0.05, alpha: 1))).multilineTextAlignment(.center)
    }
    // Math test scrores
    var mathscores: some View {
        VStack(spacing:10){
            
            Text(schools.satMathAvgScore ?? " ").font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(Color(#colorLiteral(red: 0.98, green:
                                                                                                                                                0.29, blue: 0.05, alpha: 1))).multilineTextAlignment(.center)
        }
    }
    // writing test scores 
    var writingscores: some View {
        VStack(spacing:10){
            
            
            Text(schools.satWritingAvgScore ?? "" ).font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(Color(#colorLiteral(red: 0.98, green:
                                                                                                                                                    0.29, blue: 0.05, alpha: 1))).multilineTextAlignment(.center)
        }
    }
}

struct DetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPage(schools: SchoolsDataModel(dbn: "123", schoolName: "Test School", numOfSatTestTakers: "100", satCriticalReadingAvgScore: "200", satMathAvgScore: "300", satWritingAvgScore: "400"))
    }
}
