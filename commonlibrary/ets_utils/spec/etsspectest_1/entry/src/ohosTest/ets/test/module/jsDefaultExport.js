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

const defaultVal = 100

export default defaultVal

export function defaultFn() {
    return 'from-default-fn'
}

export class DefaultClass {
    constructor() {
        this.name = 'default-class'
    }

    getName() {
        return this.name
    }
}

export let mutableVal = 1

export const stableConst = 'stable'

export function stableFn() {
    return 'fn-binding'
}

export function mutateMutableVal() {
    mutableVal = mutableVal + 1
}

export function resetMutableVal() {
    mutableVal = 1
}

let moduleInternal = 'should-not-leak'
