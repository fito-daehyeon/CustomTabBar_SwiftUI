//
//  WalletView.swift
//  AhnLab
//
//  Created by DaeHyeonKim on 2022/11/03.
//

import SwiftUI

struct WalletView: View {
   
    @State var color : Coin = .bitcoin
    var body: some View {
        VStack{
            
            //헤더
            WalletViewTitle()
            
            //카드
            AccountCard()
            
            //자산목록
            AssetsList()
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(Color.black)
        .animation(.none)
    
    }
    
    //헤더
    func WalletViewTitle()->some View{
        //Title Bar
        HStack{
            
            Text("Ethereum Mainnet")
                .bold()
                .padding()
               
            Spacer(minLength: 0)
            
            Button(action: {
                
            }, label: {
                Image(systemName: "chevron.down")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                   
            })
           
        }
        .padding(.horizontal,20)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [color.getCoinColor().opacity(0.4), color.getCoinColor()]),
                                   startPoint: .leading, endPoint: .trailing))
    }
    
    //카드
    func AccountCard()->some View{
        ZStack()
        {
        
            HStack
            {
                Spacer()
                RoundedRectangle(cornerRadius: 18)
                    .fill(LinearGradient(gradient: Gradient(colors: [color.getCoinColor().opacity(0.4), color.getCoinColor()]),
                                         startPoint: .leading, endPoint: .trailing))
                    .frame(maxWidth:370,maxHeight: 200)
                    .padding(.trailing,-20)
            }
           
            ZStack(alignment: .bottom)
            {
                
                BlurView(style: .systemChromeMaterialDark)
                    .frame(maxWidth:370,maxHeight: 200)
                    .cornerRadius(18)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(.gray, lineWidth: 1)
                    )
                
                VStack(spacing:0)
                {
                    HStack
                    {
                        Image("AhnLab")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            
                        Text("Account 044")
                        Spacer()
                        
                        Image("Settings")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 23, height: 23)
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .top)
                    {
                        Spacer()
                        Text("KRW")
                            .font(.system(size: 15, weight: .bold))
                        Text("15,506,300")
                            .font(.system(size: 30, weight: .bold))
                            .offset(y:-5)
                            
                    }
                    
                    HStack
                    {
                        Spacer()
                        Text("asdqweasdjklzxasdjkl123asd12Qasd")
                            .font(.system(size: 15))
                        Image(systemName: "doc.on.doc.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                    .padding(.bottom,15)
                    
                }
                .padding([.vertical,.horizontal],20)
                .frame(maxWidth:370,maxHeight: 200)
                
                HStack
                {
                    Spacer()
                    Text("자산추가")
                    Image(systemName: "chevron.right")
                }
                .offset(y:30)
                .padding(.trailing,45)
                
                
                  
            }
            .foregroundColor(.white)
            .offset(y: -50)
            
            
            
            
                
        }
        .padding(.top,80)
       
    }
    
    //자산목록
    func AssetsList()->some View{
        VStack(alignment: .leading,spacing: 0){
            
            Text("자산목록")
                .bold()
                .foregroundColor(.white)
                .padding(.bottom,15)
            
            Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [3]))
                .frame(height: 1)
                .foregroundColor(.white)
                
            
            ScrollView{
                VStack
                {
                    ForEach(Coin.allCases,id: \.self){ coin in
                        
                        Button(action: {
                            color = coin
                        }, label: {
                            HStack(spacing:15)
                            {
                                Image(coin.rawValue)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                
                                VStack(alignment: .leading,spacing: 5)
                                {
                                    Text(coin.rawValue)
                                    
                                    Text(coin.getCoinPrice())
                                }
                                .foregroundColor(.white)
                                .font(.system(size: 13))
                                
                                Spacer()
                            }
                            .padding(.vertical,10)
                        })
                        
                       
                    }
                }
                .padding(.top,15)
               
                
                
            }
            
        }
        .padding(.horizontal,20)
        .padding(.top,20)
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
