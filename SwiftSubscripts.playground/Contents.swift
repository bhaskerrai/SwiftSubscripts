import UIKit

//Subscripts
//Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence. You use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval. For example, you access elements in an Array instance as someArray[index] and elements in a Dictionary instance as someDictionary[key].


//You write subscript definitions with the subscript keyword, and specify one or more input parameters and a return type, in the same way as instance methods. Unlike instance methods, subscripts can be read-write or read-only. This behavior is communicated by a getter and setter in the same way as for computed properties:

class abc {
subscript(index: Int) -> Int {
    get {
        // Return an appropriate subscript value here.
        return 031502549481
    }
    set(newValue) { //The type of newValue is the same as the return value of the subscript

        // Perform a suitable setting action here.
    }
}
}

//As with read-only computed properties, you can simplify the declaration of a read-only subscript by removing the get keyword and its braces:
/*

subscript(index: Int) -> Int {
    // Return an appropriate subscript value here.
}

*/


//Here’s an example of a read-only subscript implementation, which defines a MyStruct1 structure to represent an n-times-table of integers:

struct MyStruct1 {
    let multiplier: Int
    
    subscript(x:Int) -> Int {
        return multiplier * x
    }
}


let s1 = MyStruct1(multiplier: 10)
print(s1[6])

//You can query the s1 instance by calling its subscript, as shown in the call to s1[6]. This requests the sixth entry in the n-times-table, which returns a value of 18, or 10 times 6.


//Subscript Usage
//The exact meaning of “subscript” depends on the context in which it’s used. Subscripts are typically used as a shortcut for accessing the member elements in a collection, list etc.



//Subscript Options:

//Subscripts can take any number of input parameters, and these input parameters can be of any type. Subscripts can also return a value of any type.
//Like functions, subscripts can take a varying number of parameters and provide default values for their parameters, as discussed in Variadic Parameters and Default Parameter Values. However, unlike functions, subscripts can’t use in-out parameters.

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
print(matrix.grid)




//“Type Subscripts
//Instance subscripts, as described above, are subscripts that you call on an instance of a particular type. You can also define subscripts that are called on the type itself. This kind of subscript is called a type subscript. You indicate a type subscript by writing the static keyword before the subscript keyword. Classes can use the class keyword instead, to allow subclasses to override the superclass’s implementation of that subscript. The example below shows how you define and call a type subscript:
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let a = Planet[4]
print(a)
