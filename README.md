# Collection Type Enhancements
A suite of collection enhancements provided to make writing generic algorithms
on collections, and other collection related protocols easier and more
accessible.

## ABI Stability Note
While this framework is distributed as a standard Swift Package, it is designed
to be suitable for use inside of a binary framework. Given this is a set of
collection-related APIs, this becomes particularly important when dealing with
lazy performance of collection types. Particular attention to this is paid
there. While ABI stability is not maintained between versions, using releases
from a single major version inside of a Binary framework should still allow for
ABI compatibility, and things such as lazy operations on collections found here
should still be inlined.

## Opaque result types

While existing collection types are designed without the use of opaque types, we
used them here in any introduced collection types as we don't have the same
backwards compatibility requirements as the standard library.