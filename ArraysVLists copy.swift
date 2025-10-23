import Foundation  // Import Foundation for file handling.

// Function to calculate the mean (average) of an array
func calcMean(arr: [Int]) -> Double {
    var sum = 0  // Initialize sum variable
    for num in arr {  // Loop through each number
        sum += num  // Add number to sum
    }
    return Double(sum) / Double(arr.count)  // Return sum divided by length
}

// Function to calculate the median of an array
// Assumes the array is already sorted
func calcMedian(arr: [Int]) -> Double {
    let size = arr.count  // Get the size of the array
    if size % 2 == 0 {  // If even number of elements
        // Average the middle two elements
        return Double(arr[size / 2 - 1] + arr[size / 2]) / 2.0
    } else {  // If odd number of elements
        return Double(arr[size / 2])  // Return the middle element
    }
}

// Main function
func main() {
    // Ask user to choose a file
    print("Choose a file to read:")
    print("1. File 1.txt")  // Option 1
    print("2. File 2.txt")  // Option 2
    print("3. File 3.txt")  // Option 3
    print("Enter choice (1-3):")

    // Read user input
    let input = readLine()!  // Get input from user
    let choice = Int(input)!  // Convert to integer

    // Find filename based on user's choice
    var filename = ""  // Variable for filename
    if choice == 1 {  // If user chose 1
        filename = "File 1.txt"  // Set filename
    } else if choice == 2 {  // If user chose 2
        filename = "File 2.txt"  // Set filename
    } else if choice == 3 {  // If user chose 3
        filename = "File 3.txt"  // Set filename
    } else {  // If invalid choice
        print("Invalid choice.")  // Display error
          // if invalid choice
        print("Please enter a number between 1 and 3.")
        return  // Exit program
    }

    var numbers: [Int] = []  // Array to store numbers

    // use do-catch to check input.
    do {
        let contents = try String(contentsOfFile: filename)  // Read file contents
        let lines = contents.components(separatedBy: .newlines)  // Split into lines

        // Loop through each line
        for line in lines {
              // Trim spaces
            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmed == "" { continue }  // Skip empty lines

            let number = Int(trimmed)!  // Convert to integer
            numbers.append(number)  // Add to array
        }

    } catch {  // Catch file read errors
        print("No file")  // File does not exist
        return  // Exit program
    }

    // Sort numbers before calculations
    numbers.sort()  // Sort array in ascending order

    // Print numbers in rows, 10 numbers per line
    print("Numbers from file:")
    let numbersPerLine = 10  // Number of numbers per row
    var count = 0
    for num in numbers {
        print(num, " ")  // Print number and space
        count += 1
        if count % numbersPerLine == 0 {
            print()  // New line after 10 numbers
        }
    }
    if count % numbersPerLine != 0 {
        print()  // End last line
    }

    // Calculate mean and median
    let mean = calcMean(arr: numbers)  // Calculate mean
    let median = calcMedian(arr: numbers)  // Calculate median

    // Display mean and median formatted to 2 decimals
    print("Mean: \(String(format: "%.2f", mean))")
    print("Median: \(String(format: "%.2f", median))")
}

// Call the main function
main()
