//
// This playground must be opened using the enclosed workspace in order for the
// ObjectiveGit module to be available.
//
import ObjectiveGit
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

let fileManager = NSFileManager.defaultManager()

// MARK: - Clone


let remoteURL = NSURL(fileURLWithPath: <#String#>)
    string: "file://github.com/phatblat/objective-git.git") as NSURL?
// directory containing data shared between all playgrounds
let workdirPath = XCPSharedDataDirectoryPath + "/objective-git"
let workdirURL = NSURL.fileURLWithPath(workdirPath)
var error: NSError? = nil

fileManager.

let success = fileManager.createDirectoryAtPath(workdirPath, withIntermediateDirectories: true, attributes: nil, error: &error)

let repo = GTRepository.cloneFromURL(url!, toWorkingDirectory: workdirURL!, options: [:], error: &error,
    transferProgressBlock: { (gt_progress, stop) -> Void in
        // transferProgressBlock:^(const git_transfer_progress *gt_progress, BOOL *stop) {
        println("transfer")
    }, checkoutProgressBlock: { (path, completedSteps, totalSteps) -> Void in
        // checkoutProgressBlock:^(NSString *path, NSUInteger completedSteps, NSUInteger totalSteps) {
        println("checkout")
    }
) as? GTRepository

if let myError = error {
    println("\(myError)")
}

