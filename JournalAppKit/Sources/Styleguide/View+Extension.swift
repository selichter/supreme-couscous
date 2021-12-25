//
//  File.swift
//  
//
//  Created by Sarah Lichter on 12/24/21.
//

import SwiftUI


extension View {
    @ViewBuilder
    public func center ( _ axis: Axis)-> some View {
        switch axis {
        case .horizontal:
            HStack {
                Spacer()
                self
                Spacer()
            }
        case .vertical:
            VStack {
                Spacer()
                self
                Spacer()
            }
        }
    }
}
