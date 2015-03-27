//
// This playground must be opened using the enclosed workspace in order for the
// ObjectiveGit module to be available.
//
import ObjectiveGit
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

var error: NSError? = nil
let fileManager = NSFileManager.defaultManager()

// MARK: - Clone

// directory containing data shared between all playgrounds
if let remoteURL = NSURL(fileURLWithPath: XCPSharedDataDirectoryPath + "/SwiftTestRepo.git"),
    let workdirURL = NSURL(fileURLWithPath: XCPSharedDataDirectoryPath + "/SwiftTestRepo") {

    //let success = fileManager.createDirectoryAtPath(workdirPath, withIntermediateDirectories: true, attributes: nil, error: &error)
    if fileManager.fileExistsAtPath(workdirURL.path!) {
        fileManager.removeItemAtPath(workdirURL.path!, error: &error)
    }

    let repo = GTRepository.cloneFromURL(remoteURL, toWorkingDirectory: workdirURL, options: [:], error: &error,
        transferProgressBlock: { (gt_progress, stop) -> Void in
            // transferProgressBlock:^(const git_transfer_progress *gt_progress, BOOL *stop) {
            println("transfer")
        }, checkoutProgressBlock: { (path, completedSteps, totalSteps) -> Void in
            // checkoutProgressBlock:^(NSString *path, NSUInteger completedSteps, NSUInteger totalSteps) {
            println("checkout \(path) \(completedSteps)/\(totalSteps)")
        }
    ) as? GTRepository
}

if let myError = error {
    println("\(myError)")
}

