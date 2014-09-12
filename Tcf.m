#import <Foundation/Foundation.h>
#import <stdio.h>

int main() {
    NSAutoreleasePool *myPool = [[NSAutoreleasePool alloc] init];
    @try {
        @try {
            NSException *exception = [NSException exceptionWithName:@"myException" reason:@"Foo" userInfo:nil];
            @throw exception;
        }
        @catch (NSException *e) {
            printf("Inner Catch\n");
            @throw e;
        }
        @finally {
            printf("Inner Finally\n");
        }
    }
    @catch (NSException *e) {
        printf("Outer Catch\n");
    }
    @finally {
        printf("Outer Finally\n");
    }
    [myPool drain];
    return 0;
}
