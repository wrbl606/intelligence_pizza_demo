import AppIntents
import intelligence

struct WorkoutQuery: EntityQuery {
  func entities(for identifiers: [String]) async throws -> [WorkoutEntity] {
    return IntelligencePlugin.storage.get(for: identifiers).map() { item in
      return WorkoutEntity(
        id: item.id,
        representation: item.representation
      )
    }
  }
  
  func suggestedEntities() async throws -> [WorkoutEntity] {
    return IntelligencePlugin.storage.get().map() { item in
      return WorkoutEntity(
        id: item.id,
        representation: item.representation
      )
    }
  }
}

extension WorkoutQuery: EnumerableEntityQuery {
  func allEntities() async throws -> [WorkoutEntity] {
    return IntelligencePlugin.storage.get().map() { item in
      return WorkoutEntity(
        id: item.id,
        representation: item.representation
      )
    }
  }
}

