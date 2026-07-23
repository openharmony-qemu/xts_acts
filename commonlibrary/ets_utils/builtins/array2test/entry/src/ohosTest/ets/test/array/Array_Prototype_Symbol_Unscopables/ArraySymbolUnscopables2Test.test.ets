/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../../Util.test';
import * as ArraySymbolUnscopablesJs from './ArraySymbolUnscopablesTest';

export default function ArraySymbolUnscopables2TestSupplement() {
  describe('ArraySymbolUnscopables2TestSupplement', () => {
    beforeAll(() => {
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /**
     * @tc.name testArraySymbolUnscopablesTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9400
     * @tc.desc The toSorted method must not bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0193()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9500
     * @tc.desc Unscopables does not affect explicit toSorted calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0194()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9600
     * @tc.desc The toSpliced method must not bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0195()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9700
     * @tc.desc Unscopables does not affect explicit toSpliced calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0196()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9800
     * @tc.desc The values method must not bind in with; this is a key scenario for unscopables design
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0197()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9900
     * @tc.desc Unscopables does not affect explicit values calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0198()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9910
     * @tc.desc Verify the unscopables object's prototype is strictly null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0199()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0200
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9911
     * @tc.desc An object with a null prototype is not an instance of Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0200()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0201
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9912
     * @tc.desc An object with a null prototype cannot call methods on Object.prototype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0201()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0202
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9913
     * @tc.desc Verify the unscopables object does not inherit Object.prototype.toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0202()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0203
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9914
     * @tc.desc Verify the unscopables object does not inherit Object.prototype.hasOwnProperty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0203()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0204
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9915
     * @tc.desc Verify the unscopables object does not inherit Object.prototype.constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0204()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0205
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9916
     * @tc.desc Verify the unscopables object does not inherit Object.prototype.isPrototypeOf
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0205()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0206
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9917
     * @tc.desc Because the prototype is null, toString is not in unscopables; toString works normally in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0206()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0207
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9918
     * @tc.desc valueOf is not in unscopables; valueOf can be called normally in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0207()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0208
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9919
     * @tc.desc Nested with statements on arrays each follow unscopables rules
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0208()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0209
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9920
     * @tc.desc Setting keys to false lets keys bind to Array.prototype.keys in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0209()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0210
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9921
     * @tc.desc Setting includes to false lets includes bind to Array.prototype.includes in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0210()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0211
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9922
     * @tc.desc Non-true truthy keys (e.g. 1, "yes") should still be excluded
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0211()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0212
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9923
     * @tc.desc Setting find to 0 (falsy) lets find bind to Array.prototype.find in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0212()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0213
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9924
     * @tc.desc Adding push to unscopables as true makes push unavailable in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0213()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0214
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9925
     * @tc.desc After deleting values from unscopables, values in with should bind to Array.prototype.values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0214()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0215
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9926
     * @tc.desc A sealed array still follows unscopables rules inside with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0215()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0216
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9927
     * @tc.desc When a parameter shares a name with an unscopable property, with should use the parameter value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0216()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0217
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9928
     * @tc.desc Replacing unscopables with a custom null-prototype object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0217()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0218
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9929
     * @tc.desc Replacing unscopables with an empty null-prototype object lets all methods bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0218()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0219
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9930
     * @tc.desc Setting unscopables to undefined lets all properties bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0219()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0220
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9931
     * @tc.desc In strict mode, the unscopables object reference stays the same
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0220()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0221
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9932
     * @tc.desc Ordinary array instances reach Array.prototype[Symbol.unscopables] through the prototype chain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0221()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0222
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9933
     * @tc.desc Array instances follow unscopables rules inside with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0222()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0223
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9934
     * @tc.desc Empty and non-empty arrays share the same unscopables object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0223()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0224
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9935
     * @tc.desc A custom Array subclass should inherit unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0224()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0225
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9936
     * @tc.desc Instances of an Array subclass should follow the same unscopables rules inside with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0225()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0226
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9937
     * @tc.desc A subclass of Array may define its own Symbol.unscopables on the prototype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0226()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0227
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9938
     * @tc.desc Objects created with Object.create(Array.prototype) should inherit unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0227()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0228
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9939
     * @tc.desc Objects created with Object.create(Array.prototype) follow unscopables inside with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0228()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0229
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9940
     * @tc.desc After deleting keys from unscopables, keys in with should bind to Array.prototype.keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0229()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0230
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9941
     * @tc.desc with is a syntax error in strict mode; unrelated to unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0230()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0231
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9942
     * @tc.desc Assigning to Array.prototype[Symbol.unscopables] in strict mode should throw TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0231()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0232
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9943
     * @tc.desc Unscopables behaves normally in non-strict mode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0232()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0233
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9944
     * @tc.desc Non-unscopable methods bind normally in non-strict mode with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0233()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0234
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9945
     * @tc.desc Array.prototype[Symbol.unscopables] is accessible in strict mode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0234()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0235
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9946
     * @tc.desc In strict mode, property values on the unscopables object may be changed (the object is not frozen)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0235()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0236
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9947
     * @tc.desc Excluded methods may still be invoked explicitly via Array.prototype inside with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0236()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0237
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9948
     * @tc.desc An empty array's unscopables object matches that of a non-empty array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0237()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0238
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9949
     * @tc.desc Empty arrays still follow unscopables rules inside with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0238()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0239
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9950
     * @tc.desc Freezing an array does not affect access to unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0239()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0240
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9951
     * @tc.desc A frozen array still follows unscopables rules inside with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0240()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0241
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9952
     * @tc.desc If unscopables is an ordinary object (non-null prototype), toString is incorrectly excluded
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0241()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0242
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9953
     * @tc.desc A string is not an array and does not inherit Array's unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0242()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0243
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9954
     * @tc.desc A Proxy-wrapped array may control the return value of Symbol.unscopables via a get trap
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0243()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0244
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9955
     * @tc.desc When a Proxy returns null for unscopables, all properties bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0244()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0245
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9956
     * @tc.desc When a Proxy returns undefined for unscopables, all properties bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0245()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0246
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9957
     * @tc.desc Ordinary (non-array) objects have no default Symbol.unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0246()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0247
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9958
     * @tc.desc The Arguments object has no Symbol.unscopables property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0247()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0248
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9959
     * @tc.desc TypedArray has its own Symbol.unscopables, distinct from Array's
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0248()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0249
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9960
     * @tc.desc Combining an outer with on an array and an inner with on a plain object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0249()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0250
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9961
     * @tc.desc with uses the Symbol.unscopables key to obtain the exclusion list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0250()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0251
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9962
     * @tc.desc When an object has no Symbol.unscopables, with binds all properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0251()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0252
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9963
     * @tc.desc When an object's Symbol.unscopables is undefined, all properties bind
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0252()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0253
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9964
     * @tc.desc In unscopables, true excludes the property in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0253()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0254
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9965
     * @tc.desc In unscopables, false lets the property bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0254()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0255
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9966
     * @tc.desc In unscopables, undefined (falsy) lets the property bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0255()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0256
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9967
     * @tc.desc In unscopables, 0 (falsy) lets the property bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0256()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0257
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9968
     * @tc.desc In unscopables, an empty string (falsy) lets the property bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0257()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0258
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9969
     * @tc.desc In unscopables, a non-empty object (truthy) excludes the property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0258()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0259
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9970
     * @tc.desc with traverses the prototype chain when looking up properties on the unscopables object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0259()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0260
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9971
     * @tc.desc A null prototype on unscopables ensures properties are not inherited from Object.prototype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0260()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0261
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9972
     * @tc.desc Using an ordinary object (non-null prototype) also excludes methods from Object.prototype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0261()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0262
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9973
     * @tc.desc NaN is falsy; the property should bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0262()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0263
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9974
     * @tc.desc null is falsy; the property should bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0263()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0264
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9975
     * @tc.desc Methods listed in unscopables are unaffected when called as arr.method()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0264()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0265
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9976
     * @tc.desc Calling an unscopable method via call or apply is unaffected
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0265()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0266
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9977
     * @tc.desc Calling an unscopable method via bind is unaffected
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0266()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0267
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9978
     * @tc.desc Inside with, values should resolve to an outer binding, not Array.prototype.values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0267()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0268
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9979
     * @tc.desc length is not in the unscopables list; it is directly accessible in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0268()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0269
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9980
     * @tc.desc Adding a property on Array.prototype[Symbol.unscopables] affects with behavior for all instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0269()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0270
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9981
     * @tc.desc Symbol.iterator is not excluded by unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0270()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0271
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9982
     * @tc.desc for...of is not affected by unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0271()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0272
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9983
     * @tc.desc Methods introduced in ES2015 (find, findIndex, fill, keys, values, entries) are listed in unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0272()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0273
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9984
     * @tc.desc The includes method introduced in ES2016 is in unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0273()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0274
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9985
     * @tc.desc The flat and flatMap methods introduced in ES2019 are in unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0274()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0275
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9986
     * @tc.desc Immutable methods introduced in ES2023 are in unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0275()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0276
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9987
     * @tc.desc Methods already present in ES5 and earlier are not in unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0276()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0277
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9988
     * @tc.desc Simulate ES5-style code using a keys variable inside with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0277()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0278
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9989
     * @tc.desc Simulate ES5-style code using a values variable inside with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0278()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0279
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9990
     * @tc.desc Simulate ES5-style code using an includes variable inside with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0279()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0280
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9991
     * @tc.desc When an outer variable shares a name with an unscopable property, with should use the outer variable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0280()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0281
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9992
     * @tc.desc When an unscopable name is missing externally, with should throw ReferenceError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0281()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0282
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9993
     * @tc.desc Sealing an array does not affect access to unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0282()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0283
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9994
     * @tc.desc When a closure variable shares a name with an unscopable property, with should use the closure variable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0283()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0284
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9995
     * @tc.desc with is not available when strict mode is declared inside the function
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0284()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0285
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9996
     * @tc.desc Runtime changes to the unscopables object should be reflected by subsequent with statements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0285()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0286
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9997
     * @tc.desc An inner with's scopable property shadows an outer with's same-named property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0286()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0287
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9998
     * @tc.desc An inner with falls back to an outer with's scopable property or an outer binding for unscopable names
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0287()).assertEqual(true);
    })
  })
}
