//
//  DraggableCover.swift
//  Euphony
//
//  Created by Vinay Bharwani on 10/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI

struct DraggableCover: View {
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize, predictedLocation: CGPoint)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let data):
                return data.translation
            }
        }
        
        var predictedLocation: CGPoint {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let data):
                return data.predictedLocation
            }
        }
        
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing, .dragging:
                return true
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
    }
    
    enum EndState {
        case left, right, cancelled
    }
    @State private var predictedEndLocation: CGPoint? = nil
    @State private var hasMoved = false
    @State private var delayedIsActive = false
//    @EnvironmentObject private var store: State<AppState>
    @GestureState private var dragState = DragState.inactive
    private let hapticFeedback = UISelectionFeedbackGenerator()
    
    // MARK: - Internal consts
    private let minimumLongPressDuration = 0.01
    private let shadowSize: CGFloat = 4
    private let shadowRadius: CGFloat = 16
    
    // MARK: - Constructor vars
    let movieId: Int
    @Binding var gestureViewState: DragState
    let onTapGesture: () -> Void
    let willEndGesture: (CGSize) -> Void
    let endGestureHandler: (EndState) -> Void
//    private var music: Recommendation{
//
//    }
    var body: some View {
        Text("Hello World!")
    }
}

//struct DraggableCover_Previews: PreviewProvider {
//    static var previews: some View {
//        DraggableCover()
//    }
//}
