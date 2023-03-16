import Foundation
import Glibc
//
//  FileIO.swift
//
//  Created by Alex De Meo
//  Created on 2023/02/11
//  Version 1.0
//  Copyright (c) 2023 Alex De Meo. All rights reserved.
//
//  This program calculates the Energy released when mass.
// is converted to energy

// creating constants and variables
var sum = 0
var canPrint = false
var errorMessage = ""

// Defining the file paths
let inputFile = "input.txt"
let outputFile = "output.txt"

// opening the input file for reading
guard let input = FileHandle(forReadingAtPath: inputFile) else {
    print("Error: Cannot open input file.")
    exit(1)
}

// opening the output file for writing
guard let output = FileHandle(forWritingAtPath: outputFile) else {
    print("Error: Cannot open output file.")
    exit(1)
}

// Reading contents of input file
let inputData = input.readDataToEndOfFile()

// Converting data to a string
guard let inputString = String(data: inputData, encoding: .utf8) else {
    print("Error: Cannot convert data to string.")
    exit(1)
}

// Splitting string into separate lines
let lines = inputString.components(separatedBy: .newlines)

for line in lines {
    sum = 0
    canPrint = false
    let numbers : [String] = line.components(separatedBy: " ")
    if (numbers[0] == "") {
        errorMessage = "Error: Empty line\n"
        output.write(errorMessage.data(using: .utf8)!)
    } else {
        for num in numbers {
            if let numInt = Int(num) {
                sum += numInt
                canPrint = true
            } else {
                errorMessage = "Error: \(num) is not of value Int\n"
                output.write(errorMessage.data(using: .utf8)!)
                canPrint = false
                break
            }
        }
        if (canPrint) {
            let outputMessage = String("\(sum)\n")
            output.write(outputMessage.data(using: .utf8)!)
        }
    }
}