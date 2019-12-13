//
//  CategoryList.swift
//  Euphony
//
//  Created by Vinay Bharwani on 02/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//
//
import SwiftUI

struct CategoryList: View {
    let category: Categories
    var body: some View {
            VStack {
                HStack{
                    Text("Categories").underline().bold()
                    Spacer()
                    Text("category_id").underline().bold()
                }
                List(0..<category.categories.items.count){ item in
                    Text(self.category.categories.items[item].name)
                    Spacer()
                    Text(self.category.categories.items[item].id)
                }
            }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList(category: categories)
    }
}
