//
//  FilterView.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import SwiftUI

// MARK: - Delegate
protocol FilterViewDelegate: AnyObject {
    func didSelectFilter(_ filter: CharacterStatus)
}

// MARK: - View
struct FilterView: View {
    @State private var filters: [CharacterStatus]
    @State private var selectedFilter: CharacterStatus?
    
    weak var delegate: FilterViewDelegate?
    
    init(filters: [CharacterStatus], selectedFilter: CharacterStatus? = nil) {
        self.filters = filters
        self.selectedFilter = selectedFilter
    }

    var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(filters, id: \.self) { filter in
                    Button(action: {
                        selectedFilter = filter
                        delegate?.didSelectFilter(filter)
                    }) {
                        Text(filter.displayName)
                            .padding(8)
                            .foregroundColor(selectedFilter == filter ? Color.white : Color.black)
                            .background(selectedFilter == filter ? Color.black : Color.clear)
                            .cornerRadius(geometry.size.height / 2)
                            .overlay(
                                RoundedRectangle(cornerRadius: geometry.size.height / 2)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(filters: CharacterStatus.allCases, selectedFilter: .alive)
            .previewLayout(.sizeThatFits)
    }
}
