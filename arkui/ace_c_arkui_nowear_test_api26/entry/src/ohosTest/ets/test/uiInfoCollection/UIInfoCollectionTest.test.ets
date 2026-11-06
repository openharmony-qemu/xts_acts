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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function UIInfoCollectionTest() {

  describe('UIInfoCollectionTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_UIINFOCOLLECTION_REGISTER_0100
     * @tc.name   UIInfoCollectionRegisterObserverTest001
     * @tc.desc   Register observer with valid params then unregister,
     *             expect both return NO_ERROR (or 500 if device lacks symbol)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIInfoCollectionRegisterObserverTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[UIInfoCollectionRegisterObserverTest001] START');
      expect(nativeFunc.UIInfoCollectionRegisterObserverTest001()).assertEqual(0);
      console.info('[UIInfoCollectionRegisterObserverTest001] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIINFOCOLLECTION_REGISTER_0200
     * @tc.name   UIInfoCollectionRegisterObserverTest002
     * @tc.desc   Register observer with NULL uiContext, expect UI_CONTEXT_INVALID
     *             (or 500 if device lacks symbol)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIInfoCollectionRegisterObserverTest002', Level.LEVEL2, async (done: Function) => {
      console.info('[UIInfoCollectionRegisterObserverTest002] START');
      expect(nativeFunc.UIInfoCollectionRegisterObserverTest002()).assertEqual(0);
      console.info('[UIInfoCollectionRegisterObserverTest002] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIINFOCOLLECTION_REGISTER_0300
     * @tc.name   UIInfoCollectionRegisterObserverTest003
     * @tc.desc   Register observer with eventMask=0 (NONE), expect PARAM_INVALID
     *             (or 500 if device lacks symbol)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIInfoCollectionRegisterObserverTest003', Level.LEVEL2, async (done: Function) => {
      console.info('[UIInfoCollectionRegisterObserverTest003] START');
      expect(nativeFunc.UIInfoCollectionRegisterObserverTest003()).assertEqual(0);
      console.info('[UIInfoCollectionRegisterObserverTest003] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIINFOCOLLECTION_REGISTER_0400
     * @tc.name   UIInfoCollectionRegisterObserverTest004
     * @tc.desc   Register observer with NULL callback, expect PARAM_INVALID
     *             (or 500 if device lacks symbol)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIInfoCollectionRegisterObserverTest004', Level.LEVEL2, async (done: Function) => {
      console.info('[UIInfoCollectionRegisterObserverTest004] START');
      expect(nativeFunc.UIInfoCollectionRegisterObserverTest004()).assertEqual(0);
      console.info('[UIInfoCollectionRegisterObserverTest004] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIINFOCOLLECTION_REGISTER_0500
     * @tc.name   UIInfoCollectionRegisterObserverTest005
     * @tc.desc   Register observer with NULL registerID pointer, expect PARAM_INVALID
     *             (or 500 if device lacks symbol)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIInfoCollectionRegisterObserverTest005', Level.LEVEL2, async (done: Function) => {
      console.info('[UIInfoCollectionRegisterObserverTest005] START');
      expect(nativeFunc.UIInfoCollectionRegisterObserverTest005()).assertEqual(0);
      console.info('[UIInfoCollectionRegisterObserverTest005] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIINFOCOLLECTION_UNREGISTER_0100
     * @tc.name   UIInfoCollectionUnregisterObserverTest001
     * @tc.desc   Unregister observer with registerID=0, expect PARAM_INVALID
     *             (or 500 if device lacks symbol)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIInfoCollectionUnregisterObserverTest001', Level.LEVEL2, async (done: Function) => {
      console.info('[UIInfoCollectionUnregisterObserverTest001] START');
      expect(nativeFunc.UIInfoCollectionUnregisterObserverTest001()).assertEqual(0);
      console.info('[UIInfoCollectionUnregisterObserverTest001] END');
      done();
    })
  })
}
