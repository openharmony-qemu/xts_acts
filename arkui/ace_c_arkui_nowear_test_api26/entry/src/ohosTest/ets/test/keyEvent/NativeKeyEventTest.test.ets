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

export default function NativeKeyEventTest() {

  describe('NativeKeyEventTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_KEYEVENT_FUNCTIONAL_0100
     * @tc.name   KeyEventFunctionalTest001
     * @tc.desc   End-to-end functional verification: Create key event, set all
     *             properties, verify via Get and Is readback, then Destroy
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('KeyEventFunctionalTest001', Level.LEVEL0, async (done: Function) => {
      console.info('[KeyEventFunctionalTest001] START');
      expect(nativeFunc.KeyEventFunctionalTest001()).assertEqual(0);
      console.info('[KeyEventFunctionalTest001] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_KEYEVENT_CREATE_DESTROY_0100
     * @tc.name   KeyEventCreateDestroyTest001
     * @tc.desc   Create valid key event then destroy, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('KeyEventCreateDestroyTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[KeyEventCreateDestroyTest001] START');
      expect(nativeFunc.KeyEventCreateDestroyTest001()).assertEqual(0);
      console.info('[KeyEventCreateDestroyTest001] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_KEYEVENT_CREATE_DESTROY_0200
     * @tc.name   KeyEventCreateDestroyTest002
     * @tc.desc   Create with NULL event pointer, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('KeyEventCreateDestroyTest002', Level.LEVEL2, async (done: Function) => {
      console.info('[KeyEventCreateDestroyTest002] START');
      expect(nativeFunc.KeyEventCreateDestroyTest002()).assertEqual(0);
      console.info('[KeyEventCreateDestroyTest002] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_KEYEVENT_CREATE_DESTROY_0300
     * @tc.name   KeyEventCreateDestroyTest003
     * @tc.desc   Destroy when *event is already NULL, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('KeyEventCreateDestroyTest003', Level.LEVEL2, async (done: Function) => {
      console.info('[KeyEventCreateDestroyTest003] START');
      expect(nativeFunc.KeyEventCreateDestroyTest003()).assertEqual(0);
      console.info('[KeyEventCreateDestroyTest003] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_KEYEVENT_SETPROPERTIES_0100
     * @tc.name   KeyEventSetPropertiesTest001
     * @tc.desc   Create + set all 12 properties with valid values + Destroy,
     *             expect all NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('KeyEventSetPropertiesTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[KeyEventSetPropertiesTest001] START');
      expect(nativeFunc.KeyEventSetPropertiesTest001()).assertEqual(0);
      console.info('[KeyEventSetPropertiesTest001] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_KEYEVENT_SETPROPERTIES_0200
     * @tc.name   KeyEventSetPropertiesTest002
     * @tc.desc   SetType with NULL event pointer, expect PARAM_INVALID
     *             (represents event=NULL for all Set* APIs)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('KeyEventSetPropertiesTest002', Level.LEVEL2, async (done: Function) => {
      console.info('[KeyEventSetPropertiesTest002] START');
      expect(nativeFunc.KeyEventSetPropertiesTest002()).assertEqual(0);
      console.info('[KeyEventSetPropertiesTest002] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_KEYEVENT_SETKEYTEXT_0100
     * @tc.name   KeyEventSetKeyTextTest001
     * @tc.desc   SetKeyText with NULL keyText, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('KeyEventSetKeyTextTest001', Level.LEVEL2, async (done: Function) => {
      console.info('[KeyEventSetKeyTextTest001] START');
      expect(nativeFunc.KeyEventSetKeyTextTest001()).assertEqual(0);
      console.info('[KeyEventSetKeyTextTest001] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_KEYEVENT_SETPRESSEDKEYS_0100
     * @tc.name   KeyEventSetPressedKeysTest001
     * @tc.desc   SetPressedKeys with NULL pressedKeyCodes and length=0,
     *             expect NO_ERROR (clears pressed keys)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('KeyEventSetPressedKeysTest001', Level.LEVEL2, async (done: Function) => {
      console.info('[KeyEventSetPressedKeysTest001] START');
      expect(nativeFunc.KeyEventSetPressedKeysTest001()).assertEqual(0);
      console.info('[KeyEventSetPressedKeysTest001] END');
      done();
    })
  })
}
