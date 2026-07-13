'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeAll, describe, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';

export default function webAttributeTest(): void {
  describe('webAttributeTest', () => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitonSwitchNextPage', 10);
      inspector.sendEventByKey('webGetLastHitTest', 10, '');
      await Utils.msSleep(3000);
    });

    /**
     * @tc.name   webKeyboardAppearanceModeNoneStatic001
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCEMODE_NONE_STATIC_0100
     * @tc.desc   test WebKeyboardAppearanceMode.NONE_IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webKeyboardAppearanceModeNoneStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitWebKeyboardAppearanceModeNone001', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('webKeyboardAppearanceModeNoneStatic001', true, 2026051101, done);
        inspector.sendEventByKey('webAttributeButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   webKeyboardAppearanceModeImmersiveStatic002
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCEMODE_IMMERSIVE_STATIC_0200
     * @tc.desc   test WebKeyboardAppearanceMode.IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webKeyboardAppearanceModeImmersiveStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitWebKeyboardAppearanceModeImmersive002', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('webKeyboardAppearanceModeImmersiveStatic002', true, 2026051102, done);
        inspector.sendEventByKey('webAttributeButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   webKeyboardAppearanceModeLightStatic003
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCEMODE_LIGHT_STATIC_0300
     * @tc.desc   test WebKeyboardAppearanceMode.LIGHT_IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webKeyboardAppearanceModeLightStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitWebKeyboardAppearanceModeLight003', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('webKeyboardAppearanceModeLightStatic003', true, 2026051103, done);
        inspector.sendEventByKey('webAttributeButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   webKeyboardAppearanceModeDarkStatic004
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCEMODE_DARK_STATIC_0400
     * @tc.desc   test WebKeyboardAppearanceMode.DARK_IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webKeyboardAppearanceModeDarkStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitWebKeyboardAppearanceModeDark004', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('webKeyboardAppearanceModeDarkStatic004', true, 2026051104, done);
        inspector.sendEventByKey('webAttributeButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   webEnableDragStatic005
     * @tc.number SUB_WEB_ENABLEDRAG_STATIC_0500
     * @tc.desc   test WebAttribute.enableDrag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webEnableDragStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitEnableDrag005', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('webEnableDragStatic005', true, 2026051105, done);
        inspector.sendEventByKey('webAttributeButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   webScrollbarLayoutPolicyStatic006
     * @tc.number SUB_WEB_SCROLLBARLAYOUTPOLICY_STATIC_0600
     * @tc.desc   test WebAttribute.scrollbarLayoutPolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webScrollbarLayoutPolicyStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitScrollbarLayoutPolicy006', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('webScrollbarLayoutPolicyStatic006', true, 2026051106, done);
        inspector.sendEventByKey('webAttributeButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   webEnableScrollDirectionalLockStatic007
     * @tc.number SUB_WEB_ENABLESCROLLDIRECTIONALLOCK_STATIC_0700
     * @tc.desc   test WebAttribute.enableScrollDirectionalLock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webEnableScrollDirectionalLockStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitEnableScrollDirectionalLock007', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('webEnableScrollDirectionalLockStatic007', true, 2026051107, done);
        inspector.sendEventByKey('webAttributeButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   webAiSessionOptionsStatic008
     * @tc.number SUB_WEB_AISESSIONOPTIONS_STATIC_0800
     * @tc.desc   test WebAttribute.aiSessionOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webAiSessionOptionsStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitAiSessionOptions008', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('webAiSessionOptionsStatic008', true, 2026051108, done);
        inspector.sendEventByKey('webAttributeButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   webOnInputmethodAttachedStatic009
     * @tc.number SUB_WEB_ONINPUTMETHODATTACHED_STATIC_0900
     * @tc.desc   test WebAttribute.onInputmethodAttached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webOnInputmethodAttachedStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitOnInputmethodAttached009', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('webOnInputmethodAttachedStatic009', true, 2026051109, done);
        inspector.sendEventByKey('webAttributeButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   webKeyboardAppearanceSwitchStatic010
     * @tc.number SUB_WEB_KEYBOARDAPPEARANCE_SWITCH_STATIC_1000
     * @tc.desc   test WebAttribute.keyboardAppearance switch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webKeyboardAppearanceSwitchStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitKeyboardAppearanceSwitch010', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('webKeyboardAppearanceSwitchStatic010', true, 2026051111, done);
        inspector.sendEventByKey('webAttributeButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
