//: Playground - noun: a place where people can play

import UIKit

// My program for BS-Binary Search


func rank(ofInt x:Int, SortedIntArray array: [Int])-> Int{
    var arraryRank = -1
    if (array.count == 0){
        return arraryRank;
    }
    var lowVal = 0
    var highVal = array.count - 1
    
    while (lowVal <= highVal){
        let midVal = lowVal + (highVal - lowVal)/2
        if (array[midVal] == x)
        {
            arraryRank = midVal
            break
        }
        else if(array[midVal] < x){
            lowVal = midVal + 1
        }
        else
        {
            highVal = midVal - 1
        }
    }
    return arraryRank;
}


func testMyArrayRankFunc(){
    let arraySize = Int(arc4random_uniform(UInt32.max % 1000))
    var myArray: [Int] = []
    for _ in 0 ..< arraySize {
        myArray.append(Int(arc4random_uniform(UInt32.max)))
    }
    
    
    let indexVal = Int(arc4random_uniform(UInt32(arraySize-1)))
    myArray = myArray.sorted()
    if (indexVal >= 0 && indexVal < myArray.count){
        let indexRet = rank(ofInt: myArray[indexVal], SortedIntArray: myArray)
        print(indexVal == indexRet ? "Pass" : "Fail" )
    }
    
}

var myArray = [100,200,300,400,500]
rank(ofInt: 500 , SortedIntArray: myArray)
testMyArrayRankFunc()



// Question 3. Fraction Class

class Fraction
{
    var num: Int
    var denum: Int
    
    init(num:Int = 0, denum:Int = 1)
    {
        if denum == 0
        {
            print("Cannot have 0 as denominator")
        }
        self.num = num;
        self.denum = denum;
        
        if (self.denum < 0)
        {
            self.num *= -1
            self.denum *= -1
        }
        reduceFunc()
    }
    
    func setNum(valNumerator num: Int)
    {
        self.num = num;
        reduceFunc()
    }
    
    func setDenom(valDenominator denum: Int)
    {
        if (denum == 0){
            print("It cannot have 0 as a denominator")
        }
        else
        {
            self.denum = denum;
        }
        reduceFunc()
    }
    
    func reduceFunc() -> Fraction{
        let printSign = self.num >= 0 ? 1 : -1;
        
        var var1 = num * printSign
        var var2 = denum
        var var3:Int
        while (var2 != 0){
            var3 = var1 % var2
            var1 = var2
            var2 = var3
        }
        num /= var1 * printSign
        denum /= var1
        print(num)
        print(denum)
        return self
    }
    
    func add(thisFraction that: Fraction) -> Fraction{
        
        
        
        let newNumerator = self.num * that.denum + that.num * self.denum
        let newDenominator = self.denum * that.denum
        return Fraction(num : newNumerator, denum : newDenominator ).reduceFunc()
        
    }
    
    func multiply(thisFraction that: Fraction) -> Fraction{
        let newNumerator = self.num * that.num
        let newDenominator = self.denum * that.denum
        return Fraction(num : newNumerator, denum : newDenominator ).reduceFunc()
        
    }
    
    func divide(thisFraction that: Fraction) -> Fraction{
        let newNumerator = self.num * that.denum
        let newDenominator = self.denum * that.num
        return Fraction(num : newNumerator, denum : newDenominator ).reduceFunc()
        
    }
    
    func substract(thisFraction that: Fraction) -> Fraction{
        let newNumerator = self.num * that.denum - that.num * self.denum
        let newDenominator = self.denum * that.denum
        return Fraction(num : newNumerator, denum : newDenominator ).reduceFunc()
    }
}


var myVar1 = Fraction(num: 40, denum: 1200)
var myVar2 = Fraction(num: 50, denum: 6000)

var runTest = myVar1.substract(thisFraction: myVar2)
print(runTest.num)
print(runTest.denum)

runTest = myVar1.add(thisFraction: myVar2)
print(runTest.num)
print(runTest.denum)

runTest = myVar1.multiply(thisFraction: myVar2)
print(runTest.num)
print(runTest.denum)

runTest = myVar1.divide(thisFraction: myVar2)
print(runTest.num)
print(runTest.denum)
