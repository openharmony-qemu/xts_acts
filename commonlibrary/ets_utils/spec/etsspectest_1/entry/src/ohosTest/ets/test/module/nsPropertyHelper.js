// Helper for namespace property tests
// ArkTS: no Object.keys, Object.isFrozen, Object.getPrototypeOf, Symbol, in operator

export function checkNsPrototypeNull(ns) {
    return Object.getPrototypeOf(ns) === null
}

export function checkNsFrozen(ns) {
    return Object.isFrozen(ns)
}

export function checkNsHasKey(ns, key) {
    return key in ns
}

export function checkNsToStringTag(ns) {
    return ns[Symbol.toStringTag] === 'Module'
}

export function getNsPropertyDescriptor(ns, key) {
    const desc = Object.getOwnPropertyDescriptor(ns, key)
    return desc
}
