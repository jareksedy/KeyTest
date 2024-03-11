//
//  ContentView.swift
//  KeyTest
//
//  Created by Ярослав Седышев on 11.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false

    var body: some View {
        VStack {
            Spacer()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(uiColor: .systemGray6))
                .onTapGesture {
                    showModal = true
                }
        }
        .onAppear {
            showModal = true
        }
        .sheet(isPresented: $showModal) {
            KeyView(showModal: $showModal)
                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                //.frame(height: 48)
                .presentationDetents([.height(60)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(12)
        }
    }
}
