/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import nativehuksndk from 'libnativehuksndk.so'

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;

export default function HuksApiTest() {
  describe('HuksApiTest', () => {
    beforeAll(async () => {
      console.info("====>testHuksApiTest start====");
    });
    /**
     * @tc.name   testOH_Huks_AttestKeyItem0100
     * @tc.number SUB_SECURITY_HUKS_OH_Huks_AttestKeyItem_0100
     * @tc.desc   testing OH_Huks_AttestKeyItem interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_Huks_AttestKeyItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_AttestKeyItem0100 start====");
          let result: number = nativehuksndk.AttestKeyItemTest_001();
          console.info(`====>testOH_Huks_AttestKeyItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_AttestKeyItem0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_Huks_AnonAttestKeyItem0100
     * @tc.number SUB_SECURITY_HUKS_OH_Huks_AnonAttestKeyItem_0100
     * @tc.desc   testing OH_Huks_AnonAttestKeyItem interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_Huks_AnonAttestKeyItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_AnonAttestKeyItem0100 start====");
          let result: number = nativehuksndk.AnonAttestKeyItemTest_001();
          console.info(`====>testOH_Huks_AnonAttestKeyItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_AnonAttestKeyItem0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_Huks_AnonAttestKeyItem0200
     * @tc.number SUB_SECURITY_HUKS_OH_Huks_AnonAttestKeyItem_0200
     * @tc.desc   testing OH_Huks_AnonAttestKeyItem interface OH_HUKS_ERR_CODE_ITEM_NOT_EXIST(12000011)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_Huks_AnonAttestKeyItem0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_AnonAttestKeyItem0200 start====");
          let result: number = nativehuksndk.AnonAttestKeyItemTest_002();
          console.info(`====>testOH_Huks_AnonAttestKeyItem0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_AnonAttestKeyItem0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

  })
}