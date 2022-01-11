//
//  CardView.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 10/01/2022.
//

import SwiftUI
import Kingfisher

struct CardView: View {
    var item: Item
    static let baseImageString = "https://live.staticflickr.com/"

    var body: some View {
        VStack {
            KFImage(URL(string: CardView.baseImageString+item.server+"/"+item.id+"_"+item.secret+"_w.png")!)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.orange, lineWidth: 4))
                .shadow(radius: 10)
            Text(item.title)
                .font(.title2)
                .lineLimit(2)
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: CardView {
        let item1 = Item(id: "1", owner: "", secret: "", server: "", farm: 1, title: "Hello One", isPublic: 1, isFriend: 0, isFamily: 0)
        CardView(item: item1)
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
