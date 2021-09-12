//
//  HomePageViewModel.swift
//  MVVM_SwiftUI
//
//  Created by MANOJ SOLANKI on 12/09/21.
//

import Foundation

class HomePageViewModel: ServiceManager, ObservableObject {
    @Published var messages = "Messages inside observable object"
    @Published var apiModels: [APIModel] = []
    
    func changeMessage() {
        messages = "Message change from function."
    }
    
    func fetchAPIList(){
        self.requestServer(
            requestURL: BASE_URL+ENTRIES,
            withParameters: nil) { (response) in
            switch response {
            case .success(let data):
                if let apiListJSON = try? JSONDecoder().decode(APIList.self,from:data) {
                    DispatchQueue.main.async {
                        self.apiModels = apiListJSON.apiModels
                        print(self.apiModels)
                    }
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
