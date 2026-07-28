/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// ECMA-262 §16.2 Module Semantics
// Pure JavaScript module exports

export const CONST_VAL = 42

export let moduleInitialized = false
moduleInitialized = true

export function exportedFn(a) {
    return a * 2
}

export class ExportedClass {
    constructor() {
        this.value = 10
    }

    getValue() {
        return this.value
    }
}

const localA = 1
const localB = 2

export { localA, localB }

export { localA as renamedA, localB as renamedB }
