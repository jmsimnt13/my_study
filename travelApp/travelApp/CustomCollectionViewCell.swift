//
//  CustomCollectionViewCell.swift
//  travelApp
//
//  Created by Данила on 15.05.2025.
//

import Foundation
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
	let label = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		label.textAlignment = .center
		contentView.addSubview(label)
		label.frame = contentView.bounds
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
