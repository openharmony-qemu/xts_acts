'use static';
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class ConcatItemExt {
  value: int = 0;

  constructor(v: int) {
    this.value = v;
  }
}

class OptItem121 {
  id: int = 0;
  name?: string;
}

interface LitItem121 {
  a: int;
  b: string;
}

interface IdItem121 {
  id: int;
}

class IdImpl121 implements IdItem121 {
  id: int = 0;

  constructor(id: int) {
    this.id = id;
  }
}

type IntFn121 = (x: int) => int;

class ComboObjarr {
  id: int = 1;
}

/** Custom ConcatArray<int> implementation for static-semantics coverage. */
class CustomConcatArr172 implements ConcatArray<int> {
  private readonly data: Array<int>;

  constructor(data: Array<int>) {
    this.data = [...data];
  }

  get length(): int {
    return this.data.length;
  }

  $_get(index: int): int {
    return this.data[index];
  }

  $_iterator(): IterableIterator<int> {
    return this.data.$_iterator();
  }

  at(index: int): int | undefined {
    if (index < 0 || index >= this.data.length) {
      return undefined;
    }
    return this.data[index];
  }

  join(separator?: String): string {
    return this.data.join(separator);
  }

  slice(start?: int, end?: int): Array<int> {
    return this.data.slice(start, end);
  }
}

export default function ReadonlyArrayConcatTest002(): void {
  describe('ReadonlyArrayConcatTest002', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0950
     * @tc.name testReadonlyArrayConcat095
     * @tc.desc Verify ReadonlyArray.concat behavior: concat XSS script tag strings preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["<script>alert(1)</script>"];
      const more: ConcatArray<string> = ["<img onerror=alert(1)>"];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("<script>alert(1)</script>");
      expect(result[1]).assertEqual("<img onerror=alert(1)>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0960
     * @tc.name testReadonlyArrayConcat096
     * @tc.desc Verify ReadonlyArray.concat behavior: merge float zero element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<float> = [0.0f];
      const more: ConcatArray<float> = [1.0f];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0.0f);
      expect(result[1]).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0970
     * @tc.name testReadonlyArrayConcat097
     * @tc.desc Verify ReadonlyArray.concat behavior: merge float negative zero element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<float> = [-0.0f];
      const more: ConcatArray<float> = [1.0f];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(-0.0f);
      expect(result[1]).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0980
     * @tc.name testReadonlyArrayConcat098
     * @tc.desc Verify ReadonlyArray.concat behavior: merge float NaN element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const values: ReadonlyArray<float> = [nan];
      const more: ConcatArray<float> = [2.0f];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(Number.isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(2.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0990
     * @tc.name testReadonlyArrayConcat099
     * @tc.desc Verify ReadonlyArray.concat behavior: merge float positive infinity element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: float = Double.toFloat(Number.POSITIVE_INFINITY);
      const values: ReadonlyArray<float> = [inf];
      const more: ConcatArray<float> = [1.0f];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(inf);
      expect(result[1]).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1000
     * @tc.name testReadonlyArrayConcat100
     * @tc.desc Verify ReadonlyArray.concat behavior: merge float negative infinity element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninf: float = Double.toFloat(Number.NEGATIVE_INFINITY);
      const values: ReadonlyArray<float> = [ninf];
      const more: ConcatArray<float> = [1.0f];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(ninf);
      expect(result[1]).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1010
     * @tc.name testReadonlyArrayConcat101
     * @tc.desc Verify ReadonlyArray.concat behavior: merge float MIN_VALUE element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: float = Double.toFloat(Number.MIN_VALUE);
      const values: ReadonlyArray<float> = [minVal];
      const more: ConcatArray<float> = [1.0f];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(minVal);
      expect(result[1]).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1020
     * @tc.name testReadonlyArrayConcat102
     * @tc.desc Verify ReadonlyArray.concat behavior: merge double zero element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<double> = [0.0];
      const more: ConcatArray<double> = [2.2];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0.0);
      expect(result[1]).assertEqual(2.2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1030
     * @tc.name testReadonlyArrayConcat103
     * @tc.desc Verify ReadonlyArray.concat behavior: merge double NaN element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<double> = [Number.NaN];
      const more: ConcatArray<double> = [3.3];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(Number.isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(3.3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1040
     * @tc.name testReadonlyArrayConcat104
     * @tc.desc Verify ReadonlyArray.concat behavior: merge double near max value element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nearMax: double = 1.7976931348623157E308;
      const values: ReadonlyArray<double> = [nearMax];
      const more: ConcatArray<double> = [1.0];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(nearMax);
      expect(result[1]).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1050
     * @tc.name testReadonlyArrayConcat105
     * @tc.desc Verify ReadonlyArray.concat behavior: empty ReadonlyArray concat empty ConcatArray returns new empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const empty: ConcatArray<int> = [];
      const result = values.concat(empty);
      expect(result.length).assertEqual(0);
      expect(result === values).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1060
     * @tc.name testReadonlyArrayConcat106
     * @tc.desc Verify ReadonlyArray.concat behavior: chained concat calls produce correct result with distinct references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1];
      const r1: Array<int> = values.concat([2] as ConcatArray<int>);
      const r2: Array<int> = r1.concat([3] as ConcatArray<int>);
      expect(r2.length).assertEqual(3);
      expect(r2[0]).assertEqual(1);
      expect(r2[1]).assertEqual(2);
      expect(r2[2]).assertEqual(3);
      expect(r1 === r2).assertFalse();
      expect(values === r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1070
     * @tc.name testReadonlyArrayConcat107
     * @tc.desc Verify ReadonlyArray.concat behavior: concat two - dimensional nested arrays without flattening inner layer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1: Array<int> = [1, 2];
      const inner2: Array<int> = [3, 4];
      const values: ReadonlyArray<Array<int>> = [inner1];
      const more: ConcatArray<Array<int>> = [inner2];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0] === inner1).assertTrue();
      expect(result[1] === inner2).assertTrue();
      expect(result[0][0]).assertEqual(1);
      expect(result[1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1080
     * @tc.name testReadonlyArrayConcat108
     * @tc.desc Verify ReadonlyArray.concat behavior: concat three - layer nested arrays preserves deep structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const layer3: Array<int> = [9];
      const layer2: Array<Array<int>> = [layer3];
      const values: ReadonlyArray<Array<Array<int>>> = [layer2];
      const more: ConcatArray<Array<Array<int>>> = [];
      const result = values.concat(more);
      expect(result.length).assertEqual(1);
      expect(result[0][0][0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1090
     * @tc.name testReadonlyArrayConcat109
     * @tc.desc Verify ReadonlyArray.concat behavior: concat array containing function references preserves callable elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: IntFn121 = (x: int): int => x + 1;
      const values: ReadonlyArray<IntFn121> = [fn];
      const more: ConcatArray<IntFn121> = [];
      const result = values.concat(more);
      expect(result.length).assertEqual(1);
      expect(result[0](5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1100
     * @tc.name testReadonlyArrayConcat110
     * @tc.desc Verify ReadonlyArray.concat behavior: ConcatArray parameter unchanged after concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1];
      const more: Array<int> = [2, 3];
      values.concat(more as ConcatArray<int>);
      expect(more.length).assertEqual(2);
      expect(more[0]).assertEqual(2);
      expect(more[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1110
     * @tc.name testReadonlyArrayConcat111
     * @tc.desc Verify ReadonlyArray.concat behavior: mutating object element in result reflects in source shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item: ConcatItemExt = new ConcatItemExt(1);
      const values: ReadonlyArray<ConcatItemExt> = [item];
      const result: Array<ConcatItemExt> = values.concat([] as ConcatArray<ConcatItemExt>);
      result[0].value = 99;
      expect(values[0].value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1120
     * @tc.name testReadonlyArrayConcat112
     * @tc.desc Verify ReadonlyArray.concat behavior: mutating primitive element in result does not affect source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const result: Array<int> = values.concat([3] as ConcatArray<int>);
      result[0] = 100;
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(result[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1130
     * @tc.name testReadonlyArrayConcat113
     * @tc.desc Verify ReadonlyArray.concat behavior: assign concat result back to ReadonlyArray variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const more: ConcatArray<int> = [3];
      const merged: ReadonlyArray<int> = values.concat(more) as ReadonlyArray<int>;
      expect(merged.length).assertEqual(3);
      expect(merged[0]).assertEqual(1);
      expect(merged[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1140
     * @tc.name testReadonlyArrayConcat114
     * @tc.desc Verify ReadonlyArray.concat behavior: concat during for - of iteration completes without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let count: int = 0;
      for (const v of values) {
        count++;
        const temp = values.concat([v + 10] as ConcatArray<int>);
        expect(temp.length).assertEqual(4);
        expect(temp[0]).assertEqual(1);
        expect(temp[1]).assertEqual(2);
        expect(temp[2]).assertEqual(3);
        expect(temp[3]).assertEqual(v + 10);
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1150
     * @tc.name testReadonlyArrayConcat115
     * @tc.desc Verify ReadonlyArray.concat behavior: concat from closure captures outer ReadonlyArray correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const makeConcat = (arr: ReadonlyArray<int>, extra: ConcatArray<int>): Array<int> => {
        return arr.concat(extra);
      };
      const values: ReadonlyArray<int> = [10];
      const result = makeConcat(values, [20] as ConcatArray<int>);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1160
     * @tc.name testReadonlyArrayConcat116
     * @tc.desc Verify ReadonlyArray.concat behavior: concat ReadonlyArray with union type number or string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int | string> = [1, "two"];
      const more: ConcatArray<int | string> = [3, "four"];
      const result = values.concat(more);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual("two");
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual("four");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1170
     * @tc.name testReadonlyArrayConcat117
     * @tc.desc Verify ReadonlyArray.concat behavior: concat array containing null elements preserves null positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int | null> = [1, null, 3];
      const more: ConcatArray<int | null> = [null];
      const result = values.concat(more);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(null);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1180
     * @tc.name testReadonlyArrayConcat118
     * @tc.desc Verify ReadonlyArray.concat behavior: concat array containing undefined elements preserves undefined positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int | undefined> = [1, undefined, 3];
      const more: ConcatArray<int | undefined> = [undefined];
      const result = values.concat(more);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(undefined);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1190
     * @tc.name testReadonlyArrayConcat119
     * @tc.desc Verify ReadonlyArray.concat behavior: concat nested ReadonlyArray elements preserves inner references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: ReadonlyArray<int> = [1, 2];
      const innerMore: ReadonlyArray<int> = [3];
      const values: ReadonlyArray<ReadonlyArray<int>> = [inner];
      const more: ConcatArray<ReadonlyArray<int>> = [innerMore];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0] === inner).assertTrue();
      expect(result[1] === innerMore).assertTrue();
      expect(result[0][1]).assertEqual(2);
      expect(result[1][0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1200
     * @tc.name testReadonlyArrayConcat120
     * @tc.desc Verify ReadonlyArray.concat behavior: concat objects with optional properties preserves field state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item: OptItem121 = new OptItem121();
      item.id = 42;
      const values: ReadonlyArray<OptItem121> = [item];
      const result = values.concat([] as ConcatArray<OptItem121>);
      expect(result.length).assertEqual(1);
      expect(result[0].id).assertEqual(42);
      expect(result[0] === item).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1210
     * @tc.name testReadonlyArrayConcat121
     * @tc.desc Verify ReadonlyArray.concat behavior: concat interface - typed object array preserves interface compatibility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: IdImpl121 = new IdImpl121(7);
      const values: ReadonlyArray<IdItem121> = [obj];
      const result = values.concat([] as ConcatArray<IdItem121>);
      expect(result.length).assertEqual(1);
      expect(result[0].id).assertEqual(7);
      expect(result[0] === obj).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1220
     * @tc.name testReadonlyArrayConcat122
     * @tc.desc Verify ReadonlyArray.concat behavior: concat anonymous literal object array preserves structured fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lit: LitItem121 = { a: 1, b: "x" };
      const values: ReadonlyArray<LitItem121> = [lit];
      const more: ConcatArray<LitItem121> = [{ a: 2, b: "y" }];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0].a).assertEqual(1);
      expect(result[0].b).assertEqual("x");
      expect(result[1].a).assertEqual(2);
      expect(result[1].b).assertEqual("y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1230
     * @tc.name testReadonlyArrayConcat123
     * @tc.desc Verify ReadonlyArray.concat behavior: concat with ten ConcatArray parameters merges in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0];
      const result = values.concat(
        [1] as ConcatArray<int>,
        [2] as ConcatArray<int>,
        [3] as ConcatArray<int>,
        [4] as ConcatArray<int>,
        [5] as ConcatArray<int>,
        [6] as ConcatArray<int>,
        [7] as ConcatArray<int>,
        [8] as ConcatArray<int>,
        [9] as ConcatArray<int>,
        [10] as ConcatArray<int>
      );
      expect(result.length).assertEqual(11);
      for (let i: int = 0; i < result.length; i++) {
        expect(result[i]).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1240
     * @tc.name testReadonlyArrayConcat124
     * @tc.desc Verify ReadonlyArray.concat behavior: repeated concat in loop returns consistent two - element results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1];
      for (let i: int = 0; i < 100; i++) {
        const temp = values.concat([i] as ConcatArray<int>);
        expect(temp.length).assertEqual(2);
        expect(temp[0]).assertEqual(1);
        expect(temp[1]).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1250
     * @tc.name testReadonlyArrayConcat125
     * @tc.desc Verify ReadonlyArray.concat behavior: fifty - layer chained concat appends elements without stack overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let acc: Array<int> = [1];
      const more: ConcatArray<int> = [2];
      for (let i: int = 0; i < 50; i++) {
        acc = acc.concat(more);
      }
      expect(acc.length).assertEqual(51);
      expect(acc[0]).assertEqual(1);
      for (let i: int = 1; i < acc.length; i++) {
        expect(acc[i]).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1260
     * @tc.name testReadonlyArrayConcat126
     * @tc.desc Verify ReadonlyArray.concat behavior: mixed concat with empty and non - empty parameters deep - equals expected sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1];
      const a: ConcatArray<int> = [2, 3];
      const b: ConcatArray<int> = [];
      const c: ConcatArray<int> = [4];
      const result = values.concat(a, b, c);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1270
     * @tc.name testReadonlyArrayConcat127
     * @tc.desc Verify ReadonlyArray.concat behavior: parameter count - calling without items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.concat();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result !== values).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1280
     * @tc.name testReadonlyArrayConcat128
     * @tc.desc Verify ReadonlyArray.concat behavior: parameter count - passing one array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const more: ConcatArray<int> = [3, 4];
      const result = values.concat(more);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(values.length).assertEqual(2);
      expect(more.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1290
     * @tc.name testReadonlyArrayConcat129
     * @tc.desc Verify ReadonlyArray.concat behavior: parameter count - passing multiple arrays - order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1];
      const result = values.concat([2] as ConcatArray<int>, [3, 4] as ConcatArray<int>);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1300
     * @tc.name testReadonlyArrayConcat130
     * @tc.desc Verify ReadonlyArray.concat behavior: parameter content - empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const result = values.concat([] as ConcatArray<int>);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result !== values).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1310
     * @tc.name testReadonlyArrayConcat131
     * @tc.desc Verify ReadonlyArray.concat behavior: parameter content - concatenating array containing null - null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string | null> = ["a"];
      const result = values.concat([null] as ConcatArray<string | null>);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1320
     * @tc.name testReadonlyArrayConcat132
     * @tc.desc Verify ReadonlyArray.concat behavior: special elements - undefined - undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int | undefined> = [1];
      const result = values.concat([undefined] as ConcatArray<int | undefined>);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1330
     * @tc.name testReadonlyArrayConcat133
     * @tc.desc Verify ReadonlyArray.concat behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      const result = arr.concat([4] as ConcatArray<int>);
      expect(result.length).assertEqual(4);
      expect(arr.length).assertEqual(before);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1340
     * @tc.name testReadonlyArrayConcat134
     * @tc.desc Verify ReadonlyArray.concat behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
      */
    it('testReadonlyArrayConcat134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      const result = arr.concat([] as ConcatArray<int>);
      expect(arr.length).assertEqual(2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1350
     * @tc.name testReadonlyArrayConcat135
     * @tc.desc Verify ReadonlyArray.concat behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valuesSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        valuesSource.push(i);
      }
      const values: ReadonlyArray<int> = valuesSource as ReadonlyArray<int>;
      const result = values.concat([9999] as ConcatArray<int>);
      expect(result.length).assertEqual(1025);
      expect(values.length).assertEqual(1024);
      expect(result[0]).assertEqual(0);
      expect(result[1023]).assertEqual(1023);
      expect(result[1024]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1360
     * @tc.name testReadonlyArrayConcat136
     * @tc.desc Verify ReadonlyArray.concat behavior: call consistency - two consecutive calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1];
      const r1 = arr.concat([2] as ConcatArray<int>);
      const r2 = arr.concat([2] as ConcatArray<int>);
      expect(r1.length).assertEqual(r2.length);
      expect(r1[0]).assertEqual(1);
      expect(r1[1]).assertEqual(2);
      expect(r2[0]).assertEqual(1);
      expect(r2[1]).assertEqual(2);
      expect(r1 === r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1370
     * @tc.name testReadonlyArrayConcat137
     * @tc.desc Verify ReadonlyArray.concat behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      expect(arr.length).assertEqual(3);
      const result = arr.concat([4] as ConcatArray<int>);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
      expect(source.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1380
     * @tc.name testReadonlyArrayConcat138
     * @tc.desc Verify ReadonlyArray.concat behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.concat([99] as ConcatArray<int>);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(99);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1390
     * @tc.name testReadonlyArrayConcat139
     * @tc.desc Verify ReadonlyArray.concat behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];

      const result = arr.concat(["x"] as ConcatArray<string>);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("");
      expect(result[3]).assertEqual("x");
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1400
     * @tc.name testReadonlyArrayConcat140
     * @tc.desc Verify ReadonlyArray.concat behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = [" ", "emoji", "long-text"];

      const result = arr.concat(["x"] as ConcatArray<string>);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(" ");
      expect(result[1]).assertEqual("emoji");
      expect(result[2]).assertEqual("long-text");
      expect(result[3]).assertEqual("x");
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1410
     * @tc.name testReadonlyArrayConcat141
     * @tc.desc Verify ReadonlyArray.concat behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];

      const result = arr.concat([true] as ConcatArray<boolean>);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
      expect(result[2]).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1420
     * @tc.name testReadonlyArrayConcat142
     * @tc.desc Verify ReadonlyArray.concat behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];

      const result = arr.concat([99.0] as ConcatArray<double>);
      expect(result.length).assertEqual(4);
      expect(Number.isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(0.0);
      expect(result[2]).assertEqual(-0.0);
      expect(result[3]).assertEqual(99.0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1430
     * @tc.name testReadonlyArrayConcat143
     * @tc.desc Verify ReadonlyArray.concat behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const obj3: ComboObjarr = new ComboObjarr();
      obj3.id = 3;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];

      const result = arr.concat([obj3] as ConcatArray<ComboObjarr>);
      expect(result.length).assertEqual(3);
      expect(result[0] === obj1).assertTrue();
      expect(result[1] === obj2).assertTrue();
      expect(result[2] === obj3).assertTrue();
      expect(result[0].id).assertEqual(1);
      expect(result[1].id).assertEqual(2);
      expect(result[2].id).assertEqual(3);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1440
     * @tc.name testReadonlyArrayConcat144
     * @tc.desc Verify ReadonlyArray.concat behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const extra: Array<int> = [9];
      const before: int = arr.length;
      const result = arr.concat([extra] as ConcatArray<Array<int>>);
      expect(result.length).assertEqual(3);
      expect(arr.length).assertEqual(before);
      expect(result[0][0]).assertEqual(1);
      expect(result[1][0]).assertEqual(2);
      expect(result[1][1]).assertEqual(3);
      expect(result[2] === extra).assertTrue();
      expect(result[2][0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1450
     * @tc.name testReadonlyArrayConcat145
     * @tc.desc Verify ReadonlyArray.concat behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const before: int = arr.length;
      const result = arr.concat([99] as ConcatArray<int>);
      expect(result.length).assertEqual(4);
      expect(arr.length).assertEqual(before);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1460
     * @tc.name testReadonlyArrayConcat146
     * @tc.desc Verify ReadonlyArray.concat behavior: pass ReadonlyArray<T> directly as ConcatArray item via subtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const ro: ReadonlyArray<int> = [3, 4];
      const result = values.concat(ro);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1470
     * @tc.name testReadonlyArrayConcat147
     * @tc.desc Verify ReadonlyArray.concat behavior: self concat where same array passed as item duplicates content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [7, 8, 9];
      const result = values.concat(values as ConcatArray<int>);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(7);
      expect(result[2]).assertEqual(9);
      expect(result[3]).assertEqual(7);
      expect(result[5]).assertEqual(9);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1480
     * @tc.name testReadonlyArrayConcat148
     * @tc.desc Verify ReadonlyArray.concat behavior: mutating source Array after concat does not change result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [1, 2, 3];
      const more: Array<int> = [4, 5];
      const ro: ReadonlyArray<int> = src as ReadonlyArray<int>;
      const result = ro.concat(more as ConcatArray<int>);
      expect(result.length).assertEqual(5);
      more.push(99);
      src.push(88);
      expect(result.length).assertEqual(5);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1490
     * @tc.name testReadonlyArrayConcat149
     * @tc.desc Verify ReadonlyArray.concat behavior: same ConcatArray reference passed multiple times produces ordered duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0];
      const more: ConcatArray<int> = [1, 2];
      const result = values.concat(more, more, more);
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(1);
      expect(result[4]).assertEqual(2);
      expect(result[5]).assertEqual(1);
      expect(result[6]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1500
     * @tc.name testReadonlyArrayConcat150
     * @tc.desc Verify ReadonlyArray.concat behavior: empty original concat with multiple empty items returns empty new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const a: ConcatArray<int> = [];
      const b: ConcatArray<int> = [];
      const c: ConcatArray<int> = [];
      const result = values.concat(a, b, c);
      expect(result.length).assertEqual(0);
      expect(result === values).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1510
     * @tc.name testReadonlyArrayConcat151
     * @tc.desc Verify ReadonlyArray.concat behavior: result usable as Array supports indexOf chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20];
      const more: ConcatArray<int> = [30, 40];
      const result: Array<int> = values.concat(more);
      expect(result.indexOf(30)).assertEqual(2);
      expect(result.indexOf(10)).assertEqual(0);
      expect(result.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1520
     * @tc.name testReadonlyArrayConcat152
     * @tc.desc Verify ReadonlyArray.concat behavior: total length equals sum of source plus all items with five mixed args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const a: ConcatArray<int> = [3];
      const b: ConcatArray<int> = [];
      const c: ConcatArray<int> = [4, 5, 6];
      const d: ConcatArray<int> = [7];
      const e: ConcatArray<int> = [];
      const result = values.concat(a, b, c, d, e);
      const expected: int = values.length + a.length + b.length + c.length + d.length + e.length;
      expect(result.length).assertEqual(expected);
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
      expect(result[5]).assertEqual(6);
      expect(result[6]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1530
     * @tc.name testReadonlyArrayConcat153
     * @tc.desc Verify ReadonlyArray.concat behavior: mutating returned Array elements does not affect underlying source Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [10, 20, 30];
      const ro: ReadonlyArray<int> = src as ReadonlyArray<int>;
      const result: Array<int> = ro.concat([] as ConcatArray<int>);
      result[0] = 999;
      expect(result[0]).assertEqual(999);
      expect(src[0]).assertEqual(10);
      expect(ro[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1540
     * @tc.name testReadonlyArrayConcat154
     * @tc.desc Verify ReadonlyArray.concat behavior: nested array shallow copy element identity across two separate items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sub1: Array<int> = [1, 2];
      const sub2: Array<int> = [3, 4];
      const values: ReadonlyArray<Array<int>> = [sub1];
      const more: ConcatArray<Array<int>> = [sub2];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0] === sub1).assertTrue();
      expect(result[1] === sub2).assertTrue();
      sub1.push(99);
      expect(result[0].length).assertEqual(3);
      expect(result[0][2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1550
     * @tc.name testReadonlyArrayConcat155
     * @tc.desc Verify ReadonlyArray.concat behavior: twenty ConcatArray arguments all merged in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0];
      const result = values.concat(
        [1] as ConcatArray<int>, [2] as ConcatArray<int>, [3] as ConcatArray<int>, [4] as ConcatArray<int>,
        [5] as ConcatArray<int>, [6] as ConcatArray<int>, [7] as ConcatArray<int>, [8] as ConcatArray<int>,
        [9] as ConcatArray<int>, [10] as ConcatArray<int>, [11] as ConcatArray<int>, [12] as ConcatArray<int>,
        [13] as ConcatArray<int>, [14] as ConcatArray<int>, [15] as ConcatArray<int>, [16] as ConcatArray<int>,
        [17] as ConcatArray<int>, [18] as ConcatArray<int>, [19] as ConcatArray<int>, [20] as ConcatArray<int>
      );
      expect(result.length).assertEqual(21);
      expect(result[0]).assertEqual(0);
      expect(result[10]).assertEqual(10);
      expect(result[20]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1560
     * @tc.name testReadonlyArrayConcat156
     * @tc.desc Verify ReadonlyArray.concat behavior: user-defined ConcatArray implementation merges as a regular ConcatArray argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const custom: ConcatArray<int> = new CustomConcatArr172([3, 4, 5]);
      const result = values.concat(custom);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result === values).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1570
     * @tc.name testReadonlyArrayConcat157
     * @tc.desc Verify ReadonlyArray.concat behavior: self-concat using same source as multiple arguments produces correct repeated sequence without mutating source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const sameRef: ConcatArray<int> = values as ConcatArray<int>;
      const result = values.concat(sameRef, sameRef);
      expect(result.length).assertEqual(9);
      const expected: Array<int> = [1, 2, 3, 1, 2, 3, 1, 2, 3];
      for (let i: int = 0; i < expected.length; i++) {
        expect(result[i]).assertEqual(expected[i]);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[2]).assertEqual(3);
      expect(result === values).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_1580
     * @tc.name testReadonlyArrayConcat158
     * @tc.desc Verify ReadonlyArray.concat behavior: heterogeneous element concat under ReadonlyArray<Object> — values holding mixed string/int/boolean elements concats with ConcatArray<Object> holding mixed double/string elements; order, types and identities preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sObj: Object = "head" as Object;
      const iObj: Object = (42 as Int) as Object;
      const bObj: Object = (true as Boolean) as Object;
      const dObj: Object = (3.14 as Double) as Object;
      const tailObj: Object = "tail" as Object;
      const values: ReadonlyArray<Object> = [sObj, iObj, bObj];
      const more: ConcatArray<Object> = [dObj, tailObj];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0] === sObj).assertTrue();
      expect(result[1] === iObj).assertTrue();
      expect(result[2] === bObj).assertTrue();
      expect(result[3] === dObj).assertTrue();
      expect(result[4] === tailObj).assertTrue();
      expect(result === values).assertFalse();
    });

  });
}
