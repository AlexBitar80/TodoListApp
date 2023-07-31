//
//  HeaderView.swift
//  TodoListApp
//
//  Created by João Alexandre Bitar on 31/07/23.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String
    var subTitle: String
    var angle: Double
    var backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                    .foregroundColor(Color.white)
                
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Hello",
                   subTitle: "World",
                   angle: 15,
                   backgroundColor: .blue)
    
    }
}
