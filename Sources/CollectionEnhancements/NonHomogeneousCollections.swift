import Either


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