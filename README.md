iDotnetFormatter
================

A utility class to format strings that come from .NET web services.
License : BSD

For example :
``` objc
[ NSString stringWithDotNetFormat: @"Q{0} '{1}", @"a", @"b" ]; // Qa 'b
[ NSString stringWithDotNetFormat: @"Q{1} '{0}", @"a", @"b" ]; // Qb 'a
```

