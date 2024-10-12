import AppIntents
import intelligence

struct OrderPizzaIntent: AppIntent {
  static var title: LocalizedStringResource = "Order Pizza"
  static var openAppWhenRun: Bool = true
    
  @Parameter(title: "Pizza")
  var target: PizzaEntity
  
  @MainActor
  func perform() async throws -> some IntentResult {
    IntelligencePlugin.notifier.push(target.id)
    return .result()
  }
  
  static var parameterSummary: some ParameterSummary {
    Summary("Order \(\.$target)")
  }
}


struct AppShortcuts: AppShortcutsProvider {
  static var appShortcuts: [AppShortcut] {
    AppShortcut(
      intent: OrderPizzaIntent(),
      phrases: [
        "Order \(\.$target) in \(.applicationName)"
      ]
    )
  }
}

