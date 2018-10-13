
/* 1.2
 Write code to reverse a C-Style String (C-String means that “abcd” is represented as five characters, including the null character )
 */
func reverse(string: inout String) {
    var i = string.endIndex
    while i > string.startIndex {
        
        i = string.index(before: i)
    }

}
var s = "hello"
reverse(&s)
print(s)


