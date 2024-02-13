//
//  MPLaunchView.swift
//  MoviePedia
//
//  Created by Prashil Alva on 07/02/24.
//

import SwiftUI

struct MPLaunchView: View {
    var body: some View {
        VStack(alignment: .leading) {
            if let appIcon = UIImage(named: "AppIcon") {
                Image(uiImage: appIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            } else {
                Image(systemName: "popcorn")
                    .font(.system(size: 100))
            }
        }
    }
}

//#Preview {
//    MPLaunchView()
//}
