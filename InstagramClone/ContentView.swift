//
//  ContentView.swift
//  InstagramClone
//
//  Created by Cyboticx LLC on 14/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            HStack {
                Image("logo")
                Spacer()
                HStack(spacing: 14) {
                    Image("add")
                    Image("heart")
                    Image("messenger")
                }
            }.padding(.horizontal, 15).padding(.vertical, 2)
            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
                }.padding(.horizontal, 12)
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
                Image(systemName: "ellipsis")
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
                
//                HStack {
//                    Image("story1").resizable().frame(width: 32, height: 32).aspectRatio(contentMode: .fill).cornerRadius(48)
//                    Spacer()
//                    HStack(spacing: 12) {
//                        Button(action: {
//
//                        }, label: {
//                            Text("😭")
//                        })
//                        Button(action: {
//
//                        }, label: {
//                            Text("😍")
//                        })
//
//                        Button(action: {
//
//                        }, label: {
//                            Image(systemName: "plus.circle").foregroundColor(.secondary)
//                        })
//
//                    }
//                }
            }.padding(.horizontal, 15)
            
        }.padding(.bottom, 6)
    }
}
