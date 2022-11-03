//
//  MainView.swift
//  AhnLab
//
//  Created by DaeHyeonKim on 2022/11/02.
//

import SwiftUI

struct MainView: View {
    @State var currentTab: Tab = .wallet
    @State var navigationTitle = ""
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        NavigationView{
            VStack(spacing:0){
                
                TabView(selection: $currentTab){
                    WalletView()
                        .tag(Tab.wallet)
                        .navigationBarHidden(currentTab.getTitleBarHidden())
                    
                    Text("User")
                        .applyBG()
                        .tag(Tab.user)
                        .animation(.none)
                        
                    Text("Play")
                        .applyBG()
                        .tag(Tab.play)
                        
                    Text("Settings")
                        .applyBG()
                        .tag(Tab.settings)
                       
                }
                
                CustomTabBar(currentTab: $currentTab)
            }
            .navigationBarTitle(currentTab.getTitle(), displayMode: .inline)
            //.navigationBarHidden(currentTab.getTitleBarHidden())
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension View
{
    func applyBG()->some View
    {
        self
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(Color.secondary.opacity(0.3))
           
    }
}
