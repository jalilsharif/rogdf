# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

rogdf_version <- function() {
    .Call('_OGDF_rogdf_version', PACKAGE = 'OGDF')
}

L_circular <- function(graph, minDistCircle = 20, minDistLevel = 20, minDistSibling = 10, minDistCC = 20, pageRatio = 1) {
    .Call('_OGDF_rogdf_circular_layout', PACKAGE = 'OGDF', graph, minDistCircle, minDistLevel, minDistSibling, minDistCC, pageRatio)
}

L_tree <- function(graph, siblingDistance = 20, subtreeDistance = 20, levelDistance = 50, treeDistance = 50, orthogonalLayout = FALSE, orientation, selectRoot) {
    .Call('_OGDF_rogdf_tree_layout', PACKAGE = 'OGDF', graph, siblingDistance, subtreeDistance, levelDistance, treeDistance, orthogonalLayout, orientation, selectRoot)
}

L_fmmm <- function(graph, options) {
    .Call('_OGDF_rogdf_fmmm_layout', PACKAGE = 'OGDF', graph, options)
}

