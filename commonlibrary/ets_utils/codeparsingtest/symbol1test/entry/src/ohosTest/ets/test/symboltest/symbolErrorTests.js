/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
export const SymboErrorTestUtils = {

    /**
     * 019. Override RegExp.prototype[Symbol.split] (global effect).
     * Feature: Rewriting RegExp's prototype [Symbol.split] affects all RegExp instances.
     */
    async test019_OverrideRegExpPrototypeSplit() {
        const originalSplit = RegExp.prototype[Symbol.split];

        RegExp.prototype[Symbol.split] = function(str) {
            const original = originalSplit.call(this, str);
            return original.map(item => `PROTOTYPE_${item}`);
        };

        const reg1 = /,/g;
        const reg2 = / /g;
        const result1 = "a,b".split(reg1);
        const result2 = "x y".split(reg2);

       
        RegExp.prototype[Symbol.split] = originalSplit;

        if (JSON.stringify(result1) !== '["PROTOTYPE_a","PROTOTYPE_b"]' || JSON.stringify(result2) !== '["PROTOTYPE_x","PROTOTYPE_y"]') {
            throw new Error(`Test019 failed: Override prototype returned (${JSON.stringify(result1)}, ${JSON.stringify(result2)}) (expected ["PROTOTYPE_a","PROTOTYPE_b"], ["PROTOTYPE_x","PROTOTYPE_y"])`);
        }
        return "Test Passed: OverrideRegExpPrototypeSplitTest019";
    },

};