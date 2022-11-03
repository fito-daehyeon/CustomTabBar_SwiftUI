//
//  CustomTabBar.swift
//  AhnLab
//
//  Created by DaeHyeonKim on 2022/11/02.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab : Tab
    @State var yOffset : CGFloat = 0
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            
            
            ZStack(alignment: .leading)
            {
                HStack(spacing: 0){
                    ForEach(Tab.allCases, id :\.rawValue) { tab in
                        Button(action: {
                            if #available(iOS 15.0, *) {
                                withAnimation(.easeOut(duration: 0.2)){
                                    currentTab = tab
                                    yOffset = -70
                                }
                                withAnimation(.easeInOut(duration: 0.1).delay(0.1)){
                                    yOffset = 0
                                }
                                
                            } else {
                                withAnimation(.easeOut(duration: 0.2)){
                                    currentTab = tab
                                    yOffset = 0
                                }
                            }
                            
                            
                        }, label: {
                            Image(tab.rawValue)
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .frame(maxWidth:.infinity)
                                .foregroundColor(currentTab == tab ? Color.purple : .gray)
                                .scaleEffect(currentTab == tab && yOffset != 0 ? 1.5 : 1)
                        })
                    }
                    
                  
                    
                }
                .frame(maxWidth:.infinity)
                
                Image("coin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .offset(x:20,y:yOffset)
                    .opacity(0.7)
                    .offset(x:indicatorOffset(width: width))
            }
            

           
              
            
           
            
        }
        .frame(height:30)
        .padding(.bottom,10)
        .padding([.horizontal,.top])
    }
     
    func indicatorOffset(width: CGFloat)->CGFloat
    {
        let index = CGFloat(getIndex())
        if index == 0 { return 0}
        
        let buttonWidth = width / CGFloat(Tab.allCases.count)
        
        return index * buttonWidth
    }
    
    func getIndex()->Int
    {
        switch currentTab{
        case .wallet: return 0
        case .user : return 1
        case .play : return 2
        case .settings : return 3
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
