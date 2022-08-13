//
//  SideMenu.swift
//  LeftMenu
//
//  Created by Evgeny on 19.12.21.
//

import SwiftUI

struct SideMenu: View {
    @Namespace var animation
    @Binding var currentTab: String
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image("me")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
                Text("Evgeny")
                    .font(.title2).bold()
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            //For Small Screens...
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                
                //Tab Buttons...
                VStack(alignment: .leading, spacing: 15) {
                    
                    CustonTabButton(icon: "theatermasks.fill", title: "Home")
                    CustonTabButton(icon: "clock.arrow.circlepath", title: "History")
                    CustonTabButton(icon: "person.fill", title: "Profile")
                    CustonTabButton(icon: "gearshape.fill", title: "Settings")
                    CustonTabButton(icon: "info.circle.fill", title: "About")
                    
                    
                    Spacer()
                    
                    CustonTabButton(icon: "rectangle.portrait.and.arrow.right", title: "Logout")
                }
                .padding()
                .padding(.top,45)
            })
            
            //Max width of screen width
            .frame(width: getRect().width / 2, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.leading,10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color("BG")
        )
    }
    
    @ViewBuilder
    func CustonTabButton(icon: String, title: String) -> some View {
        Button {
            if title == "Logout" {
                print("Logout")
            } else {
                withAnimation {
                    currentTab = title
                }
            }
        } label: {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title3)
                    .frame(width: currentTab == title ? 48 : nil, height: 48)
                    .foregroundColor(currentTab == title ? Color("greeny") : (title == "Logout" ? Color("yellow") : .white))
                    .background(
                        ZStack {
                            if currentTab == title {
                                Color.white
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TABCIRCLE", in: animation)
                            }
                        }
                    )
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .padding(.trailing,21)
            .background(
                ZStack {
                    if currentTab == title {
                        Color("greeny")
                            .clipShape(Capsule())
                            .matchedGeometryEffect(id: "TABCAPSULE", in: animation)
                    }
                }
            )
        }
        .offset(x: currentTab == title ? 15 : 0)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
