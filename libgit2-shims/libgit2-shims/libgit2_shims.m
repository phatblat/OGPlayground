//
//  libgit2_shims.m
//  libgit2-shims
//
//  Created by Ben Chatelain on 3/25/15.
//  Copyright (c) 2015 phatblat. All rights reserved.
//

#import "libgit2_shims.h"

/// This is a neutered version of git_libgit2_opts() which accepts a va_list
/// instead of varadic parameters. This is currently necessary in order to call
/// this function from Swift because Swift variadic parameters are not compatible
/// with C variadics.
///
///     GIT_EXTERN(int) git_libgit2_opts(int option, ...);
///
int ogp_git_libgit2_opts(git_libgit2_opt_t option, va_list args)
{
    int error = 0;

    switch (option) {
//        case GIT_OPT_SET_MWINDOW_SIZE:
//            git_mwindow__window_size = va_arg(args, size_t);
//            break;
//
//        case GIT_OPT_GET_MWINDOW_SIZE:
//            *(va_arg(args, size_t *)) = git_mwindow__window_size;
//            break;
//
//        case GIT_OPT_SET_MWINDOW_MAPPED_LIMIT:
//            git_mwindow__mapped_limit = va_arg(args, size_t);
//            break;
//
//        case GIT_OPT_GET_MWINDOW_MAPPED_LIMIT:
//            *(va_arg(args, size_t *)) = git_mwindow__mapped_limit;
//            break;
//
//        case GIT_OPT_GET_SEARCH_PATH:
//            if ((error = config_level_to_sysdir(va_arg(args, int))) >= 0) {
//                git_buf *out = va_arg(args, git_buf *);
//                const git_buf *tmp;
//
//                git_buf_sanitize(out);
//                if ((error = git_sysdir_get(&tmp, error)) < 0)
//                    break;
//
//                error = git_buf_sets(out, tmp->ptr);
//            }
//            break;
//
//        case GIT_OPT_SET_SEARCH_PATH:
//            if ((error = config_level_to_sysdir(va_arg(args, int))) >= 0)
//                error = git_sysdir_set(error, va_arg(args, const char *));
//            break;
//
//        case GIT_OPT_SET_CACHE_OBJECT_LIMIT:
//        {
//            git_otype type = (git_otype)va_arg(args, int);
//            size_t size = va_arg(args, size_t);
//            error = git_cache_set_max_object_size(type, size);
//            break;
//        }
//
//        case GIT_OPT_SET_CACHE_MAX_SIZE:
//            git_cache__max_storage = va_arg(args, ssize_t);
//            break;
//
//        case GIT_OPT_ENABLE_CACHING:
//            git_cache__enabled = (va_arg(args, int) != 0);
//            break;
//
//        case GIT_OPT_GET_CACHED_MEMORY:
//            *(va_arg(args, ssize_t *)) = git_cache__current_storage.val;
//            *(va_arg(args, ssize_t *)) = git_cache__max_storage;
//            break;
//
//        case GIT_OPT_GET_TEMPLATE_PATH:
//        {
//            git_buf *out = va_arg(args, git_buf *);
//            const git_buf *tmp;
//
//            git_buf_sanitize(out);
//            if ((error = git_sysdir_get(&tmp, GIT_SYSDIR_TEMPLATE)) < 0)
//                break;
//
//            error = git_buf_sets(out, tmp->ptr);
//        }
//            break;
//            
//        case GIT_OPT_SET_TEMPLATE_PATH:
//            error = git_sysdir_set(GIT_SYSDIR_TEMPLATE, va_arg(args, const char *));
//            break;

        case GIT_OPT_SET_SSL_CERT_LOCATIONS:
        {
            const char *file = va_arg(args, const char *);
            const char *path = va_arg(args, const char *);
            error = git_libgit2_opts(option, file, path);
        }
            break;
            
        default: {
            NSLog(@"Unsupported libgit2 option: '%uld'", option);
            error = -1;
            break;
        }
    }
    
    return error;
}
