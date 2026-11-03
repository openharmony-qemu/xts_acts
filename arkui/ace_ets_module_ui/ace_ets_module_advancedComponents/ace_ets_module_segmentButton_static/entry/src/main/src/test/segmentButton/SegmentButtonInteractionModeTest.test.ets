'use static';

/**
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

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '@ohos/hypium-static/src/main/indexStatic';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { UtilsTest, startAbility } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function SegmentButtonInteractionModeTest() {
  describe('SegmentButtonInteractionModeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SegmentButtonInteractionModeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.advanced.segmentButton.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("SegmentButtonInteractionModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segmentButton/SegmentButtonInteractionMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SegmentButtonInteractionMode state pages:" + JSON.stringify(pages));
        if (!("SegmentButtonInteractionMode" == pages.name)) {
          console.info("get SegmentButtonInteractionMode pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SegmentButtonInteractionMode page error:" + err);
        expect().assertFail();
      }
      console.info("SegmentButtonInteractionModeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SegmentButtonInteractionModeTest after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0100
     * @tc.number SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0100
     * @tc.desc   AC-1: V1 Tab FOLLOWING_DRAG mode, interactionMode attribute equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0100] START');
        await CommonFunc.sleep(1000);
        const driver = Driver.create();
        // 切换到非材质跟手场景：V1 mode=FOLLOWING_DRAG, V2 mode=FOLLOWING_DRAG
        let btn = await driver.findComponent(ON.id('SegmentBtnInter_btnFollowingNoMaterial'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        // 断言 V1 页签 interactionMode 为 FOLLOWING_DRAG(0)
        let v1TabMode = await driver.findComponent(ON.id('SegmentBtnInter_v1TabModeText'));
        let v1TabText: string = await (v1TabMode?.getText() as Promise<string>);
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0100] v1Tab text: ' + v1TabText);
        expect(v1TabText).assertEqual('V1 Tab interactionMode=0');
        // 断言 V1 胶囊 interactionMode 为 FOLLOWING_DRAG(0)
        let v1CapsuleMode = await driver.findComponent(ON.id('SegmentBtnInter_v1CapsuleModeText'));
        let v1CapsuleText: string = await (v1CapsuleMode?.getText() as Promise<string>);
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0100] v1Capsule text: ' + v1CapsuleText);
        expect(v1CapsuleText).assertEqual('V1 Capsule interactionMode=0');
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0100] END');
        done();
      });

    /**
     * @tc.name   SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0200
     * @tc.number SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0200
     * @tc.desc   AC-2: V1 Tab NORMAL_DRAG mode, interactionMode attribute equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0200] START');
        await CommonFunc.sleep(1000);
        const driver = Driver.create();
        // 切换到非材质普通场景：V1 mode=NORMAL_DRAG, V2 mode=NORMAL_DRAG
        let btn = await driver.findComponent(ON.id('SegmentBtnInter_btnNormalNoMaterial'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        // 断言 V1 页签 interactionMode 为 NORMAL_DRAG(1)
        let v1TabMode = await driver.findComponent(ON.id('SegmentBtnInter_v1TabModeText'));
        let v1TabText: string = await (v1TabMode?.getText() as Promise<string>);
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0200] v1Tab text: ' + v1TabText);
        expect(v1TabText).assertEqual('V1 Tab interactionMode=1');
        // 断言 V1 胶囊 interactionMode 为 NORMAL_DRAG(1)
        let v1CapsuleMode = await driver.findComponent(ON.id('SegmentBtnInter_v1CapsuleModeText'));
        let v1CapsuleText: string = await (v1CapsuleMode?.getText() as Promise<string>);
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0200] v1Capsule text: ' + v1CapsuleText);
        expect(v1CapsuleText).assertEqual('V1 Capsule interactionMode=1');
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0200] END');
        done();
      });

    /**
     * @tc.name   SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0300
     * @tc.number SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0300
     * @tc.desc   AC-3: V1 Tab undefined mode, interactionMode attribute keeps default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0300] START');
        await CommonFunc.sleep(1000);
        const driver = Driver.create();
        // 切换到非材质缺省场景：V1 mode=undefined, V2 mode=undefined
        let btn = await driver.findComponent(ON.id('SegmentBtnInter_btnDefaultNoMaterial'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        // 断言 V1 页签 interactionMode 为 undefined（默认策略）
        let v1TabMode = await driver.findComponent(ON.id('SegmentBtnInter_v1TabModeText'));
        let v1TabText: string = await (v1TabMode?.getText() as Promise<string>);
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0300] v1Tab text: ' + v1TabText);
        expect(v1TabText).assertEqual('V1 Tab interactionMode=undefined');
        // 断言 V1 胶囊 interactionMode 为 undefined（默认策略）
        let v1CapsuleMode = await driver.findComponent(ON.id('SegmentBtnInter_v1CapsuleModeText'));
        let v1CapsuleText: string = await (v1CapsuleMode?.getText() as Promise<string>);
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0300] v1Capsule text: ' + v1CapsuleText);
        expect(v1CapsuleText).assertEqual('V1 Capsule interactionMode=undefined');
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0300] END');
        done();
      });

    /**
     * @tc.name   SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0400
     * @tc.number SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0400
     * @tc.desc   AC-4: V1 Capsule with material FOLLOWING_DRAG mode, interactionMode attribute equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0400] START');
        await CommonFunc.sleep(1000);
        const driver = Driver.create();
        // 切换到新材质跟手场景：V1 mode=FOLLOWING_DRAG(材质), V2 mode=FOLLOWING_DRAG(材质)
        let btn = await driver.findComponent(ON.id('SegmentBtnInter_btnFollowingNewMaterial'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        // 断言 V1 页签 interactionMode 为 FOLLOWING_DRAG(0)，同时配置了材质
        let v1TabMode = await driver.findComponent(ON.id('SegmentBtnInter_v1TabModeText'));
        let v1TabText: string = await (v1TabMode?.getText() as Promise<string>);
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0400] v1Tab text: ' + v1TabText);
        expect(v1TabText).assertEqual('V1 Tab interactionMode=0');
        // 断言 V1 胶囊 interactionMode 为 FOLLOWING_DRAG(0)，同时配置了材质
        let v1CapsuleMode = await driver.findComponent(ON.id('SegmentBtnInter_v1CapsuleModeText'));
        let v1CapsuleText: string = await (v1CapsuleMode?.getText() as Promise<string>);
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0400] v1Capsule text: ' + v1CapsuleText);
        expect(v1CapsuleText).assertEqual('V1 Capsule interactionMode=0');
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0400] END');
        done();
      });

    /**
     * @tc.name   SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0500
     * @tc.number SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0500
     * @tc.desc   AC-5: V2 Tab FOLLOWING_DRAG mode, interactionMode attribute equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0500] START');
        await CommonFunc.sleep(1000);
        const driver = Driver.create();
        // 切换到非材质跟手场景：V2 mode=FOLLOWING_DRAG
        let btn = await driver.findComponent(ON.id('SegmentBtnInter_btnFollowingNoMaterial'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        // 断言 V2 interactionMode 为 FOLLOWING_DRAG(0)
        let v2Mode = await driver.findComponent(ON.id('SegmentBtnInter_v2ModeText'));
        let v2Text: string = await (v2Mode?.getText() as Promise<string>);
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0500] v2 text: ' + v2Text);
        expect(v2Text).assertEqual('V2 interactionMode=0');
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0500] END');
        done();
      });

    /**
     * @tc.name   SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0600
     * @tc.number SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0600
     * @tc.desc   AC-6: V2 Tab NORMAL_DRAG mode, interactionMode attribute equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0600] START');
        await CommonFunc.sleep(1000);
        const driver = Driver.create();
        // 切换到新材质普通场景：V2 mode=NORMAL_DRAG(材质)
        let btn = await driver.findComponent(ON.id('SegmentBtnInter_btnNormalNewMaterial'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        // 断言 V2 interactionMode 为 NORMAL_DRAG(1)
        let v2Mode = await driver.findComponent(ON.id('SegmentBtnInter_v2ModeText'));
        let v2Text: string = await (v2Mode?.getText() as Promise<string>);
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0600] v2 text: ' + v2Text);
        expect(v2Text).assertEqual('V2 interactionMode=1');
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0600] END');
        done();
      });

    /**
     * @tc.name   SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0700
     * @tc.number SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0700
     * @tc.desc   AC-7: V2 Tab undefined mode, interactionMode attribute keeps default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0700] START');
        await CommonFunc.sleep(1000);
        const driver = Driver.create();
        // 切换到新材质缺省场景：V2 mode=undefined(材质)
        let btn = await driver.findComponent(ON.id('SegmentBtnInter_btnDefaultNewMaterial'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        // 断言 V2 interactionMode 为 undefined（默认策略）
        let v2Mode = await driver.findComponent(ON.id('SegmentBtnInter_v2ModeText'));
        let v2Text: string = await (v2Mode?.getText() as Promise<string>);
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0700] v2 text: ' + v2Text);
        expect(v2Text).assertEqual('V2 interactionMode=undefined');
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0700] END');
        done();
      });

    /**
     * @tc.name   SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0800
     * @tc.number SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0800
     * @tc.desc   AC-8: V2 Capsule with material NORMAL_DRAG mode, interactionMode attribute equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0800] START');
        await CommonFunc.sleep(1000);
        const driver = Driver.create();
        // 切换到新材质普通场景：V2 mode=NORMAL_DRAG(材质)
        let btn = await driver.findComponent(ON.id('SegmentBtnInter_btnNormalNewMaterial'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        // 断言 V2 interactionMode 为 NORMAL_DRAG(1)，同时配置了材质
        let v2Mode = await driver.findComponent(ON.id('SegmentBtnInter_v2ModeText'));
        let v2Text: string = await (v2Mode?.getText() as Promise<string>);
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0800] v2 text: ' + v2Text);
        expect(v2Text).assertEqual('V2 interactionMode=1');
        console.info('[SUB_ARKUI_API_SegmentButtonInteractionModeTest_static_0800] END');
        done();
      });
  })
}
