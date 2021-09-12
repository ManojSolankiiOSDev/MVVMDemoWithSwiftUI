//
//  ContentView.swift
//  MVVM_SwiftUI
//
//  Created by MANOJ SOLANKI on 12/09/21.
//

import SwiftUI

struct HomePageView: View {
    
    @ObservedObject var objModel = HomePageViewModel()
    
    var body: some View {
        NavigationView{
            List(objModel.apiModels) { api in
                VStack(alignment: .leading){
                    Text(api.API)
                        .font(.title)
                    Text(api.Category)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("MVVM Practice")
            .navigationBarItems(trailing: Button(action: {
                print("Fething Animals data from API")
                self.objModel.fetchAPIList()
            }, label: {
                Text("Fetch Animals")
            }))
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

