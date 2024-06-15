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
        SimpleEntry(date: Date(), contactCount: 0, lastExitDate: nil, configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        let count = DataManager.shared.loadContactCount()
        let lastExitDate = DataManager.shared.loadLastExitDate()
        return SimpleEntry(date: Date(), contactCount: count, lastExitDate: lastExitDate, configuration: configuration)
    }

    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let count = DataManager.shared.loadContactCount()
            let lastExitDate = DataManager.shared.loadLastExitDate()
            let entry = SimpleEntry(date: entryDate, contactCount: count, lastExitDate: lastExitDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let contactCount: Int
    let lastExitDate: Date?
    let configuration: ConfigurationAppIntent
}

struct WBMessengerWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 4) {
                Image(systemName: "bubble.left.and.bubble.right.fill")
                Text("Unread")
                Spacer()
            }
            .font(.title3)
            .bold()
            .padding(.bottom, 8)
            
            if entry.contactCount == 0 {
                //TODO: change on number of chats
                Text("No contacts")
                    .font(.subheadline)
                    .bold()
            } else {
                //TODO: change on number of chats
                Text("\(entry.contactCount) contacts")
                    .font(.subheadline)
                    .bold()
            }
        
            Spacer()
            if let lastExitDate = entry.lastExitDate {
                Text("**Last Update:** \nYou were online \(formattedDate(lastExitDate))")
                    .font(.caption2)
            } else {
                Text("**Last Update:** \nUnknown")
                    .font(.caption2)
            }
        }
        .foregroundStyle(.white)
        .background(RoundedRectangle(cornerRadius: 16)
            .fill(LinearGradient(
                gradient: Gradient(colors: [.wbDefaultPurple,
                                            .wbGradientDarkPurple,
                                            .wbDarkPurple
                                           ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
                .padding(-20)
        )
    }
    
    private func formattedDate(_ date: Date) -> String {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: date)
        
        if calendar.isDateInToday(date) {
            return "today at \(timeString)"
        } else if calendar.isDateInYesterday(date) {
            return "yesterday at \(timeString)"
        } else {
            dateFormatter.dateFormat = "dd MMMM 'at' HH:mm"
            return "\(dateFormatter.string(from: date))"
        }
    }
}

struct WBMessengerWidget: Widget {
    let kind: String = "WBMessengerWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WBMessengerWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview(as: .systemSmall) {
    WBMessengerWidget()
} timeline: {
    SimpleEntry(
        date: .now,
        contactCount: 4,
        lastExitDate: Calendar.current.date(byAdding: .day, value: -1, to: Date()), //change value
        configuration: ConfigurationAppIntent())
    SimpleEntry(
        date: .now,
        contactCount: 0,
        lastExitDate: nil,
        configuration: ConfigurationAppIntent())
}

#Preview(as: .systemMedium) {
    WBMessengerWidget()
} timeline: {
    SimpleEntry(date: .now, contactCount: 4, lastExitDate: nil, configuration: ConfigurationAppIntent())
    SimpleEntry(date: .now, contactCount: 0, lastExitDate: nil, configuration: ConfigurationAppIntent())
}
