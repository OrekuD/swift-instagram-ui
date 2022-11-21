//
//  SearchView.swift
//  InstagramClone
//
//  Created by Cyboticx LLC on 16/11/2022.
//

import SwiftUI

struct SearchView: View {
    @State var searchQuery: String = ""
    
    var body: some View {
        GeometryReader {proxy in
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    HStack {
                        Image("search").resizable().scaledToFit().frame(width: 18, height: 18)
                        TextField("Search", text: $searchQuery)
                    }.frame(width: getRect().width - 100).padding(.vertical, 12).padding(.horizontal, 16).background(Color(uiColor: .secondarySystemBackground)).cornerRadius(12)
                    NavigationLink(destination: LocationView()) {
                        Image(systemName: "location").foregroundColor(.black).font(.title2)
                    }
                }.frame(width: getRect().width).padding(.horizontal, 16)
                Spacer()
            }.padding(.top, 8).frame(width: getRect().width)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

extension View {
    func getRect () -> CGSize {
        return UIScreen.main.bounds.size
    }
}

