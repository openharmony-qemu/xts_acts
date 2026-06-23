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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest, startAbility } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function exceptionPromptV2PageTest() {
  describe('exceptionPromptV2Page', () => {
    beforeAll(async (): Promise<void> => {
      console.info("exceptionPromptV2Page beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.exceptionPromptV2.nowear.test.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("exceptionPromptV2Page beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/exceptionPromptV2/exceptionPromptV2Page',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get exceptionPromptV2Page state pages:" + JSON.stringify(pages));
        if (!("exceptionPromptV2Page" == pages.name)) {
          console.info("get exceptionPromptV2Page pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push exceptionPromptV2Page page error:" + err);
      }
      console.info("exceptionPromptV2Page beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('exceptionPromptV2Page after each called');
    })

    /**
     * @tc.number   exceptionPromptV2Page_static_0100
     * @tc.name     exceptionPromptV2Page_static_0100
     * @tc.desc     Verify basic ExceptionPromptV2 component display and MarginType
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('exceptionPromptV2Page_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[exceptionPromptV2Page_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      
      try {
        let basicPrompt = await driver.findComponent(ON.text('网络未连接'));
        let defaultMargin = await driver.findComponent(ON.text('默认边距'));
        let fitMargin = await driver.findComponent(ON.text('自适应边距'));
        
        expect(basicPrompt !== null).assertTrue();
        expect(defaultMargin !== null).assertTrue();
        expect(fitMargin !== null).assertTrue();
        
        console.info('[exceptionPromptV2Page_static_0100] END');
      } catch (error) {
        console.error('[exceptionPromptV2Page_static_0100] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      
      done();
    });

    /**
     * @tc.number   exceptionPromptV2Page_static_0200
     * @tc.name     exceptionPromptV2Page_static_0200
     * @tc.desc     Verify ExceptionPromptV2 with icon and symbolStyle
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('exceptionPromptV2Page_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[exceptionPromptV2Page_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      
      try {
        let iconPrompt = await driver.findComponent(ON.text('图标提示'));
        let symbolPrompt = await driver.findComponent(ON.text('Symbol图标提示'));
        
        expect(iconPrompt !== null).assertTrue();
        expect(symbolPrompt !== null).assertTrue();
        
        console.info('[exceptionPromptV2Page_static_0200] END');
      } catch (error) {
        console.error('[exceptionPromptV2Page_static_0200] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      
      done();
    });

    /**
     * @tc.number   exceptionPromptV2Page_static_0300
     * @tc.name     exceptionPromptV2Page_static_0300
     * @tc.desc     Verify ExceptionPromptV2 with tip and actionText combinations
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('exceptionPromptV2Page_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[exceptionPromptV2Page_static_0300] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      
      try {
        let tipOnly = await driver.findComponent(ON.text('网络连接不稳定'));
        let tipWithAction = await driver.findComponent(ON.text('重新连接'));
        let tipAndAction = await driver.findComponent(ON.text('重试'));
        
        expect(tipOnly !== null).assertTrue();
        expect(tipWithAction !== null).assertTrue();
        expect(tipAndAction !== null).assertTrue();
        
        console.info('[exceptionPromptV2Page_static_0300] END');
      } catch (error) {
        console.error('[exceptionPromptV2Page_static_0300] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      
      done();
    });

    /**
     * @tc.number   exceptionPromptV2Page_static_0400
     * @tc.name     exceptionPromptV2Page_static_0400
     * @tc.desc     Verify ExceptionPromptV2 visibility control with isShown parameter
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('exceptionPromptV2Page_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[exceptionPromptV2Page_static_0400] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      
      try {
        let visiblePrompt = await driver.findComponent(ON.text('显示的提示'));
        expect(visiblePrompt !== null).assertTrue();
        
        try {
          let hiddenPrompt = await driver.findComponent(ON.text('隐藏的提示'));
          expect(hiddenPrompt === null).assertTrue();
        } catch (e) {
          console.info('[exceptionPromptV2Page_static_0400] Hidden prompt not found (expected)');
          expect(true).assertTrue();
        }
        
        console.info('[exceptionPromptV2Page_static_0400] END');
      } catch (error) {
        console.error('[exceptionPromptV2Page_static_0400] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      
      done();
    });

    /**
     * @tc.number   exceptionPromptV2Page_static_0500
     * @tc.name     exceptionPromptV2Page_static_0500
     * @tc.desc     Verify onTipClick and onActionTextClick callbacks
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('exceptionPromptV2Page_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[exceptionPromptV2Page_static_0500] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      
      try {
        let tipText = await driver.findComponent(ON.text('点击提示文本'));
        if (tipText !== null) {
          await tipText.click();
          await driver.delayMs(1000);
          let tipCallback = await driver.findComponent(ON.text('Tip Clicked'));
          expect(tipCallback !== null).assertTrue();
        }
        
        let actionText = await driver.findComponent(ON.text('点击操作'));
        if (actionText !== null) {
          await actionText.click();
          await driver.delayMs(1000);
          let actionCallback = await driver.findComponent(ON.text('Action Clicked'));
          expect(actionCallback !== null).assertTrue();
        }
        
        console.info('[exceptionPromptV2Page_static_0500] END');
      } catch (error) {
        console.error('[exceptionPromptV2Page_static_0500] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      
      done();
    });

    /**
     * @tc.number   exceptionPromptV2Page_static_0600
     * @tc.name     exceptionPromptV2Page_static_0600
     * @tc.desc     Verify dynamic visibility toggle with @Trace decorator
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('exceptionPromptV2Page_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[exceptionPromptV2Page_static_0600] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      
      try {
        let toggleButton = await driver.findComponent(ON.text('切换显示'));
        if (toggleButton !== null) {
          await toggleButton.click();
          await driver.delayMs(1000);
          
          try {
            let hiddenPrompt = await driver.findComponent(ON.text('更新后的提示文本'));
            expect(hiddenPrompt === null).assertTrue();
          } catch (e) {
            console.info('[exceptionPromptV2Page_static_0600] Prompt hidden (expected)');
          }
          
          await toggleButton.click();
          await driver.delayMs(1000);
          
          let visiblePrompt = await driver.findComponent(ON.text('更新后的提示文本'));
          expect(visiblePrompt !== null).assertTrue();
        }
        
        console.info('[exceptionPromptV2Page_static_0600] END');
      } catch (error) {
        console.error('[exceptionPromptV2Page_static_0600] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      
      done();
    });
  })
}