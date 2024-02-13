//
//  MPNetworkErrorView.swift
//  MoviePedia
//
//  Created by Prashil Alva on 13/02/24.
//

import SwiftUI

struct MPNetworkErrorView: View {
    @Binding var isReloadRequested: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Image(systemName: "network.slash")
                    .font(.largeTitle)
                    .padding(.bottom)
                Text("Unable to Retrieve Details.")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)
                Text("This Could be Issue from Our End or your Internet Connection. As a Quick Troubleshooting, Please Check your Internet Connection and Try Again. If this doesn't work, Dont Worry! We will fix this as soon as Possible.")
            }
            .foregroundColor(.secondary)
            Button("Try Again") {
                self.isReloadRequested = true
            }
            .padding(.top)
            Spacer()
        }
        .padding()
    }
}

//#Preview {
//    MPNetworkErrorView()
//}
