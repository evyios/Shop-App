//
//  CustomTabView.swift
//  LeftMenu
//
//  Created by Evgeny on 19.12.21.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var currentTab: String
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack {
            //Static header view for all pages...
            HStack {
                //Menu button...
                Button {
                    //Toggling Menu Option...
                    withAnimation(.spring()) {
                        showMenu = true
                    }
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title.bold())
                        .foregroundColor(.black)

                }
                //Hiding when menu is visible...
                .opacity(showMenu ? 0 : 1)
                
                Spacer()
                
            }
            //Page title...
            .overlay(
                Text(currentTab)
                    .font(.title2.bold())
                    .foregroundColor(.black)
                //Same hiding when menu is visible...
                    .opacity(showMenu ? 0 : 1)
            )
            .padding([.horizontal, .top])
            .padding(.bottom,8)
            .padding(.top,35)
            .background(Color("back"))
            
            TabView(selection: $currentTab) {
                
                MainPage()
                    .tag("Home")
                
                Text("History")
                    .tag("History")
                
                Text("Profile")
                    .tag("Profile")
                
                Text("Settings")
                    .tag("Settings")
                
                Text("About")
                    .tag("About")
                
            }
            
           Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            //Close Button
            Button {
                //Toggling Menu Option...
                withAnimation(.spring()) {
                    showMenu = false
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.title.bold())
                    .foregroundColor(.black)
            }
                .opacity(showMenu ? 1 : 0)
                .padding()
                .padding(.top)
            
            ,alignment: .topLeading
        )
        .background(Color("back")
        )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
