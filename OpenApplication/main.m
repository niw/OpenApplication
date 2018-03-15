//
//  main.m
//  OpenApplication
//
//  Created by Yoshimasa Niwa on 3/15/18.
//  Copyright © 2018 Yoshimasa Niwa. All rights reserved.
//

@import CoreServices;
@import Foundation;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

int main(int argc, const char * argv[])
{
    @autoreleasepool{
        if (argc < 2) {
            printf("Usage: %s path [arg...]\n", argv[0]);
            return 1;
        }

        NSString * const path = [NSString stringWithUTF8String:argv[1]];
        NSURL * const url = [NSURL fileURLWithPath:path];
        FSRef fsref;
        CFURLGetFSRef((__bridge CFURLRef)url, &fsref);

        NSMutableArray * const args = [[NSMutableArray alloc] init];
        for (int i=2; i<argc; i++) {
            NSString * const arg = [NSString stringWithUTF8String:argv[i]];
            [args addObject:arg];
        }

        const LSApplicationParameters params = {
            .argv = (__bridge CFArrayRef)args,
            .application = &fsref
        };
        ProcessSerialNumber psn;
        return LSOpenApplication(&params, &psn);
    }
}

#pragma clang diagnostic pop
