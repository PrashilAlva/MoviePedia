//
//  MPCapsuleView.swift
//  MoviePedia
//
//  Created by Prashil Alva on 11/02/24.
//

import SwiftUI

struct MPCapsuleView: View {
    @State var capsuleValue: String
    
    var body: some View {
        Text(capsuleValue)
            .font(.system(size: 10))
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.accentColor, lineWidth: 2)
            )
    }
}

//#Preview {
//    MPCapsuleView()
//}
