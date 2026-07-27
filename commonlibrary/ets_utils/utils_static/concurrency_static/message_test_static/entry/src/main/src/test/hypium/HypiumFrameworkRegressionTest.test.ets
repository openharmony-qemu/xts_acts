'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, Core, TestType, Size, Level, AssertResult } from '../../../../hypium';
import { HypiumValue, CustomAssert } from '../../../../hypium/module/types/common';
import { ExpectService } from '../../../../hypium/module/service/ExpectService';

class HypiumRegressionValue {
  value: int = 1;
}

const customEquality: CustomAssert = (actualValue: HypiumValue, expectedValues: HypiumValue[]): AssertResult => {
  const pass = expectedValues.length === 1 && actualValue === expectedValues[0];
  return {
    pass,
    message: pass ? '' : 'Values are not equal',
  };
};

export default function HypiumFrameworkRegressionTest(): void {
  describe('HypiumFrameworkRegressionTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   HypiumFrameworkRegressionTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_HYPIUM_REGRESSION_TEST_0100
     * @tc.desc   Verify custom assertion registration and removal use an explicit matcher name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HypiumFrameworkRegressionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const core = Core.getInstance();
      expect(core !== null).assertTrue();
      if (core === null) {
        return;
      }
      const service = core.getDefaultService('expect');
      expect(service instanceof ExpectService).assertTrue();
      if (!(service instanceof ExpectService)) {
        return;
      }
      let registered = false;
      let removed = false;
      try {
        Hypium.registerAssert('customEquality', customEquality);
        registered = service.customMatchers.has('customEquality');
      } finally {
        Hypium.unregisterAssert('customEquality');
        removed = !service.customMatchers.has('customEquality');
      }
      expect(registered).assertTrue();
      expect(removed).assertTrue();
    })

    /**
     * @tc.name   HypiumFrameworkRegressionTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_HYPIUM_REGRESSION_TEST_0200
     * @tc.desc   Verify custom class identity via public instanceof operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HypiumFrameworkRegressionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const value = new HypiumRegressionValue();
      expect(value instanceof HypiumRegressionValue).assertTrue();
      expect(value).assertInstanceOf('Object');
      expect(value.value).assertEqual(1);
    })
  })
}
