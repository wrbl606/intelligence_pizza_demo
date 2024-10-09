import CoreSpotlight
import AppIntents

struct WorkoutEntity: AppEntity {
  static var defaultQuery: WorkoutQuery = WorkoutQuery()
  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Workout")
  
  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(stringLiteral: representation)
  }
  
  let id: String
  let representation: String
}

extension WorkoutEntity: IndexedEntity {
  var attributeSet: CSSearchableItemAttributeSet {
    let attributes = CSSearchableItemAttributeSet()
    attributes.displayName = self.representation
    return attributes
  }
}
