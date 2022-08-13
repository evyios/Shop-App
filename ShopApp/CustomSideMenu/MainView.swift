//
//  MainView.swift
//  LeftMenu
//
//  Created by Evgeny on 19.12.21.
//

import SwiftUI

struct MainView: View {
    
    @State var currentTab: String = "Home"
    
    @State var showMenu: Bool = false
    
    //Hidden native tab bar...
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack {
            // Custom Side Menu...
            SideMenu(currentTab: $currentTab)
            
            ZStack {
                //Two background Cards
                Color.white
                    .opacity(0.5)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -37 : 0)
                    .padding(.vertical,30)
                
                Color.white
                    .opacity(0.4)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -60 : 0)
                    .padding(.vertical,60)
                
               
            }
            //Scaling and Moving Menu
                .scaleEffect(showMenu ? 0.84 : 1)
                .offset(x: showMenu ? getRect().width - 120 : 0)
                .ignoresSafeArea()
                           
            CustomTabView(currentTab: $currentTab, showMenu: $showMenu)
                .cornerRadius(showMenu ? 25 : 0)

                .scaleEffect(showMenu ? 0.84 : 1)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        showMenu = false
                    }
                }
            
                .offset(x: showMenu ? getRect().width / 1.5 : 0)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


