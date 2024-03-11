//
//  ContentView.swift
//  KeyTest
//
//  Created by Ярослав Седышев on 11.03.2024.
//

import SwiftUI

struct KeyView: View {
    @FocusState private var focused: Bool
    @State private var key = ""
    @Binding var showModal: Bool
    
    var body: some View {
        VStack{
            TextField("Your text here...", text: $key)
                .focused($focused)
                .onKeyPress(characters: .alphanumerics) { press in
                    key += press.characters
                    return .handled
                }
                .onAppear {
                    focused = true
                }
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .onChange(of: focused) {
                    showModal = focused
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
        }
        .padding([.leading, .trailing])
    }
    
    init(showModal: Binding<Bool>) {
        UITextField.appearance().clearButtonMode = .whileEditing
        self._showModal = showModal
    }
}
