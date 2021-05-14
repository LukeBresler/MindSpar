//
//  AppStoreReviewManager.swift
//  MindSpar
//
//  Created by Luke Bresler on 2020/07/02.
//  Copyright © 2021 Luke Bresler. All rights reserved.
//

import StoreKit

enum AppStoreReviewManager {
  static func requestReviewIfAppropriate() {
    SKStoreReviewController.requestReview()
  }
}
