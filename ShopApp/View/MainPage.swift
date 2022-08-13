//
//  MainPage.swift
//  ShopApp
//
//  Created by Evgeny on 4.12.21.
//

import SwiftUI

struct MainPage: View {
    @State var currentTab: Tab = .Home
    @StateObject var sharedData = SharedDataModel()
    
    @Namespace var animation
    //Hiding tab bar
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                
                Home(animation: animation)
                    .environmentObject(sharedData)
                    .tag(Tab.Home)
                
                LikedPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Liked)
                
                ProfilePage()
                    .tag(Tab.Profile)
                
                CartPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Cart)
            }
            //Custom Tab Bar
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button {
                        currentTab = tab
                    } label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .background(
                                Color("purple")
                                    .opacity(0.15)
                                    .cornerRadius(25)
                                    .blur(radius: 5)
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color("purple") : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal,.bottom])
            .padding(.bottom,5)
        }
        .background(Color("back").ignoresSafeArea())
        .overlay(
            ZStack {
                //Detail Page...
                if let product = sharedData.detailProduct, sharedData.showDetailProduct {
                    ProductDetailView(product: product, animation: animation)
                        .environmentObject(sharedData)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }
        )
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}


enum Tab: String, CaseIterable {
    case Home = "Home"
    case Liked = "Liked"
    case Profile = "Profile"
    case Cart = "Cart"
}
