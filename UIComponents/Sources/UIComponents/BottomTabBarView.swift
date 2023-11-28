//
//  BottomTabBarView.swift
//  Knektu
//
//  Created by Helia on 10/14/23.
//

import Foundation
import SwiftUI

struct BottomTabBarView: View {
    @ObservedObject var viewModel: BottomTabViewModel

    var body: some View {
        HStack(spacing: 0) {
            ForEach(viewModel.navItems.indices, id: \.self) { index in
                if index == viewModel.navItems.count / 2 {
                    MiddleBarButton(item: viewModel.navItems[index])
                } else {
                    BottomBarButton(item: viewModel.navItems[index])
                }
            }
        }
        .frame(height: 50)
        .padding(.bottom, 10)
        .background(
            TopRoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .shadow(color: .gray, radius: 4, x: 0, y: -2)
        )
        .padding(.horizontal, 15)
    }
}


struct MiddleBarButton: View {
    var item: BottomTabBarModel

    var body: some View {
        VStack {
            Image(item.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding(12)
                .background(Color.orange)
                .clipShape(Circle())
                .offset(y: -20)
            Text(item.title)
                .font(.system(size: 12))
        }
        .frame(maxWidth: .infinity)
    }
}

struct BottomBarButton: View {
    var item: BottomTabBarModel

    var body: some View {
        VStack {
            Image(item.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .padding(.bottom, 2)
            Text(item.title)
                .font(.system(size: 10))
        }
        .frame(maxWidth: .infinity)
    }
}


struct TopRoundedRectangle: Shape {
    var cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: cornerRadius))
        path.addQuadCurve(to: CGPoint(x: cornerRadius, y: 0), control: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width - cornerRadius, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.width, y: cornerRadius), control: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}


struct ExampleBottomTabBarView: View {
    @StateObject var viewModel = BottomTabViewModel()

    var body: some View {
        VStack {
            Spacer()
            BottomTabBarView(viewModel: viewModel)
        }
        .onAppear {
            viewModel.navItems = [
                BottomTabBarModel(title: "Find Tutor", icon: "FindTotur"),
                BottomTabBarModel(title: "Cohorts", icon: "Cohorts"),
                BottomTabBarModel(title: "", icon: "Middle"),
                BottomTabBarModel(title: "Lessons", icon: "Lessons"),
                BottomTabBarModel(title: "More", icon: "More")
            ]
        }
    }
}

struct ExampleBottomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleBottomTabBarView()
    }
}
