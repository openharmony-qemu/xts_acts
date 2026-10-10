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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function columnsTemplateAuto() {
  describe('columnsTemplateAuto', () => {
    beforeEach(async (done: Function) => {
      console.info("columnsTemplateAuto beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyVGridLayout/columnsTemplateAuto",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get columnsTemplateAuto state pages:" + JSON.stringify(pages));
        if (!("columnsTemplateAuto" == pages.name)) {
          console.info("get columnsTemplateAuto pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push columnsTemplateAuto page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnsTemplateAuto page error:" + err);
      }
      console.info("columnsTemplateAuto beforeEach end");
      done();
    });

    /**
     * @tc.name   columnsTemplateAuto_0100
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_AUTO_0100
     * @tc.desc   Test LazyVGridLayout columnsTemplate property with 'repeat(auto-fill, 96)'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateAuto_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[columnsTemplateAuto_0100] START');
      let driver: Driver = Driver.create();
      let scrollComp = await driver.findComponent(ON.type('Scroll'));
      await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_autoFill'));
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('lazyVGrid_columnsTemplate_autoFill');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[columnsTemplateAuto_0100] type: " + JSON.stringify(obj.$type));
      console.info("[columnsTemplateAuto_0100] columnsTemplate: " + JSON.stringify(obj.$attrs.columnsTemplate));
      expect(obj.$type).assertEqual('LazyVGridLayout');
      expect(obj.$attrs.columnsTemplate).assertEqual('repeat(auto-fill, 96)');
      console.info('[columnsTemplateAuto_0100] END');
      done();
    })

    /**
     * @tc.name   columnsTemplateAuto_0200
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_AUTO_0200
     * @tc.desc   Test LazyVGridLayout columnsTemplate property with 'repeat(auto-fit, 96)'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateAuto_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[columnsTemplateAuto_0200] START');
      let driver: Driver = Driver.create();
      let scrollComp = await driver.findComponent(ON.type('Scroll'));
      await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_autoFit'));
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('lazyVGrid_columnsTemplate_autoFit');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[columnsTemplateAuto_0200] type: " + JSON.stringify(obj.$type));
      console.info("[columnsTemplateAuto_0200] columnsTemplate: " + JSON.stringify(obj.$attrs.columnsTemplate));
      expect(obj.$type).assertEqual('LazyVGridLayout');
      expect(obj.$attrs.columnsTemplate).assertEqual('repeat(auto-fit, 96)');
      console.info('[columnsTemplateAuto_0200] END');
      done();
    })

    /**
     * @tc.name   columnsTemplateAuto_0300
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_AUTO_0300
     * @tc.desc   Test LazyVGridLayout columnsTemplate property with 'repeat(auto-stretch, 96)'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateAuto_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[columnsTemplateAuto_0300] START');
      let driver: Driver = Driver.create();
      let scrollComp = await driver.findComponent(ON.type('Scroll'));
      await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_autoStretch'));
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('lazyVGrid_columnsTemplate_autoStretch');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[columnsTemplateAuto_0300] type: " + JSON.stringify(obj.$type));
      console.info("[columnsTemplateAuto_0300] columnsTemplate: " + JSON.stringify(obj.$attrs.columnsTemplate));
      expect(obj.$type).assertEqual('LazyVGridLayout');
      expect(obj.$attrs.columnsTemplate).assertEqual('repeat(auto-stretch, 96)');
      console.info('[columnsTemplateAuto_0300] END');
      done();
    })
  })
}
