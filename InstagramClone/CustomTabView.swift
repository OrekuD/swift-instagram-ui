//
//  CustomTabView.swift
//  InstagramClone
//
//  Created by Cyboticx LLC on 16/11/2022.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab: Tab;
    
    func getIcon (screen: Tab) -> String {
        switch screen {
        case .home:
            return "house"
        case .search:
            return "search"
        case .reels:
            return "reels"
        case .shop:
            return "shop"
        case .profile:
            return "story1"
        }
    }
    
    func getActiveIcon (screen: Tab) -> String {
        switch screen {
        case .home:
            return "house_filled"
        case .search:
            return "search_filled"
        case .reels:
            return "reels"
        case .shop:
            return "shop"
        case .profile:
            return "story1"
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue){tab in
                    
                    GeometryReader {geo in
                        Button {
                            selectedTab = tab
                        } label: {
                            
                            VStack {
                                if tab == .profile {
                                    Image(getIcon(screen: tab)).resizable().scaledToFit().frame(width: 27, height: 27).cornerRadius(32).overlay {
                                        Circle().stroke(Color.black, lineWidth: selectedTab == tab ? 3 : 0).frame(width: 30, height: 30)
                                    }
                                } else {
                                    Image(selectedTab == tab ? getActiveIcon(screen: tab) : getIcon(screen: tab)).resizable().scaledToFit().frame(width: 23, height: 23)
                                }
                            }.frame(width: geo.size.width, height: 34)
                        }

                    }
                }
            }.padding(.top, 12)
        }.frame(height: 50).background(.white)
    }
}

struct CustomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(selectedTab: .constant(.home))
    }
}
