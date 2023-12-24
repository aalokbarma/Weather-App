//
//  WeatherButton.swift
//  SwiftWeatherApp
//
//  Created by Aalok Barma on 22/09/23.
//

import SwiftUI

struct WeatherButton : View{
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View{
        Text(title)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .semibold))
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .cornerRadius(10)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Change Day Time", textColor: Color.white, backgroundColor: Color("buttonTintColor"))
    }
}
