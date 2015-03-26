//
// This playground must be opened using the enclosed workspace in order for the
// ObjectiveGit module to be available.
//
import ObjectiveGit
import libgit2_shims
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

// MARK: - Certificate Setup

/*
Error Domain=GTGitErrorDomain Code=-17 "Failed to clone repository from https://github.com/phatblat/objective-git.git to file:///Users/phatblat/Library/Containers/com.apple.dt.playground.stub.OSX.ObjectiveGit-BCEF1E1C-124A-4DD8-9B57-75AB79FCF476/Data/Documents/Shared%20Playground%20Data/objective-git/" UserInfo=0x7f8ae2e3d7b0 {NSLocalizedDescription=Failed to clone repository from https://github.com/phatblat/objective-git.git to file:///Users/phatblat/Library/Containers/com.apple.dt.playground.stub.OSX.ObjectiveGit-BCEF1E1C-124A-4DD8-9B57-75AB79FCF476/Data/Documents/Shared%20Playground%20Data/objective-git/, NSUnderlyingError=0x7f8ae2e3ab40 "The SSL certificate is invalid"}
*/

let certFile = "DigiCert High Assurance EV Root CA.pem";
let certFilePath = NSBundle.mainBundle().pathForResource(certFile.stringByDeletingPathExtension, ofType: certFile.pathExtension)

let file = certFilePath?.fileSystemRepresentation() // : [CChar] // .UTF8String;

let returnValue = ogp_git_libgit2_opts(GIT_OPT_SET_SSL_CERT_LOCATIONS, file, nil);
if (returnValue != 0) {
    println("Error setting SSL certificate location")
}

// MARK: - Clone

let url = NSURL(string: "https://github.com/phatblat/objective-git.git") as NSURL?
// directory containing data shared between all playgrounds
let localPath = XCPSharedDataDirectoryPath + "/objective-git"
let workdirURL = NSURL.fileURLWithPath(localPath)
var error: NSError? = nil

let success = NSFileManager.defaultManager().createDirectoryAtPath(localPath, withIntermediateDirectories: true, attributes: nil, error: &error)

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

