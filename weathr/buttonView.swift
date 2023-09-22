//
//  buttonView.swift
//  weathr
//
//  Created by MacBook on 22/09/2023.
//

import Foundation
import SwiftUI

struct ButtonView: View {
    var text: String
    var tcol: Color
    
    var body: some View {
        Text(text)
            .frame(width: 350, height: 60)
            .background(Color.white)
            .font(.system(size: 30, weight: .bold, design: .default))
            .foregroundColor(tcol)
            .cornerRadius(10)
    }
}
