//
//  LocationView.swift
//  InstagramClone
//
//  Created by Cyboticx LLC on 21/11/2022.
//

import SwiftUI

struct LocationView: View {
    @State var isBottomSheetVisible: Bool = true;
    
    var body: some View {
        VStack {
            Text("jjd")
        }.sheet(isPresented: $isBottomSheetVisible) {
            VStack {
                Text("Ridge")
            }.presentationDetents([.fraction(0.2), .fraction(0.5), .fraction(1)])
        }.navigationBarBackButtonHidden(false)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

