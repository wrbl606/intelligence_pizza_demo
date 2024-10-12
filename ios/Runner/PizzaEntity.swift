import CoreSpotlight
import AppIntents

struct PizzaEntity: AppEntity {
  static var defaultQuery: PizzaQuery = PizzaQuery()
  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Workout")
  
  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(stringLiteral: representation)
  }
  
  let id: String
  let representation: String
}

extension PizzaEntity: IndexedEntity {
  var attributeSet: CSSearchableItemAttributeSet {
    let attributes = CSSearchableItemAttributeSet()
    attributes.displayName = self.representation
    return attributes
  }
}
