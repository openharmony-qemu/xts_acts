/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { afterAll, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { Component, Driver, MouseButton, ON, BY, WindowMode } from '@ohos.UiTest';
import router from '@ohos.router';
import { ThemeControl } from '@ohos.arkui.theme';
import { Theme } from '@ohos.arkui.theme';
import { frameTime, sleep } from '../../test/Utils';
import { checkColorTokens } from '../../MainAbility/themes/checkSystemTokens/CheckColorTokens';
import { Colors } from '../../MainAbility/themes/checkSystemTokens/colorValues/ColorsTokens';

export default function themeTokenType() {

  describe('themeTokenType', () => {
    beforeEach(async (done: Function) => {
      console.info("themeTokenType beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/themeTokensPages/themeTokenType",
      }
      try {
        router.clear();
        const pages: router.RouterState = router.getState();
        console.info("get themeTokenType state pages: " + JSON.stringify(pages));
        if (!("themeTokenType" == pages.name)) {
          console.info("get themeTokenType state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await sleep(2000);
        }
      } catch (err) {
        console.error('push themeTokenType page error:' + err);
      }
      console.info('themeTokenType beforeEach end');
      done();
    });

    /**
     * @tc.name   themeTokenType_0100
     * @tc.number SUB_ARKUI_THEME_TOKENTYPE_PARAM_0100
     * @tc.desc   Test theme tokenType property with TokenType.PRIMARY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('themeTokenType_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[themeTokenType_0100] START');
      await sleep(500);
      let driver = await Driver.create()
      let btn = await driver.findComponent(ON.id('theme_primary_btn'));
      await btn.click();
      await sleep(1000);
      let strJson = getInspectorByKey('theme_tokenType_text');
      console.info("[themeTokenType_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("TokenType: 0");

      let btn1 = await driver.findComponent(ON.id('theme_string_btn'));
      await btn1.click();
      await sleep(1000);
      let strJson1 = getInspectorByKey('theme_primary_text');
      console.info("[themeTokenType_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("primary: #ffff0000");

      let btn2 = await driver.findComponent(ON.id('theme_number_btn'));
      await btn2.click();
      await sleep(1000);
      let strJson2 = getInspectorByKey('theme_primary_text');
      console.info("[themeTokenType_0100] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("primary: ff00");

      let btn3 = await driver.findComponent(ON.id('theme_color_btn'));
      await btn3.click();
      await sleep(1000);
      let strJson3 = getInspectorByKey('theme_primary_text');
      console.info("[themeTokenType_0100] content3: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual("primary: #ffffa500");

      let btn4 = await driver.findComponent(ON.id('theme_resource_btn'));
      await btn4.click();
      await sleep(1000);
      let strJson4 = getInspectorByKey('theme_primary_text');
      console.info("[themeTokenType_0100] content4: " + JSON.stringify(JSON.parse(strJson4).$attrs.content));
      expect(JSON.parse(strJson4).$attrs.content !== undefined).assertTrue();
      console.info('[themeTokenType_0100] END');
      done();
    });

    /**
     * @tc.name   themeTokenType_0200
     * @tc.number SUB_ARKUI_THEME_TOKENTYPE_PARAM_0200
     * @tc.desc   Test theme tokenType property with TokenType.ON_PRIMARY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('themeTokenType_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[themeTokenType_0200] START');
      await sleep(500);
      let driver = await Driver.create()
      let btn = await driver.findComponent(ON.id('theme_onPrimary_btn'));
      await btn.click();
      await sleep(1000);
      let strJson = getInspectorByKey('theme_tokenType_text');
      console.info("[themeTokenType_0200] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("TokenType: 1");

      let btn1 = await driver.findComponent(ON.id('theme_string_btn'));
      await btn1.click();
      await sleep(1000);
      let strJson1 = getInspectorByKey('theme_onPrimary_text');
      console.info("[themeTokenType_0200] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("onPrimary: #ffff0000");

      let btn2 = await driver.findComponent(ON.id('theme_number_btn'));
      await btn2.click();
      await sleep(1000);
      let strJson2 = getInspectorByKey('theme_onPrimary_text');
      console.info("[themeTokenType_0200] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("onPrimary: ff00");

      let btn3 = await driver.findComponent(ON.id('theme_color_btn'));
      await btn3.click();
      await sleep(1000);
      let strJson3 = getInspectorByKey('theme_onPrimary_text');
      console.info("[themeTokenType_0200] content3: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual("onPrimary: #ffffa500");

      let btn4 = await driver.findComponent(ON.id('theme_resource_btn'));
      await btn4.click();
      await sleep(1000);
      let strJson4 = getInspectorByKey('theme_onPrimary_text');
      console.info("[themeTokenType_0200] content4: " + JSON.stringify(JSON.parse(strJson4).$attrs.content));
      expect(JSON.parse(strJson4).$attrs.content !== undefined).assertTrue();
      console.info('[themeTokenType_0200] END');
      done();
    });

    /**
     * @tc.name   themeTokenType_0300
     * @tc.number SUB_ARKUI_THEME_TOKENTYPE_PARAM_0300
     * @tc.desc   Test theme tokenType property with TokenType.CONTAINER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('themeTokenType_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[themeTokenType_0300] START');
      await sleep(500);
      let driver = await Driver.create()
      let btn = await driver.findComponent(ON.id('theme_container_btn'));
      await btn.click();
      await sleep(1000);
      let strJson = getInspectorByKey('theme_tokenType_text');
      console.info("[themeTokenType_0300] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("TokenType: 2");

      let btn1 = await driver.findComponent(ON.id('theme_string_btn'));
      await btn1.click();
      await sleep(1000);
      let strJson1 = getInspectorByKey('theme_container_text');
      console.info("[themeTokenType_0300] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("container: #ffff0000");

      let btn2 = await driver.findComponent(ON.id('theme_number_btn'));
      await btn2.click();
      await sleep(1000);
      let strJson2 = getInspectorByKey('theme_container_text');
      console.info("[themeTokenType_0300] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("container: ff00");

      let btn3 = await driver.findComponent(ON.id('theme_color_btn'));
      await btn3.click();
      await sleep(1000);
      let strJson3 = getInspectorByKey('theme_container_text');
      console.info("[themeTokenType_0300] content3: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual("container: #ffffa500");

      let btn4 = await driver.findComponent(ON.id('theme_resource_btn'));
      await btn4.click();
      await sleep(1000);
      let strJson4 = getInspectorByKey('theme_container_text');
      console.info("[themeTokenType_0300] content4: " + JSON.stringify(JSON.parse(strJson4).$attrs.content));
      expect(JSON.parse(strJson4).$attrs.content !== undefined).assertTrue();
      console.info('[themeTokenType_0300] END');
      done();
    });
  })
}