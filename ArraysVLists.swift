import Foundation  // Use import Foundation for file handling.

// Calculate mean of array
func calcMean(arr: [Int]) -> Double {
    var sum = 0
    for num in arr {  // Add each number
        sum += num
    }
    return Double(sum) / Double(arr.count)  // Return mean
}

// Calculate median of array (assumes sorted)
func calcMedian(arr: [Int]) -> Double {
    let size = arr.count
    if size % 2 == 0 {  // Even number of elements
        return Double(arr[size / 2 - 1] + arr[size / 2]) / 2.0
    } else {  // Odd number of elements
        return Double(arr[size / 2])
    }
}

// Main program
func main() {
    // Ask user for file choice
    print("Choose a file to read:") // Ask user for file choice
    print("1. File 1.txt")
    print("2. File 2.txt")
    print("3. File 3.txt")
    print("Enter choice (1-3):")

    let input = readLine()!  // Read input
    let choice = Int(input)!  // Convert to integer

    // Determine filename
    var filename = ""
    if choice == 1 { // File 1 
        filename = "File 1.txt" // set filename
    } else if choice == 2 {
        filename = "File 2.txt" // set filename
    } else if choice == 3 {
        filename = "File 3.txt" // set filename
    } else {
        print("Invalid choice.")
        print("Please enter a number between 1 and 3.")
        return
    }

    var numbers: [Int] = []  // Array to store numbers

    // Read numbers from file
    do {
        let contents = try String(contentsOfFile: filename)
        let lines = contents.components(separatedBy: .newlines)

        for line in lines {
            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmed == "" { continue }  // Skip empty lines

            let number = Int(trimmed)!  // Convert to integer
            numbers.append(number)  // Add to array
        }

    } catch {
        print("No file")  // File not found
        return
    }

    // Print numbers in original file order on a single line
    print("Numbers from file:")
    for num in numbers {
        print(num, terminator:" ")  // Print number with space, stay on same line
    }
    print()  // Move to next line after all numbers

    // Sort numbers only for median calculation
    let sortedNumbers = numbers.sorted()

    // Calculate mean and median
    let mean = calcMean(arr: numbers)
    let median = calcMedian(arr: sortedNumbers)

    // Print results and format to 2 decimal places
    print("Mean: \(String(format: "%.2f", mean))")
    print("Median: \(String(format: "%.2f", median))")
}

// Run the program
main()
