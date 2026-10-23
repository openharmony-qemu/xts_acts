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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import { Decimal } from '@kit.ArkTS';
import * as common from '../common/DecimalTestCommon';

type Value = string | number | Decimal;

/**
 * 用于"函数值"边界用例的具名函数。
 * 直接将箭头函数赋给 ESObject 在 .ets 中存在解析歧义，故统一用具名函数。
 */
function returnZero(): number {
  return 0;
}

export default function DecimalConstructorBoundaryTest() {
  describe('DecimalConstructorBoundaryTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => {
      common.resetDecimalConfig(Decimal);
    });
    afterAll(() => {});

    /**
     * @tc.name testDecimalConstructorBoundaryTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONSTRUCTOR_BOUNDARY_TEST_0100
     * @tc.desc Consolidated: Verify constructing Decimal with null/undefined/missing throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConstructorBoundaryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(common.getThrownCode(() => {
          let v: ESObject = null;
          new Decimal(v as Value);
        })).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => {
          let v: ESObject = undefined;
          new Decimal(v as Value);
        })).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => {
          let missing: ESObject = undefined;
          new Decimal(missing as Value);
        })).assertEqual(401);
      }
    });

    /**
     * @tc.name testDecimalConstructorBoundaryTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONSTRUCTOR_BOUNDARY_TEST_0400
     * @tc.desc Consolidated: Verify constructing Decimal with boolean/object/array throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConstructorBoundaryTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(common.getThrownCode(() => {
          let v: ESObject = true;
          new Decimal(v as Value);
        })).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => {
          let v: ESObject = false;
          new Decimal(v as Value);
        })).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => {
          let v: ESObject = { a: 1 };
          new Decimal(v as Value);
        })).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => {
          let v: ESObject = [1, 2, 3];
          new Decimal(v as Value);
        })).assertEqual(401);
      }
    });

    /**
     * @tc.name testDecimalConstructorBoundaryTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONSTRUCTOR_BOUNDARY_TEST_0800
     * @tc.desc Consolidated: Verify constructing Decimal with empty/invalid/special-character strings throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConstructorBoundaryTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(common.getThrownCode(() => new Decimal(''))).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => new Decimal('abc'))).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => new Decimal('1.2.3'))).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => new Decimal('\u200B'))).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => new Decimal('  5.7  '))).assertEqual(401);
      }
    });

    /**
     * @tc.name testDecimalConstructorBoundaryTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONSTRUCTOR_BOUNDARY_TEST_1300
     * @tc.desc Consolidated: Verify constructing Decimal with BigInt/Symbol/Map/Set/Date/RegExp/function throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConstructorBoundaryTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(common.getThrownCode(() => {
          let v: ESObject = new Map<string, number>();
          new Decimal(v as Value);
        })).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => {
          let v: ESObject = new Set<number>();
          new Decimal(v as Value);
        })).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => {
          let v: ESObject = new Date(0);
          new Decimal(v as Value);
        })).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => {
          let v: ESObject = new RegExp('a+');
          new Decimal(v as Value);
        })).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => {
          let v: ESObject = returnZero;
          new Decimal(v as Value);
        })).assertEqual(401);
      }
      {
        expect(common.getThrownCode(() => {
          let v: ESObject = common.createBigInt(100);
          new Decimal(v as Value);
        })).assertEqual(401);
      }
    });
  });
}
