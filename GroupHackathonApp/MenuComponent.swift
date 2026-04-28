//
//  MenuComponent.swift
//  GroupHackathonApp
//
//  Created by Jason on 2026-04-28.
//

import SwiftUI

struct MenuComponent: View {
    var delete: () -> Void
    var edit: () -> Void
    
    var body: some View {
        Menu {
            Button("Delete", action: {
                withAnimation {
                    delete()
                }})
            Button("Edit", action: {})
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 20, height: 40, alignment: .trailing)
                    .foregroundStyle(.appBackground)
                Image(systemName: "ellipsis")
                    .frame(alignment: .center)
                    .foregroundStyle(.black)
                    .rotationEffect(Angle(degrees: 90))
            }
        }
        .padding(.horizontal, 4)
        .frame(alignment: .trailing)
        .fixedSize()
    }
}

#Preview {
    MenuComponent(delete: {}, edit: {})
}
