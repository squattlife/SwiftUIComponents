

import Foundation

struct Episode {
    let title: String
    let showTitle: String
    let duration: TimeInterval
}

extension Episode {
    static let list: [Episode] = [
        Episode(title: "Amatriciana", showTitle: "Cafe Macs Radio", duration: 300),
        Episode(title: "VC for startup", showTitle: "a16z Radio", duration: 500),
    ]
}
