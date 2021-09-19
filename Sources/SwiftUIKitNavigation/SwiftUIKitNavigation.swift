import SwiftUI



public struct UIKitNavigation<Content: View>: View {
    
    public var body: some View {
        UIKitNavigationImplementation {
            root
        }
        .edgesIgnoringSafeArea(edges)
        .ignoresSafeArea(safeIgnoreRegion, edges: safeIgnoreAreas)
    }
    let edges: Edge.Set
    let safeIgnoreAreas: Edge.Set
    let safeIgnoreRegion: SafeAreaRegions
    let root: Content?
    
    init(_ regions: SafeAreaRegions = .keyboard,
         _ edges: Edge.Set = .all,
         _ safeAreasIgnore: Edge.Set = .all,
         @ViewBuilder content: () -> Content) {
        self.root = content()
        self.safeIgnoreRegion = regions
        self.safeIgnoreAreas = safeAreasIgnore
        self.edges = edges
    }
    
    init(_ regions: SafeAreaRegions = .keyboard,
        edges: Edge.Set = .all,
        safeAreasIgnore: Edge.Set = .all,
        hideAppBar: Bool = false,
        pageTitle: String = "",
         @ViewBuilder content: () -> Content) {
        self.root = content()
        self.safeIgnoreRegion = regions
        self.safeIgnoreAreas = safeAreasIgnore
        self.edges = edges
        NavManager.shared.navController.navigationBar.isHidden = hideAppBar
        NavManager.shared.navController.navigationBar.topItem?.title = pageTitle
    }
}
