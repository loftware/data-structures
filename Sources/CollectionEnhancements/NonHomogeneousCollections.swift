import Either

extension Sequence {
    /// Returns a sequence of `Either`s containing `.left`s of the elements of
    /// this sequence, followed by `.right`s of the elements of the `other`
    /// sequence.
    ///
    /// Order is guaranteed to be preserved for sequences that produce their
    /// elements in a specific order.
    ///
    /// In this example, an array of numbers is concatenated with a set of
    /// strings.
    ///
    ///     let first: Array<Int> = [1]
    ///     let second: Set<String> = ["hello"]
    ///     for value in first.joined(withNonHomegenous: second) {
    ///         print(value)
    ///     }
    ///     // Prints "Either<Int,String>(left(1))" then
    ///     // "Either<Int,String>(right("hello"))"
    ///
    /// - Returns: A concatenation of the elements of this set, and the given
    ///   `other` set.
    @inlinable // lazy-performance
    public func joined<Other: Sequence>(withNonHomegeneous other: Other)
    -> some Sequence {
        let lSeq = self.map { Either($0, or: Other.Element.self) }
        let rSeq = other.map { Either(right: $0, orLeft: Self.Element.self) }
        return ConcatenatedSequence(lSeq, then: rSeq)
    }
}

extension LazySequenceProtocol {
    /// Returns a lazy sequence of `Either`s containing `.left`s of the elements
    /// of this sequence, followed by `.right`s of the elements of the `other`
    /// sequence.
    ///
    /// Order is guaranteed to be preserved for sequences that produce their
    /// elements in a specific order.
    @inlinable // lazy-performance
    public func joined<Other: Sequence>(withNonHomegeneous other: Other)
    -> some LazySequenceProtocol {
        let lSeq = self.lazy.map { Either($0, or: Other.Element.self) }
        let rSeq = other.lazy.map {
            Either(right: $0, orLeft: Self.Element.self)
        }
        return ConcatenatedSequence(lSeq, then: rSeq).lazy
    }
}

extension Sequence {
    func lefts<L, R>() -> [L] where Self.Element == Either<L, R> {
        return self
            .filter {
                if case .left(_) = $0 { return true } else { return false }
            }
            .map { $0.forceUnwrapLeft() }
    }

    func rights<L, R>() -> [R] where Self.Element == Either<L, R> {
        return self
            .filter {
                if case .right(_) = $0 { return true } else { return false }
            }
            .map { $0.forceUnwrapRight() }
    }
}

extension LazySequenceProtocol {
    func lefts<L, R>() -> some LazySequenceProtocol
    where Self.Element == Either<L, R> {
        return self.lazy
            .filter {
                if case .left(_) = $0 { return true } else { return false }
            }
            .map { $0.forceUnwrapLeft() }
    }

    func rights<L, R>() -> some LazySequenceProtocol
    where Self.Element == Either<L, R> {
        return self.lazy
            .filter {
                if case .right(_) = $0 { return true } else { return false }
            }
            .map { $0.forceUnwrapRight() }
    }
}