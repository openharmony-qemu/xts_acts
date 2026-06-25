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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function routerNullUndefined() {
  describe('routerNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("routerNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Router2/routerNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get routerNullUndefined state pages:" + JSON.stringify(pages));
        if (!("routerNullUndefined" == pages.name)) {
          console.info("get routerNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push routerNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push routerNullUndefined page error:" + err);
      }
      console.info("routerNullUndefined beforeEach end");
      done();
    });

    /**
     * @tc.name   routerPush_0100
     * @tc.number SUB_ARKUI_ROUTER_PUSH_PARAM_0100
     * @tc.desc   Test router push with recoverable: true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('routerPush_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[routerPush_0100] START');
      try {
        let driver = await Driver.create()
        let button = await driver.findComponent(ON.id('button_push_recoverable_true'));
        await button.click();
        await driver.delayMs(1000);

        let pages = router.getState();
        console.info('[routerPush_0100] current page: ' + JSON.stringify(pages));
        expect(pages.name).assertEqual('RouterTargetPage');

        // 返回原页面
        router.back();
        await driver.delayMs(1000);
      } catch (err) {
        console.error('[routerPush_0100] error: ' + JSON.stringify(err));
      }
      console.info('[routerPush_0100] END');
      done();
    });

    /**
     * @tc.name   routerPush_0200
     * @tc.number SUB_ARKUI_ROUTER_PUSH_PARAM_0200
     * @tc.desc   Test router push with recoverable: false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('routerPush_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[routerPush_0200] START');
      try {
        let driver = await Driver.create()
        let button = await driver.findComponent(ON.id('button_push_recoverable_false'));
        await button.click();
        await driver.delayMs(1000);

        let pages = router.getState();
        console.info('[routerPush_0200] current page: ' + JSON.stringify(pages));
        expect(pages.name).assertEqual('RouterTargetPage');

        // 返回原页面
        router.back();
        await driver.delayMs(1000);
      } catch (err) {
        console.error('[routerPush_0200] error: ' + JSON.stringify(err));
      }
      console.info('[routerPush_0200] END');
      done();
    });

    /**
     * @tc.name   routerPush_0300
     * @tc.number SUB_ARKUI_ROUTER_PUSH_PARAM_0300
     * @tc.desc   Test router push with params: null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('routerPush_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[routerPush_0300] START');
      try {
        let driver = await Driver.create()
        let button = await driver.findComponent(ON.id('button_push_params_null'));
        await button.click();
        await driver.delayMs(1000);

        let pages = router.getState();
        console.info('[routerPush_0300] current page: ' + JSON.stringify(pages));
        expect(pages.name).assertEqual('RouterTargetPage');

        // 返回原页面
        router.back();
        await driver.delayMs(1000);
      } catch (err) {
        console.error('[routerPush_0300] error: ' + JSON.stringify(err));
      }
      console.info('[routerPush_0300] END');
      done();
    });

    /**
     * @tc.name   routerPush_0400
     * @tc.number SUB_ARKUI_ROUTER_PUSH_PARAM_0400
     * @tc.desc   Test router push with params: undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('routerPush_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[routerPush_0400] START');
      try {
        let driver = await Driver.create()
        let button = await driver.findComponent(ON.id('button_push_params_undefined'));
        await button.click();
        await driver.delayMs(1000);

        let pages = router.getState();
        console.info('[routerPush_0400] current page: ' + JSON.stringify(pages));
        expect(pages.name).assertEqual('RouterTargetPage');

        // 返回原页面
        router.back();
        await driver.delayMs(1000);
      } catch (err) {
        console.error('[routerPush_0400] error: ' + JSON.stringify(err));
      }
      console.info('[routerPush_0400] END');
      done();
    });

    /**
     * @tc.name   routerPushUrl_0100
     * @tc.number SUB_ARKUI_ROUTER_PUSHURL_PARAM_0100
     * @tc.desc   Test router pushUrl with uri: empty string should fail
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('routerPushUrl_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[routerPushUrl_0100] START');
      try {
        let driver = await Driver.create()
        let button = await driver.findComponent(ON.id('button_pushUrl_uri_empty'));
        await button.click();
        await driver.delayMs(1000);

        // 不能跳转到另一个页面
        let strJson: string = getInspectorByKey('text_result_message');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info("[routerPushUrl_0100] message: " + JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.content).assertEqual('Router API 测试页面');
      } catch (err) {
        console.error('[routerPushUrl_0100] error: ' + JSON.stringify(err));
      }
      console.info('[routerPushUrl_0100] END');
      done();
    });

    /**
     * @tc.name   routerPushUrl_0200
     * @tc.number SUB_ARKUI_ROUTER_PUSHURL_PARAM_0200
     * @tc.desc   Test router pushUrl with options: null should fail
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('routerPushUrl_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[routerPushUrl_0200] START');
      try {
        let driver = await Driver.create()
        let button = await driver.findComponent(ON.id('button_pushUrl_options_null'));
        await button.click();
        await driver.delayMs(1000);

        // 不能跳转到另一个页面
        let strJson: string = getInspectorByKey('text_result_message');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info("[routerPushUrl_0200] message: " + JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.content).assertContain('error');
      } catch (err) {
        console.error('[routerPushUrl_0200] error: ' + JSON.stringify(err));
      }
      console.info('[routerPushUrl_0200] END');
      done();
    });

    /**
     * @tc.name   routerPushUrl_0300
     * @tc.number SUB_ARKUI_ROUTER_PUSHURL_PARAM_0300
     * @tc.desc   Test router pushUrl with options: undefined should fail
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('routerPushUrl_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[routerPushUrl_0300] START');
      try {
        let driver = await Driver.create()
        let button = await driver.findComponent(ON.id('button_pushUrl_options_undefined'));
        await button.click();
        await driver.delayMs(1000);

        // 应该捕获错误并显示错误消息
        let strJson: string = getInspectorByKey('text_result_message');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info("[routerPushUrl_0300] message: " + JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.content).assertContain('error');
      } catch (err) {
        console.error('[routerPushUrl_0300] error: ' + JSON.stringify(err));
      }
      console.info('[routerPushUrl_0300] END');
      done();
    });

    /**
     * @tc.name   routerBack_0100
     * @tc.number SUB_ARKUI_ROUTER_BACK_PARAM_0100
     * @tc.desc   Test router back with recoverable: true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('routerBack_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[routerBack_0100] START');
      // back方法不返回结果，主要测试不crash
      try {
        let driver = await Driver.create()
        let button = await driver.findComponent(ON.id('button_back_recoverable_true'));
        await button.click();
        await driver.delayMs(500);
        console.info('[routerBack_0100] back with recoverable true executed');

        let strJson: string = getInspectorByKey('button_back_recoverable_true');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info("[routerBack_0100] message: " + JSON.stringify(obj.$attrs.content));
        expect(obj.$type).assertEqual('Button');
      } catch (err) {
        console.error('[routerBack_0100] error: ' + JSON.stringify(err));
      }
      console.info('[routerBack_0100] END');
      done();
    });

    /**
     * @tc.name   routerBack_0200
     * @tc.number SUB_ARKUI_ROUTER_BACK_PARAM_0200
     * @tc.desc   Test router back with recoverable: false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('routerBack_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[routerBack_0200] START');
      try {
        let driver = await Driver.create()
        let button = await driver.findComponent(ON.id('button_back_recoverable_false'));
        await button.click();
        await driver.delayMs(500);
        console.info('[routerBack_0200] back with recoverable false executed');

        let strJson: string = getInspectorByKey('button_back_recoverable_false');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info("[routerBack_0200] message: " + JSON.stringify(obj.$attrs.content));
        expect(obj.$type).assertEqual('Button');
      } catch (err) {
        console.error('[routerBack_0200] error: ' + JSON.stringify(err));
      }
      console.info('[routerBack_0200] END');
      done();
    });

    /**
     * @tc.name   routerBack_0300
     * @tc.number SUB_ARKUI_ROUTER_BACK_PARAM_0300
     * @tc.desc   Test router back with uri: empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('routerBack_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[routerBack_0300] START');
      try {
        let driver = await Driver.create()
        let button = await driver.findComponent(ON.id('button_back_uri_empty'));
        await button.click();
        await driver.delayMs(500);
        console.info('[routerBack_0300] back with empty uri executed');

        let strJson: string = getInspectorByKey('button_back_uri_empty');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info("[routerBack_0300] message: " + JSON.stringify(obj.$attrs.content));
        expect(obj.$type).assertEqual('Button');
      } catch (err) {
        console.error('[routerBack_0300] error: ' + JSON.stringify(err));
      }
      console.info('[routerBack_0300] END');
      done();
    });
  });
}