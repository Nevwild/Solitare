enum Suite {
    case diamonds
    case spades
    case clubs
    case hearts
}


enum Value: Int {
    case ace = 1
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
}

struct Card {
    let value: Value
    let suite: Suite
}

enum Color {
    case black
    case red
}

extension Suite {
    var color: Color {
        switch self {
            case .diamonds, .hearts:
                return .red
            case .spades, .clubs:
                return .black
        }
    }
}

let kingOfSpades = Card(value: .king, suite: .spades)

let boardMatrix = [[Card]]()

struct Deck {
    private var cards = [
        Card(value: .king, suite: .spades),
        Card(value: .queen, suite: .hearts),
        Card(value: .jack, suite: .clubs)
    ]
}
extension Deck {

    mutating func draw() -> Card?{
        self.cards.popLast()
    }
    mutating func draw(_ count: Int) -> [Card]{
//        var result: [Card]
//        for _ in 1...count {
//            result.append(self.cards.popLast()!)
//        }
//        return result

        [1...count].compactMap { _ in
            self.cards.popLast()
        }
    }

// RESULT VERSION
//    mutating func draw() -> Result<Card, Error>{
//        Result{
//            guard let last = self.cards.popLast()
//            else { throw DeckError.empty}
//
//            return last
//        }
//    }
//    enum DeckError:Error{
//        case empty
//    }

}

var deck = Deck()

struct Board {
    var columns: [[Card]] = []
}
extension Board{
    static var initial: Board = Self(
        columns: [
            deck.draw(1),
            deck.draw(2),
            deck.draw(3),
            deck.draw(4),
            deck.draw(5),
            deck.draw(6),
            deck.draw(7)
        ]
    )
}

Board.initial

dump(Board.initial)




