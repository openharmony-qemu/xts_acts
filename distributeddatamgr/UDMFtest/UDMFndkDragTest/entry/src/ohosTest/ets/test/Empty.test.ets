/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'

/**
 * Placeholder suite for devices that do not support the UDMF system
 * capability: it only runs a trivial arithmetic assertion so the test
 * framework still reports a successful pass.
 */
export default function EmptyTest() {
  describe('EmptyTest', () => {
    /**
     * @tc.name   testTheDevicesNotSupportSyscap001
     * @tc.number testTheDevicesNotSupportSyscap001
     * @tc.desc   The Devices not support this stsCap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTheDevicesNotSupportSyscap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      // Trivial arithmetic check: 1 + 2 must equal 3.
      let firstOperand: number = 1;
      let secondOperand: number = 2;
      expect(firstOperand + secondOperand).assertEqual(3);
      // Notify the framework that this placeholder case has finished.
      done();
    });
  })
}
