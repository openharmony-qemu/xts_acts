'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function subHeaderV2EndIcon() {
  describe('subHeaderV2EndIcon', () => {

    beforeAll(async (): Promise<void> => {
      console.info("subHeaderV2EndIcon beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.subHeaderV2.nowear.test.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("subHeaderV2EndIcon beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/subHeaderV2/subHeaderV2EndIcon',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get subHeaderV2EndIcon state pages:" + JSON.stringify(pages));
        if (!("subHeaderV2EndIcon" == pages.name)) {
          console.info("get subHeaderV2EndIcon pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push subHeaderV2EndIcon page error:" + err);
      }
      console.info("subHeaderV2EndIcon beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('subHeaderV2EndIcon after each called');
    })

    /**
     * @tc.number   SUB_ARKUI_SUBHEADERV2_ENDICON_0100
     * @tc.name     subHeaderV2EndIcon_static_0100
     * @tc.desc     Verify SubHeaderV2 with primaryTitle+secondaryTitle+endIcon(image) renders correctly
     * @tc.level    LEVEL1
     */
    it('subHeaderV2EndIcon_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[subHeaderV2EndIcon_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      // 场景5: 验证 primaryTitle 和 secondaryTitle 文本可见
      let primaryTitle = await driver.findComponent(ON.text('我的音乐'));
      let secondaryTitle = await driver.findComponent(ON.text('128 首'));
      expect(primaryTitle !== null).assertTrue();
      expect(secondaryTitle !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[subHeaderV2EndIcon_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_SUBHEADERV2_ENDICON_0200
     * @tc.name     subHeaderV2EndIcon_static_0200
     * @tc.desc     Verify SubHeaderV2 with primaryTitle+endIcon(SymbolGlyphModifier) renders correctly
     * @tc.level    LEVEL1
     */
    it('subHeaderV2EndIcon_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[subHeaderV2EndIcon_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      // 场景6: 验证 primaryTitle 文本可见
      let primaryTitle = await driver.findComponent(ON.text('已完成'));
      expect(primaryTitle !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[subHeaderV2EndIcon_static_0200] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_SUBHEADERV2_ENDICON_0300
     * @tc.name     subHeaderV2EndIcon_static_0300
     * @tc.desc     Verify SubHeaderV2 with endIcon+operationItems(BUTTON) coexistence renders correctly
     * @tc.level    LEVEL1
     */
    it('subHeaderV2EndIcon_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[subHeaderV2EndIcon_static_0300] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      // 场景7: 验证 primaryTitle 和 operationItem 文本可见
      let primaryTitle = await driver.findComponent(ON.text('设置'));
      let operation = await driver.findComponent(ON.text('更多'));
      expect(primaryTitle !== null).assertTrue();
      expect(operation !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[subHeaderV2EndIcon_static_0300] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_SUBHEADERV2_ENDICON_0400
     * @tc.name     subHeaderV2EndIcon_static_0400
     * @tc.desc     Verify SubHeaderV2 list type with icon+secondaryTitle+endIcon(image) renders correctly
     * @tc.level    LEVEL1
     */
    it('subHeaderV2EndIcon_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[subHeaderV2EndIcon_static_0400] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      // V2列表型: 验证 secondaryTitle 文本可见
      let secondaryTitle = await driver.findComponent(ON.text('V2列表型标题'));
      expect(secondaryTitle !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[subHeaderV2EndIcon_static_0400] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_SUBHEADERV2_ENDICON_0500
     * @tc.name     subHeaderV2EndIcon_static_0500
     * @tc.desc     Verify SubHeaderV2 with endIcon renders correctly in RTL layout (Row>Column wrapping)
     * @tc.level    LEVEL1
     */
    it('subHeaderV2EndIcon_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[subHeaderV2EndIcon_static_0500] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      // 场景14: 验证 RTL 布局下 endIcon 组件存在（通过 id 查找）
      let endIconComponent = await driver.findComponent(ON.id('subheaderv2_endicon_rtl'));
      let noEndIconComponent = await driver.findComponent(ON.id('subheaderv2_no_endicon_rtl'));
      expect(endIconComponent !== null).assertTrue();
      expect(noEndIconComponent !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[subHeaderV2EndIcon_static_0500] END');
      done();
    });
  })
}
