// Created by Bryan Keller on 6/7/20.
// Copyright © 2020 Airbnb Inc. All rights reserved.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import HorizonCalendar
import UIKit

// MARK: - DayView

final class DayView: UIView {

    // MARK: Lifecycle

    init(invariantViewProperties: InvariantViewProperties) {
        dayLabel = UILabel()
        dayLabel.backgroundColor = invariantViewProperties.backgroundColor
        dayLabel.font = invariantViewProperties.font
        dayLabel.textAlignment = invariantViewProperties.textAlignment
        dayLabel.textColor = invariantViewProperties.textColor


        profileImageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 35, height: 35))
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.image = #imageLiteral(resourceName: "profile")

        super.init(frame: .zero)

        addSubview(dayLabel)
//        layer.borderColor = invariantViewProperties.selectedColor.cgColor
//        layer.borderWidth = invariantViewProperties.isSelectedStyle ? 2 : 0
        invariantViewProperties.isSelectedStyle ? addSubview(profileImageView) : addSubview(dayLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Internal

    var dayText: String {
        get { dayLabel.text ?? "" }
        set { dayLabel.text = newValue }
    }

    var dayAccessibilityText: String?

    var isHighlighted = false {
        didSet {
            updateHighlightIndicator()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        dayLabel.frame = bounds
        layer.cornerRadius = min(bounds.width, bounds.height) / 2
    }

    // MARK: Private

    private let dayLabel: UILabel
    public var profileImageView: UIImageView

    private func updateHighlightIndicator() {
        backgroundColor = isHighlighted ? UIColor.black.withAlphaComponent(0.1) : .clear
    }

}

// MARK: UIAccessibility

extension DayView {

    override var isAccessibilityElement: Bool {
        get { true }
        set { }
    }

    override var accessibilityLabel: String? {
        get { dayAccessibilityText ?? dayText }
        set { }
    }

}

// MARK: CalendarItemViewRepresentable

extension DayView: CalendarItemViewRepresentable {

    struct InvariantViewProperties: Hashable {
        var font = UIFont.systemFont(ofSize: 18)
        var textAlignment = NSTextAlignment.center
        var textColor: UIColor
        var isSelectedStyle: Bool
        var selectedColor = UIColor.black
        var backgroundColor = UIColor.gray.withAlphaComponent(0.1)

    }

    struct ViewModel: Equatable {
        let dayText: String
        let dayAccessibilityText: String?
    }

    static func makeView(
        withInvariantViewProperties invariantViewProperties: InvariantViewProperties)
    -> DayView
    {
        DayView(invariantViewProperties: invariantViewProperties)
    }

    static func setViewModel(_ viewModel: ViewModel, on view: DayView) {
        view.dayText = viewModel.dayText
        view.dayAccessibilityText = viewModel.dayAccessibilityText
    }

}
