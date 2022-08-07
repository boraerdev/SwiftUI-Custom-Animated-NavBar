//
//  ContentView.swift
//  customTabBar
//
//  Created by Bora Erdem on 7.08.2022.
//

import SwiftUI

struct ContentView: View {
    var images : [String] = ["house","magnifyingglass","plus","person","loupe"]
    @State var selected = "house"
    @Namespace private var namespace
    var body: some View {
        ZStack{
            //Switch Content Here
            navBar
        }.edgesIgnoringSafeArea(.bottom)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            
    }
}

struct Wave: Shape {
    func path(in rect: CGRect) -> Path {
        Path{path in
            path.move(to: .zero)
            path.addQuadCurve(to: CGPoint(x: rect.width * 0.4, y: rect.height * 0.7),
                              control: CGPoint(x: rect.width * 0.2, y: rect.minY))
            path.addQuadCurve(to: CGPoint(x: rect.width * 0.6, y: rect.height * 0.7),
                              control: CGPoint(x: rect.midX, y: rect.maxY))
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY),
                              control: CGPoint(x: rect.width * 0.8, y: rect.minY))
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))

        }
        
    }
}

extension ContentView{
    private var navBar: some View {
        VStack{
            Spacer()
            HStack(){
                HStack{
                    ForEach(images, id: \.self) { iconName in
                        if selected == iconName {
                            ZStack{
                                Wave()
                                    .fill(.background)
                                    .frame(width: 80, height: 20)
                                    //.border(.orange, width: 1)
                                    .scaleEffect(2)
                                    .offset(y:-10)
                                    .matchedGeometryEffect(id: "let1", in: namespace)
                                Image(systemName: selected)
                                    .font(.title3.bold())
                                    .foregroundColor(.primary)
                                    .padding(.horizontal,40)
                                    .offset(y:-30)
                                    .matchedGeometryEffect(id: "let2", in: namespace)
                                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
                                
                            }
                        }else {
                            Image(systemName: iconName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                                .padding(20)
                                .onTapGesture {
                                    withAnimation {
                                        self.selected = iconName
                                    }
                                }
                        }
                        
                    }
                }
                .padding(.bottom,30)
                .frame(maxWidth: .infinity)
                .background(
                    .black
                )

            }
        }
    }
}
