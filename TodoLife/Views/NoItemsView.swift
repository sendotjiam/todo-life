//
//  NoItemsView.swift
//  TodoLife
//
//  Created by Sendo Tjiam on 27/08/21.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate : Bool = false
    var secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("What am I gonna do today?")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Let's start the day with productive manner by listing what should I do today")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Let's do something 🤩")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 56)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    }
                )
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.4) : Color.accentColor.opacity(0.4),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: animateView)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func animateView() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
        }
    }
}
