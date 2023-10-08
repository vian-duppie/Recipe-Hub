//
//  SplashView.swift
//  Recipe Hub
//
//  Created by Vian du Plessis on 2023/10/04.
//

import SwiftUI

struct SplashView: View {
    @State var animateShape = false
    @State var animateImage = false
    @State var animateButton = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("PrimaryRed"))
                        .frame(width: geometry.size.width, height: 50)
                        .offset(x: animateShape ? 0 : geometry.size.width)
                       
                    
                    Image("SplashViewImage")
                        .offset(x: animateImage ? 0 : geometry.size.width / 2)
                       
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Recipe Hub")
                    // TODO: Add colour
                        .font(.custom("Poppins-SemiBold", size: 48))
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Text("Recipes Made Easy, Meals Made Memorable")
                    // TODO: Add colour
                        .font(.custom("Poppins-Medium", size: 17))
                }
                .padding(.horizontal, 35)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                HStack {
                    HStack {
                        Text("let's go")
                        //TODO: Add colour
                            .font(.custom("Poppins-Medium", size: 16))
                   
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                        // TODO: Add colour
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 5)
                    .frame(maxWidth: geometry.size.width/2, minHeight: 50)
                    .background(.red)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 10,
                            bottomLeadingRadius: 10,
                            style: .continuous
                        )
                    )
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .offset(x: animateButton ? 0 : geometry.size.width)
                
                Spacer()
                    .frame(height: 50)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            withAnimation(.interpolatingSpring(mass: 0.5, stiffness: 12, damping: 3, initialVelocity: 2)) {
                animateImage = true
                animateButton = true
            }
            
            withAnimation(.easeInOut(duration: 0.5)) {
                animateShape = true
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
