import AppIntents
import intelligence

struct PizzaQuery: EntityQuery {
  func entities(for identifiers: [String]) async throws -> [PizzaEntity] {
    return IntelligencePlugin.storage.get(for: identifiers).map() { item in
      return PizzaEntity(
        id: item.id,
        representation: item.representation
      )
    }
  }
  
  func suggestedEntities() async throws -> [PizzaEntity] {
    return IntelligencePlugin.storage.get().map() { item in
      return PizzaEntity(
        id: item.id,
        representation: item.representation
      )
    }
  }
}

extension PizzaQuery: EnumerableEntityQuery {
  func allEntities() async throws -> [PizzaEntity] {
    return IntelligencePlugin.storage.get().map() { item in
      return PizzaEntity(
        id: item.id,
        representation: item.representation
      )
    }
  }
}

