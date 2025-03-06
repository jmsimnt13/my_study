

var arrWithDuplicates = [1, 2, 2, 1, 3, 4, 4, 5, 1]
var resultArray = [Int]()

for item in arrWithDuplicates {
    if !resultArray.contains(item) {
        resultArray.append(item)
    }
}
print(resultArray)
