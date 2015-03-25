import ObjectiveGit

let url = NSURL(string: "https://github.com/phatblat/objective-git.git") as NSURL?
let workdirURL = NSURL(string: "/tmp/objective-git") as NSURL?
var error: NSError? = nil

let repo = GTRepository.cloneFromURL(url!, toWorkingDirectory: workdirURL!, options: [:], error: &error,
    transferProgressBlock: { (gt_progress, stop) -> Void in
        // transferProgressBlock:^(const git_transfer_progress *gt_progress, BOOL *stop) {
        println()
    }, checkoutProgressBlock: { (path, completedSteps, totalSteps) -> Void in
        // checkoutProgressBlock:^(NSString *path, NSUInteger completedSteps, NSUInteger totalSteps) {
        println()
    }
)

if let myError = error {
    println("\(myError)")
}

