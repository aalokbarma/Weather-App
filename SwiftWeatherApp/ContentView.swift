//
//  ContentView.swift
//  SwiftWeatherApp
//
//  Created by Aalok Barma on 21/09/23.
//

import SwiftUI
import CoreData
import Foundation

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Kolkata, India")
                MainWeather(weatherImage: isNight ? "cloud.moon.fill": "cloud.sun.fill",
                            temperature: 76)
                .padding(.bottom, 50)
                HStack{
                    DayWeatherView(dayOfWeek: "Mon",
                                   image: isNight ? "cloud.moon.fill": "cloud.bolt.fill",
                                   temperature: 76)
                    DayWeatherView(dayOfWeek: "Tue",
                                   image: isNight ? "moon.stars.fill": "sun.max.fill",
                                   temperature: 79)
                    DayWeatherView(dayOfWeek: "Wed",
                                   image: isNight ? "cloud.moon.bolt.fill" : "cloud.bolt.rain.fill",
                                   temperature: 82)
                    DayWeatherView(dayOfWeek: "Thu",
                                   image: isNight ? "cloud.moon.rain.fill" : "cloud.sun.rain.fill",
                                   temperature: 78)
                    DayWeatherView(dayOfWeek: "Fri",
                                   image: isNight ? "cloud.moon.bolt.fill" : "cloud.sun.bolt.fill",
                                   temperature: 82)
                }
                .padding(.bottom, 50)
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: Color.white, backgroundColor: Color("buttonTintColor"))
                }
                
                .padding(.bottom, 50)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


struct DayWeatherView : View{
    var dayOfWeek: String
    var image: String
    var temperature: Int
    var body: some View{
        VStack (spacing: 15) {
            Text(dayOfWeek)
                .font(.system(size: 25, weight: .semibold, design: .default))
                .foregroundColor(.white)
            Image(systemName: image)
                .symbolRenderingMode(.multicolor)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
            
            Text("\(temperature)°")
                .font(.system(size: 25, weight: .semibold, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? Color("darkGray") : .cyan,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 35, weight: .bold, design: .default))
            .foregroundColor(.white)
            .padding(.top, 25)
    }
}


struct MainWeather : View {
    var weatherImage: String
    var temperature: Int
    var body: some View{
        VStack (spacing: 8){
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            Text("\(temperature)°")
                .font(.system(size: 45, weight: .semibold, design: .default))
                .foregroundColor(.white)
        }
    }
}


