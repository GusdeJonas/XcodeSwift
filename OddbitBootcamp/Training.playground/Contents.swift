//: Playground - noun: a place where people can play

import UIKit


typealias tesTupple = (id: Int, nama: String)

var str: tesTupple = (id: 1, nama: "Gusde")

print(str.id)
print(str.nama)



// MARK: - Array

var names : [String] = ["Gusde", "Chandrariz"]


func fungsi(str: String?) -> String{
    defer {
        print("Masuk ke fungsi")
    }
    guard  let str = str else {
        return "test"
    }
    
    return str
}

print(fungsi(str: nil))


// MARK: - Dictionary

var jumlahKaki = ["Semut" : 6, "Ular": 0, "Kuda": 4 ]




// MARK: - Looping

for number in 1...100{
    
    if number == 50{
        break
    }
    
    if number % 2 == 0{
        continue
    }
    print(number)
}

for value in jumlahKaki{
    print("\(value.key), \(value.value)")
}



// - Struct

struct Game{
    var id: Int
    var title: String
    var genre: String
    var genap: Bool
    init (id: Int, title: String, genre: String){
        self.id = id
        self.title = title
        self.genre = genre
        
        self.genap = id % 2 == 0 ? true : false
    }
    
}

let games: [Game] = [
    Game(id: 1, title: "Horizon", genre: "Open World"),
    Game(id: 2, title: "The Witcher 3", genre: "Open World")

]

print(games)










