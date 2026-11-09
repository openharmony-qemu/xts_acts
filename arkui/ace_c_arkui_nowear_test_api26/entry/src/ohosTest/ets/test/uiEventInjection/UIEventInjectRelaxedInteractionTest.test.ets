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

export default function UIEventInjectRelaxedInteractionTest() {

  describe('UIEventInjectRelaxedInteractionTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_RELAXED_0100
     * @tc.name   UIEventInjectRelaxedInteractionTest001
     * @tc.desc   Inject relaxed interaction with valid click command and NULL callback,
     *             expect NO_ERROR (or 500 if device lacks symbol)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIEventInjectRelaxedInteractionTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[UIEventInjectRelaxedInteractionTest001] START');
      expect(nativeFunc.UIEventInjectRelaxedInteractionTest001()).assertEqual(0);
      console.info('[UIEventInjectRelaxedInteractionTest001] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_RELAXED_0200
     * @tc.name   UIEventInjectRelaxedInteractionTest002
     * @tc.desc   Inject relaxed interaction with NULL uiContext,
     *             expect UI_CONTEXT_INVALID (or 500 if device lacks symbol)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIEventInjectRelaxedInteractionTest002', Level.LEVEL2, async (done: Function) => {
      console.info('[UIEventInjectRelaxedInteractionTest002] START');
      expect(nativeFunc.UIEventInjectRelaxedInteractionTest002()).assertEqual(0);
      console.info('[UIEventInjectRelaxedInteractionTest002] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIEVENTINJECTION_RELAXED_0300
     * @tc.name   UIEventInjectRelaxedInteractionTest003
     * @tc.desc   Inject relaxed interaction with NULL command,
     *             expect PARAM_INVALID (or 500 if device lacks symbol)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIEventInjectRelaxedInteractionTest003', Level.LEVEL2, async (done: Function) => {
      console.info('[UIEventInjectRelaxedInteractionTest003] START');
      expect(nativeFunc.UIEventInjectRelaxedInteractionTest003()).assertEqual(0);
      console.info('[UIEventInjectRelaxedInteractionTest003] END');
      done();
    })
  })
}
