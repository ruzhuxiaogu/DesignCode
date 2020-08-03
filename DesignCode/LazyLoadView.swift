//
//  LazyLoadView.swift
//  DesignCode
//
//  Created by tingdongli on 2020/8/3.
//  Copyright © 2020 litingdong. All rights reserved.
//

import SwiftUI


struct SampleRow: View {
    let id: Int
    
    var body: some View {
        Text("Row \(id)")
    }
    
    init(id: Int) {
        print("Loading row \(id)")
        self.id = id
    }
}

struct LazyLoadView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...1000, id: \.self, content: SampleRow.init)
            }
        }
    }
}

struct LazyLoadView_Previews: PreviewProvider {
    static var previews: some View {
        LazyLoadView()
    }
}
