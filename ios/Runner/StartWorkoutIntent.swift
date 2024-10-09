import AppIntents
import intelligence

struct RewardColleagueIntent: AppIntent {
  static var title: LocalizedStringResource = "Start Workout"
  static var openAppWhenRun: Bool = true
    
  @Parameter(title: "Workout")
  var target: WorkoutEntity
  
  @MainActor
  func perform() async throws -> some IntentResult {
    IntelligencePlugin.notifier.push(target.id)
    return .result()
  }
  
  static var parameterSummary: some ParameterSummary {
    Summary("Begin \(\.$target)")
  }
}


struct AppShortcuts: AppShortcutsProvider {
  static var appShortcuts: [AppShortcut] {
    AppShortcut(
      intent: RewardColleagueIntent(),
      phrases: [
        "Begin \(\.$target) in \(.applicationName)"
      ]
    )
  }
}

