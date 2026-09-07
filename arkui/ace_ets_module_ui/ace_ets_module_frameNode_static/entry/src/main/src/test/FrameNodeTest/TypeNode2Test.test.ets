'use static';

/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@ohos.UiTest';

const SLEEP_TIME = 1000;

export default function TypeNode2Test() {
  describe('TypeNode2Test', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] TypeNode2Test beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.frameNode.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = { url: 'MainAbility/pages/FrameNode/TypeNode2' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (pages.name !== "TypeNodeIndex2") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('[ARKUI_NEW] TypeNode2Test replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(SLEEP_TIME);
    });

    /**
     * @tc.name   TypeNode2Test_static_0100
     * @tc.number SUB_ARKUI_ACE_TypeNode2Test_static_0100
     * @tc.desc   Verify TypeNode2 test page renders with root node visible in inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('TypeNode2Test_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('typeNode2Root'));
        expect(node != null && node != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.name   TypeNode2Test_static_0200
     * @tc.number SUB_ARKUI_ACE_TypeNode2Test_static_0200
     * @tc.desc   Verify ComponentContentBase is accessible as base class of ComponentContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('TypeNode2Test_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn2_ComponentContentBase');
        console.info('[ARKUI_NEW] tn2_ComponentContentBase = ' + val);
        expect(val).assertEqual('ok');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.name   TypeNode2Test_static_0300
     * @tc.number SUB_ARKUI_ACE_TypeNode2Test_static_0300
     * @tc.desc   Verify Content is accessible as base class of ComponentContentBase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('TypeNode2Test_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn2_Content');
        console.info('[ARKUI_NEW] tn2_Content = ' + val);
        expect(val).assertEqual('ok');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.name   TypeNode2Test_static_0400
     * @tc.number SUB_ARKUI_ACE_TypeNode2Test_static_0400
     * @tc.desc   Verify InputEventType works with BuilderNode.postInputEvent via touch event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('TypeNode2Test_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver = Driver.create();
        let component = await driver.findComponent(ON.id('inputEventNodeContainer'));
        if (component != null && component != undefined) {
          await component.click();
          await CommonFunc.sleep(500);
          let val = AppStorage.get<string>('tn2_InputEventType');
          console.info('[ARKUI_NEW] tn2_InputEventType = ' + val);
          expect(val != null && val != undefined).assertTrue();
        } else {
          console.info('[ARKUI_NEW] tn2_InputEventType component not found');
          expect().assertFail();
        }
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.name   TypeNode2Test_static_0500
     * @tc.number SUB_ARKUI_ACE_TypeNode2Test_static_0500
     * @tc.desc   Verify typeNode.createTextClockNode and attribute getter work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('TypeNode2Test_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn2_getTextClockAttribute');
        console.info('[ARKUI_NEW] tn2_getTextClockAttribute = ' + val);
        expect(val).assertEqual('ok');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.name   TypeNode2Test_static_0600
     * @tc.number SUB_ARKUI_ACE_TypeNode2Test_static_0600
     * @tc.desc   Verify typeNode.createTextTimerNode and attribute getter work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('TypeNode2Test_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn2_getTextTimerAttribute');
        console.info('[ARKUI_NEW] tn2_getTextTimerAttribute = ' + val);
        expect(val).assertEqual('ok');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.name   TypeNode2Test_static_0700
     * @tc.number SUB_ARKUI_ACE_TypeNode2Test_static_0700
     * @tc.desc   Verify typeNode.createSymbolGlyphNode and attribute getter work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('TypeNode2Test_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn2_getSymbolGlyphAttribute');
        console.info('[ARKUI_NEW] tn2_getSymbolGlyphAttribute = ' + val);
        expect(val).assertEqual('ok');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.name   TypeNode2Test_static_0800
     * @tc.number SUB_ARKUI_ACE_TypeNode2Test_static_0800
     * @tc.desc   Verify typeNode.createQRCodeNode and attribute getter work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('TypeNode2Test_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn2_getQRCodeAttribute');
        console.info('[ARKUI_NEW] tn2_getQRCodeAttribute = ' + val);
        expect(val).assertEqual('ok');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.name   TypeNode2Test_static_0900
     * @tc.number SUB_ARKUI_ACE_TypeNode2Test_static_0900
     * @tc.desc   Verify typeNode.createBadgeNode and attribute getter work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('TypeNode2Test_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn2_getBadgeAttribute');
        console.info('[ARKUI_NEW] tn2_getBadgeAttribute = ' + val);
        expect(val).assertEqual('ok');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.name   TypeNode2Test_static_1000
     * @tc.number SUB_ARKUI_ACE_TypeNode2Test_static_1000
     * @tc.desc   Verify typeNode.createMarqueeNode and attribute getter work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('TypeNode2Test_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn2_getMarqueeAttribute');
        console.info('[ARKUI_NEW] tn2_getMarqueeAttribute = ' + val);
        expect(val).assertEqual('ok');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.name   TypeNode2Test_static_1100
     * @tc.number SUB_ARKUI_ACE_TypeNode2Test_static_1100
     * @tc.desc   Verify typeNode.createRatingNode and attribute getter work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('TypeNode2Test_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn2_getRatingAttribute');
        console.info('[ARKUI_NEW] tn2_getRatingAttribute = ' + val);
        expect(val).assertEqual('ok');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.name   TypeNode2Test_static_1200
     * @tc.number SUB_ARKUI_ACE_TypeNode2Test_static_1200
     * @tc.desc   Verify typeNode.createSelectNode and attribute getter work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('TypeNode2Test_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn2_getSelectAttribute');
        console.info('[ARKUI_NEW] tn2_getSelectAttribute = ' + val);
        expect(val).assertEqual('ok');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

  });
}
