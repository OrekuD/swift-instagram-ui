//
//  HomeView.swift
//  InstagramClone
//
//  Created by Cyboticx LLC on 16/11/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image("logo")
                Spacer()
                HStack(spacing: 14) {
                    Image("add")
                    Image("heart")
                    Image("messenger")
                }
            }.padding(.horizontal, 15).padding(.top, 2).padding(.bottom, 8)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack {
                    Stories()
                    Divider()
                    Post()
                    Post()
                    Post()
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct Story: View {
    var name: String = "Your story";
    var image: String = "story1";
    
    var body: some View {
        
        Button(action: {
            
        }, label: {
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: 58, height: 58)
                    .cornerRadius(58)
                    .overlay(Circle()
                        .stroke(LinearGradient(colors: [.red, .purple, .red, .orange, .yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.4).frame(width: 66, height: 66))
                Text(name).font(.caption).multilineTextAlignment(.center).lineLimit(1).padding(.horizontal, 6).foregroundColor(.primary)
            }.padding(.vertical, 6).padding(.horizontal, 5).frame(width: 78)
        })
    }
}

struct Stories: View {
    var stories: [[String: String]] = [
        ["name": "David", "image": "story1"],
        ["name": "Den", "image": "story2"],
        ["name": "HypeSun_98", "image": "story3"],
        ["name": "KarolBary", "image": "story4"],
        ["name": "Waggles", "image": "story1"],
        ["name": "Chris", "image": "story2"],
    ]
    
    var body: some View {
        VStack {
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(stories, id: \.self) {story in
                        Story(name: story["name"]!, image: story["image"]!)
                    }
                }.padding(.horizontal, 12).padding(.top, 6)
            }
        }
    }
}


struct Post: View {
    @State var isContentSheetOpen: Bool = false;
    
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image("story1").resizable().frame(width: 32, height: 32).aspectRatio(contentMode: .fill).cornerRadius(48)
                    Text("Ruffles").font(.footnote).bold()
                }
                Spacer()
                Button {
                    isContentSheetOpen.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                }.foregroundColor(.black)
                
            }.padding(.horizontal, 15).padding(.top, 2)
            Image("post1").resizable().frame(width: .infinity).aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                HStack {
                    HStack(spacing: 14) {
                        Button(action: {
                            
                        }, label: {
                            Image("heart")
                        })
                        Button(action: {
                            
                        }, label: {
                            Image("message_bubble")
                        })
                        Button(action: {
                            
                        }, label: {
                            Image("write_message")
                        })
                    }
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image("bookmark")
                    })
                }.padding(.top, 2)
                Text("100 likes").font(.footnote).bold().padding(.bottom, 0.5)
                Text("username").font(.caption).bold() + Text(" Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt... ").font(.footnote)
                Text("View all 6 comments").font(.caption).foregroundColor(.secondary).padding(.vertical, 1)
                Text("2 minutes ago").font(.caption2).foregroundColor(.secondary)
            }.padding(.horizontal, 15)
            
        }.padding(.bottom, 6).sheet(isPresented: $isContentSheetOpen) {
            VStack(alignment: .leading, spacing: 0) {
                GeometryReader {proxy in
                    VStack {
                        HStack(spacing: 0) {
                            Button  {
                                print("jdj")
                            } label: {
                                ShareButton(size: (proxy.size.width / 4) - 16, label: "Share", iconName: "square.and.arrow.up")
                            }.frame(width: proxy.size.width / 4)
                            
                            Button  {
                                print("jdj")
                            } label: {
                                ShareButton(size: (proxy.size.width / 4) - 16, label: "Link", iconName: "link")
                            }.frame(width: proxy.size.width / 4)
                            
                            Button  {
                                print("jdj")
                            } label: {
                                ShareButton(size: (proxy.size.width / 4) - 16, label: "Save", iconName: "bookmark")
                            }.frame(width: proxy.size.width / 4)
                            
                            Button  {
                                print("jdj")
                            } label: {
                                ShareButton(size: (proxy.size.width / 4) - 16, label: "QR Code", iconName: "qrcode.viewfinder")
                            }.frame(width: proxy.size.width / 4)
                            
                        }.frame(width: .infinity, height: proxy.size.width / 4).padding(.bottom, 4)
                        
                        VStack(spacing: 0) {
                            Button {
                                
                            } label: {
                                ShareRowButton(width: proxy.size.width - 16, label: "Add to Favourites", iconName: "star")
                            }.foregroundColor(.black)
                            Divider()
                            Button {
                                
                            } label: {
                                ShareRowButton(width: proxy.size.width - 16, label: "Unfollow", iconName: "person")
                            }.foregroundColor(.black)
                        }.background(Color(uiColor: .secondarySystemBackground)).cornerRadius(12)
                        VStack {
                            
                        }.frame(height: 6)
                        VStack(spacing: 0) {
                            Button {
                                
                            } label: {
                                ShareRowButton(width: proxy.size.width - 16, label: "Why you're seeing this post", iconName: "info.circle")
                            }.foregroundColor(.black)
                            Divider()
                            Button {
                                
                            } label: {
                                ShareRowButton(width: proxy.size.width - 16, label: "Hide", iconName: "eye.slash")
                            }.foregroundColor(.black)
                            Divider()
                            Button {
                                
                            } label: {
                                ShareRowButton(width: proxy.size.width - 16, label: "Report", iconName: "info.bubble")
                            }.foregroundColor(.red)
                        }.background(Color(uiColor: .secondarySystemBackground)).cornerRadius(12)
                    }
                }
                
            }.padding(.horizontal, 16).padding(.top, 34).presentationDetents([.medium]).presentationDragIndicator(.visible)
        }
    }
}

struct ShareButton: View {
    var size: CGFloat = (370 / 4 - 20)
    var label: String = "link"
    var iconName: String = "link"
    
    var body: some View {
        VStack {
            Image(systemName: iconName).foregroundColor(Color.black).font(.title)
            Text(label).font(.caption).foregroundColor(Color.black).padding(.top, 2)
        }.frame(width:size, height: size)
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadius(12)
    }
}


struct ShareRowButton: View {
    var width: CGFloat = (370 / 4 - 20)
    var label: String = "link"
    var iconName: String = "link"
    
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: iconName).font(.title2)
            Text(label).padding(.leading, 14)
            Spacer()
        }.background(Color(uiColor: .secondarySystemBackground)).padding(.vertical, 12).padding(.horizontal, 16).frame(width: width)
    }
}
