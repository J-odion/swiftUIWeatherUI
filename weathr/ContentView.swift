//
//  ContentView.swift weathr Created by MacBook on 21/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack{
            BackView(top:isNight ?  .pink : .gray, bottom: isNight ? .red : .black)
            VStack(spacing: 50) {
                titleView(textV: "Singapore")
                DayView( day: "", image: isNight ? "cloud.sun.fill" : "cloud.moon.fill", width: 180, height: 180, fsiz: 60, weight: .bold, space: 30, temp: 40, textcol: .white)
                HStack(alignment: .center, spacing: 20){
                    Days(day: "Mon", imgName: "cloud.rain.fill", temp: 24)
                    Days(day: "Tue", imgName: "cloud.sun.fill", temp: 54)
                    Days(day: "Wed", imgName: "cloud.moon.fill", temp: 34)
                    Days(day: "Thu", imgName: "wind.snow", temp: 64)
                    Days(day: "Fri", imgName: "cloud.sun.fill", temp: 94)
                }
                Spacer()
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    ButtonView(text: "Change time of Day", tcol: isNight ? .red : .black)
                }
                Spacer()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Days: View {
    var day: String
    var imgName: String
    var temp: Int
    var body: some View {
        VStack{
            Text(day)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.white)
            Image(systemName: imgName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            Text("\(temp)°")
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
    }
}
struct BackView: View {
    var top: Color
    var bottom: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ top, bottom]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}
struct DayView: View {
    var day: String
    var image: String
    var width: CGFloat
    var height: CGFloat
    var fsiz: Int
    var weight: Font.Weight
    var space: CGFloat
    var temp: Int
    var textcol: Color
    var body: some View {
        VStack(spacing: space){
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
            Text("\(temp)°")
                .font(.system(size: 32, weight: weight, design: .default))
                .foregroundColor(textcol)
        }
    }
}
struct titleView: View {
    var textV: String
    var body: some View {
        Text(textV)
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundColor(.white)
            .padding(.top,20)
    }
}
