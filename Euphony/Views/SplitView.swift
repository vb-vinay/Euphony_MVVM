//
//  SplitView.swift
//  Euphony
//
//  Created by Vinay Bharwani on 09/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI

struct SplitView: View {
    @State var selectedMenu: OutlineMenu = .toplists
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(OutlineMenu.allCases){ menu in
                    ZStack {
                        Text(menu.title)
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 30)
                            .font(.system(size: 20))
                            .padding(.trailing,5)
                        if menu == self.selectedMenu{
                            Rectangle().foregroundColor(Color("gold").opacity(0.9))
                                .frame(height: 50)
                        }
                    }
                    
                }
            }.padding([.leading,.trailing],10)
        }.background(Color.primary.opacity(0.1))

    }
}

struct SplitView_Previews: PreviewProvider {
    static var previews: some View {
        SplitView(selectedMenu: .toplists)
    }
}
