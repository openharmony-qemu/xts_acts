/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so';

export default function CustomDialogHandednessTest() {
  describe('CustomDialogHandednessTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_HANDEDNESS_0100
     * @tc.number SUB_ARKUI_CAPI_HANDEDNESS_0100
     * @tc.desc   HandednessMode enum NONE/FOLLOW_ANCHOR/FOLLOW_GRIP_HAND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_HANDEDNESS_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testHandednessModeEnumValues001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_HANDEDNESS_0200
     * @tc.number SUB_ARKUI_CAPI_HANDEDNESS_0200
     * @tc.desc   SetAdaptToHandedness NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_HANDEDNESS_0200', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetAdaptToHandedness001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_HANDEDNESS_0300
     * @tc.number SUB_ARKUI_CAPI_HANDEDNESS_0300
     * @tc.desc   SetAdaptToHandedness FOLLOW_ANCHOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_HANDEDNESS_0300', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetAdaptToHandedness002()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_HANDEDNESS_0400
     * @tc.number SUB_ARKUI_CAPI_HANDEDNESS_0400
     * @tc.desc   SetAdaptToHandedness FOLLOW_GRIP_HAND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_HANDEDNESS_0400', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetAdaptToHandedness003()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_HANDEDNESS_0500
     * @tc.number SUB_ARKUI_CAPI_HANDEDNESS_0500
     * @tc.desc   SetAdaptToHandedness null handle returns invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_HANDEDNESS_0500', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetAdaptToHandedness004()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_HANDEDNESS_0600
     * @tc.number SUB_ARKUI_CAPI_HANDEDNESS_0600
     * @tc.desc   SetAdaptToHandednessInOptions NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_HANDEDNESS_0600', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetAdaptToHandednessInOptions001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_HANDEDNESS_0700
     * @tc.number SUB_ARKUI_CAPI_HANDEDNESS_0700
     * @tc.desc   SetAdaptToHandednessInOptions FOLLOW_ANCHOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_HANDEDNESS_0700', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetAdaptToHandednessInOptions002()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_HANDEDNESS_0800
     * @tc.number SUB_ARKUI_CAPI_HANDEDNESS_0800
     * @tc.desc   SetAdaptToHandednessInOptions FOLLOW_GRIP_HAND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_HANDEDNESS_0800', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetAdaptToHandednessInOptions003()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_HANDEDNESS_0900
     * @tc.number SUB_ARKUI_CAPI_HANDEDNESS_0900
     * @tc.desc   SetAdaptToHandednessInOptions null options returns invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_HANDEDNESS_0900', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetAdaptToHandednessInOptions004()).assertEqual(0);
      done();
    });
  });
}
