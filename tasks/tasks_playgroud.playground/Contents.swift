

var arrWithDuplicates = [1, 2, 2, 1, 3, 4, 4, 5, 1]
arrWithDuplicates.remove(at: 0)
var arrWithOutDuplicates = arrWithDuplicates
var count = 0
var resultArray = [Int]()
for (index1, potentialDoubleur) in arrWithDuplicates.enumerated() { // [1, 2, 2, 1, 3, 4, 4, 5, 1]
    for (index2, item) in arrWithOutDuplicates.enumerated() {
        if (potentialDoubleur == item) && (index1 != index2){
            count += 1
        }
    }
    if count > 0 {
        resultArray.append(potentialDoubleur)
        arrWithDuplicates.
        count = 0
    }
}
print(resultArray)
