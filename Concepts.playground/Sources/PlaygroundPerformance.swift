import Foundation
import XCPlayground
import PlaygroundSupport

public typealias MeasuredBlock = ()->Void

//
// Calls a particular block the specified number of times, returning the average
// number of seconds it took to complete the code. If a name is supplied the time
// take for each iteration will be recorded
//
public func measure(name:String? = nil,
                    iterations:Int = 10,
                    forBlock block:MeasuredBlock)->Double{
    precondition(iterations > 0, "Iterations must be a positive integer")
    
    var total : Double = 0
    var samples = [Double]()
    
    for i in 0..<iterations {
        let start = Date().timeIntervalSinceReferenceDate
        block()
        let took = Double(Date().timeIntervalSinceReferenceDate - start)
        
        if let name = name {
            XCPCaptureValue(identifier: name, value: took)
        }
        
        samples.append(took)
        
        total += took
    }
    
    let mean = total / Double(iterations)

    if let name = name {

        var deviation = 0.0
        
        for result in samples {
            
            let difference = result - mean
            
            deviation += difference*difference
        }
        
        let variance = deviation / Double(iterations)
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second]
        formatter.allowsFractionalUnits = true
        
        XCPCaptureValue(identifier: "\(name) Average", value: mean.milliSeconds)
        XCPCaptureValue(identifier: "\(name) STD Dev.", value: variance.milliSeconds)
    }
    
    return mean
}

public enum MeasuredBlockComparison {
    case left(Double)
    case right(Double)
    case equal(Double)
}

public func compare(left: MeasuredBlock, right: MeasuredBlock) -> MeasuredBlockComparison {
    let leftResult = measure(forBlock: left)
    let rightResult = measure(forBlock: right)
    
    if leftResult < rightResult {
        return .left(rightResult - leftResult)
    } else if leftResult > rightResult {
        return .right(leftResult - rightResult)
    } else {
        return .equal(leftResult)
    }
}

extension Double{
    
    var milliSeconds : String {
        return String(format: "%03.2fms", self*1000)
    }
    
}

