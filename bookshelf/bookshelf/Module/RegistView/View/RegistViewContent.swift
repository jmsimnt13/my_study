//
//  RegistViewContent.swift
//  bookshelf
//
//  Created by Данила on 24.04.2025.
//

import SwiftUI

struct RegistViewContent: View {
	@State private var nameField: String = ""
	var btnAction: (String) -> Void
	var body: some View {
		ZStack {
			VStack {
				Text("Добро пожаловать")
					.font(type: .black, size: 22)
					.foregroundStyle(.white)
				Spacer()
				TextField("Ваше имя", text: $nameField)
					.frame(maxWidth: .infinity)
					.frame(height: 52)
					.padding(.horizontal, 10)
					.background(.appDark)
					.foregroundStyle(.white)
					.clipShape(.rect(cornerRadius: 10))
				Spacer()
				OrangeButton(title: "Далее") {
					btnAction(nameField)
				}
			}
			.padding(.horizontal, 30)
		}
		.background(.bgMain)
	}
}


