//
//  OnBoardingScreen.swift
//  ShopApp
//
//  Created by Evgeny on 1.12.21.
//

import SwiftUI

//To use custom font on all pages
let customFont = "Raleway-Regular"

struct OnBoardingScreen: View {
 
    @State var showLoginPage: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Find your\nWine")
                .font(.custom(customFont, size: 55))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Image("vine")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Button {
                withAnimation {
                    showLoginPage = true
                }
            } label: {
                Text("Get started")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical,18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("purple"))
            }
            .padding(.horizontal,30)
            
            
            Spacer()
        }
        .padding()
        .padding(.top, getRect().height < 750 ? 20 : 0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("purple")
        )
        .overlay(
            Group {
                if showLoginPage {
                    LoginPade()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen()
    }
}


//Extending View to get screen size
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
