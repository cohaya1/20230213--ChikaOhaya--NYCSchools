//
//  ListOfSchoolsPage.swift
//  SchoolSystem
//
//  Created by Chika Ohaya on 2/13/23.
//
import SwiftUI

struct ListOfSchoolsPage: View {
    @StateObject var viewModel = SchoolListFetcher(service: NetworkManager())
    
    var body: some View {
        // If I had more time I will fix the navigation as it was kind of moving slow when going from DetailsPage back to this page.
        NavigationView {
            ZStack {
                // A rectangle with rounded edges as the background
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(#colorLiteral(red: 0.949999988079071, green: 0.949999988079071, blue: 0.949999988079071, alpha: 1)))
                    .frame(width: 464, height: 956)
                
                VStack {
                    // Horizontal Scroll View for the list of schools
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 45) {
                            // For each school in the list of schools, create a SchoolListItem view and wrap it in a NavigationLink to navigate to the DetailsPage when tapped
                            ForEach(viewModel.schools,  id:\.dbn) { school in
                                NavigationLink(destination: DetailsPage(schools: school), label: {
                                    SchoolListItem(schoollists: school)
                                })
                            }
                        }
                    }
                }
                // Set the background color of the ScrollView
                .background(Color(#colorLiteral(red: 0.949999988079071, green: 0.949999988079071, blue: 0.949999988079071, alpha: 1)))
                // Set the height of the ScrollView
                .frame(height: 300)
                // Add padding to the top of the ScrollView
                .padding(.top, -2)
                // Hide the navigation bar
                .navigationBarHidden(true)
                // Hide the back button in the navigation bar
                .navigationBarBackButtonHidden(true)
            }
            
            // Asynchronously fetch the list of schools
            .task {
                await self.viewModel.getAllSchools()
            }
            // Hide the back button in the navigation bar
            .navigationBarBackButtonHidden(true)
        }
        // Hide the back button in the navigation bar
        .navigationBarBackButtonHidden(true)
    }
}

struct ListOfSchoolsPage_Previews: PreviewProvider {
    static var previews: some View {
        ListOfSchoolsPage()
    }
}
