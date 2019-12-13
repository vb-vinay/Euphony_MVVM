//
//  BorderButton.swift
//  Euphony
//
//  Created by Vinay Bharwani on 10/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI

struct BorderButton: View {
    let text: String
    let systemImageName: String
    let color: Color
    let isOn: Bool
    let action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            HStack(alignment: .center, spacing: 4){
                Image(systemName: systemImageName).foregroundColor(isOn ? .white : color)
                Text(text).foregroundColor(isOn ? .white : color)
            }
        })
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 8)
            .stroke(color, lineWidth: isOn ? 0 : 3)
            .background(isOn ? color : .clear)
            .cornerRadius(8))
        
    }
}

struct BorderButton_Previews: PreviewProvider {
    static var previews: some View {
            BorderButton(text: "Add to wishlist",
                           systemImageName: "film",
                           color: .green,
                           isOn: false,
                           action: {
                            
            })
    }
}
