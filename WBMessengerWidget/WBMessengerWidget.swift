//
//  WBMessengerWidget.swift
//  WBMessengerWidget
//
//  Created by Анастасия on 12.06.2024.
//

import WidgetKit
import SwiftUI
import AppIntents

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct WBMessengerWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 2) {
                Image(systemName: "bubble.left.and.bubble.right.fill")
                Text("Unwriten")
            }
            .font(.subheadline)
            .bold()
            .padding(.bottom, 8)
            
            Text("3 chats")
                .font(.caption)
                .bold()
            
            Spacer()
            Text("**Last Update:** \nYou were online 3 hours ago")
                    .font(.caption2)
        }
        .foregroundStyle(.white)
        .padding()
        .containerBackground(for: .widget){
            Color.widgetBackground
        }
        .background(RoundedRectangle(cornerRadius: 16)
            .fill(LinearGradient(
                gradient: Gradient(colors: [.wbDefaultPurple, .wbGradientDarkPurple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )))        
    }
}

struct WBMessengerWidget: Widget {
    let kind: String = "WBMessengerWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WBMessengerWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "💬"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "💬"
        return intent
    }
}

#Preview(as: .systemSmall) {
    WBMessengerWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}

#Preview(as: .systemMedium) {
    WBMessengerWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}

#Preview(as: .systemLarge) {
    WBMessengerWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
