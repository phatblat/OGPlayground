//
//  libgit2_shims.h
//  libgit2-shims
//
//  Created by Ben Chatelain on 3/25/15.
//  Copyright (c) 2015 phatblat. All rights reserved.
//

#include <ObjectiveGit/git2/common.h>

//GIT_EXTERN(int) git_libgit2_opts(int option, ...);
int ogp_git_libgit2_opts(git_libgit2_opt_t option, va_list args);
