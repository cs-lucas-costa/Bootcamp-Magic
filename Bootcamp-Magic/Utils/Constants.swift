//
//  Constants.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 16/02/21.
//

import UIKit

struct Constants {
  struct Images {
    static let rightChevron = UIImage(named: "right-chevron")
    static let backgroundImage = UIImage(named: "background-image")
  }

  struct ExpasionTableViewCell {
    static let identifier = "ExpasionTableViewCellIdentifier"
  }
  
  struct FontSize {
    static let `default` = CGFloat(18)
  }
  
  struct Margin {
    struct Expasion {
      static let horizontalMargin = CGFloat(16)
      static let verticalMargin = CGFloat(5)
    }
  }
  
  struct String {
    struct Expansion {
      static let navigationTitle = "Expansion"
    }
  }
}
