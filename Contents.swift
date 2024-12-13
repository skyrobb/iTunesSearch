import Cocoa

// MARK: Part 1

var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
urlComponents.queryItems = [
    "term": "Beyonders",
    "media": "audiobook",
    "attribute": "titleTerm",
    "lang": "en_us"
].map { URLQueryItem(name: $0.key, value: $0.value) }

Task {
    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)

    if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let string = String(data: data, encoding: .utf8) {
        print(string)
    }
}
