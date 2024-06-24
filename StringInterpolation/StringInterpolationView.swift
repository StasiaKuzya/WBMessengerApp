//
//  StringInterpolationView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 24.06.2024.
//

import SwiftUI

enum DateType {
    case today, yesterday, dayBeforeYesterday, tomorrow, dayAfterTomorrow
}

struct StringInterpolationView: View {
    @State private var selectedDate = Date()
    @State private var selectedLocale = 0
    @State private var useSpellOut = false

    let locales = ["en_US", "ru_RU", "de_DE", "es_ES", "fr_FR"]
    let flags = ["🇺🇸", "🇷🇺", "🇩🇪", "🇪🇸", "🇫🇷"]
    let localizedTerms: [String: [DateType: String]] = [
        "en_US": [
            .today: "Today",
            .yesterday: "Yesterday",
            .dayBeforeYesterday: "Day before yesterday",
            .tomorrow: "Tomorrow",
            .dayAfterTomorrow: "Day after tomorrow"
        ],
        "ru_RU": [
            .today: "Сегодня",
            .yesterday: "Вчера",
            .dayBeforeYesterday: "Позавчера",
            .tomorrow: "Завтра",
            .dayAfterTomorrow: "Послезавтра"
        ],
        "de_DE": [
            .today: "Heute",
            .yesterday: "Gestern",
            .dayBeforeYesterday: "Vorgestern",
            .tomorrow: "Morgen",
            .dayAfterTomorrow: "Übermorgen"
        ],
        "es_ES": [
            .today: "Hoy",
            .yesterday: "Ayer",
            .dayBeforeYesterday: "Anteayer",
            .tomorrow: "Mañana",
            .dayAfterTomorrow: "Pasado mañana"
        ],
        "fr_FR": [
            .today: "Aujourd'hui",
            .yesterday: "Hier",
            .dayBeforeYesterday: "Avant-hier",
            .tomorrow: "Demain",
            .dayAfterTomorrow: "Après-demain"
        ]
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            Text("select_date_and_see".localized())
                .font(.title)
                .bold()
                .padding(.bottom, 50)
            
            DatePicker("select_date".localized(), selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(CompactDatePickerStyle())

            Picker("Locale", selection: $selectedLocale) {
                ForEach(0..<locales.count) {
                    Text(self.flags[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            VStack(alignment: .leading, spacing: 7) {
                Text(formatDate(selectedDate, locale: locales[selectedLocale], type: .dayBeforeYesterday))
                Text(formatDate(selectedDate, locale: locales[selectedLocale], type: .yesterday))
                Text(formatDate(selectedDate, locale: locales[selectedLocale], type: .today))
                    .bold()
                Text(formatDate(selectedDate, locale: locales[selectedLocale], type: .tomorrow))
                Text(formatDate(selectedDate, locale: locales[selectedLocale], type: .dayAfterTomorrow))
            }
            
            Spacer()
            Toggle("use_spell_out".localized(), isOn: $useSpellOut)
                .padding(.bottom, 50)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
    }
    
    private func formatDate(_ date: Date, locale: String, type: DateType) -> String {
        let calendar = Calendar.current
        var modifiedDate = date
        
        switch type {
        case .today:
            break
        case .yesterday:
            modifiedDate = calendar.date(byAdding: .day, value: -1, to: date) ?? date
        case .dayBeforeYesterday:
            modifiedDate = calendar.date(byAdding: .day, value: -2, to: date) ?? date
        case .tomorrow:
            modifiedDate = calendar.date(byAdding: .day, value: 1, to: date) ?? date
        case .dayAfterTomorrow:
            modifiedDate = calendar.date(byAdding: .day, value: 2, to: date) ?? date
        }
        
        let term = localizedTerms[locale]?[type] ?? ""
        
        if useSpellOut {
            let day = calendar.component(.day, from: modifiedDate)
            let month = calendar.component(.month, from: modifiedDate)
            let year = calendar.component(.year, from: modifiedDate)
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .spellOut
            formatter.locale = Locale(identifier: locale)
            
            let dayString = formatter.string(from: NSNumber(value: day)) ?? "\(day)"
            let monthString = DateFormatter().monthSymbols[month - 1]
            let yearString = formatter.string(from: NSNumber(value: year)) ?? "\(year)"
            
            return "\(term): \(dayString) \(monthString) \(yearString)"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: locale)
            dateFormatter.dateStyle = .full
            
            let dateString = dateFormatter.string(from: modifiedDate)
            return "\(term): \(dateString)"
        }
    }
}

#Preview {
    StringInterpolationView()
}
