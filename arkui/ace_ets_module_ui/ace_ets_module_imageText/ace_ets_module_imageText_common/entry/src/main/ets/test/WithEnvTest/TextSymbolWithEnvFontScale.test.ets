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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function TextSymbolWithEnvFontScaleTest() {
  describe('TextSymbolWithEnvFontScaleTest', () => {
    let driver: Driver | null = null;
    beforeEach(async (done: Function) => {
      console.info("TextSymbolWithEnvFontScaleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WithEnv/TextSymbolWithEnvFontScale',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextSymbolWithEnvFontScaleTest state pages: " + JSON.stringify(pages));
        if (!("TextSymbolWithEnvFontScale" == pages.name)) {
          console.info("get TextSymbolWithEnvFontScaleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push TextSymbolWithEnvFontScaleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextSymbolWithEnvFontScaleTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   TextSymbolWithEnvFontScaleTest_0100
     * @tc.number SUB_ARKUI_API_WITHENV_FONTSCALE_0100
     * @tc.desc   Test Text Symbol with FontScale, ReduceTo 0.5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TextSymbolWithEnvFontScaleTest_0100', Level.LEVEL2, async () => {
      console.info('[TextSymbolWithEnvFontScaleTest_0100] START');
      driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        return;
      }

      let ReduceBtn = await driver.findComponent(ON.id('ReduceTo0.5Btn'));
      if (ReduceBtn === null) {
        expect().assertFail();
        console.error('[TextSymbolWithEnvFontScaleTest_0100] ReduceTo0.5Btn not found');
        return;
      }
      await ReduceBtn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('WithEnvText');
      let withEnvTextHeight:string = JSON.parse(strJson).$attrs.size.height
      console.log('[TextSymbolWithEnvFontScaleTest_0100] Text WithEnv font size'+withEnvTextHeight)
      let strJson2 = getInspectorByKey('WithEnvSymbol');
      let withEnvSymbolHeight:string = JSON.parse(strJson2).$attrs.size.height
      console.log('[TextSymbolWithEnvFontScaleTest_0100] Symbol WithEnv font size'+withEnvSymbolHeight)  
      let strJson3 = getInspectorByKey('WithoutEnvText');
      let withoutEnvTextHeight:string = JSON.parse(strJson3).$attrs.size.height
      console.log('[TextSymbolWithEnvFontScaleTest_0100] Text WithoutEnv font size'+withoutEnvTextHeight)
      let strJson4 = getInspectorByKey('WithoutEnvSymbol');
      let withoutEnvSymbolHeight:string = JSON.parse(strJson4).$attrs.size.height
      console.log('[TextSymbolWithEnvFontScaleTest_0100] Symbol WithoutEnv font size'+withoutEnvSymbolHeight)

      let wETHNumber:number = Number(withEnvTextHeight.split('.')[0])
      let wESHNumber:number = Number(withEnvSymbolHeight.split('.')[0])
      let wOETHNumber:number = Number(withoutEnvTextHeight.split('.')[0])
      let wOESHNumber:number = Number(withoutEnvSymbolHeight.split('.')[0])
      console.log('[TextSymbolWithEnvFontScaleTest_0100] -wETHNumber:'+wETHNumber)
      console.log('[TextSymbolWithEnvFontScaleTest_0100] -wESHNumber:'+wESHNumber)
      console.log('[TextSymbolWithEnvFontScaleTest_0100] -wOETHNumber:'+wOETHNumber)
      console.log('[TextSymbolWithEnvFontScaleTest_0100] -wOESHNumber:'+wOESHNumber)
      expect(wOETHNumber>wETHNumber).assertEqual(true);
      expect(wOESHNumber>wESHNumber).assertEqual(true);
      console.info('[TextSymbolWithEnvFontScaleTest_0100] END');
    })

    /**
     * @tc.name   TextSymbolWithEnvFontScaleTest_0200
     * @tc.number SUB_ARKUI_API_WITHENV_FONTSCALE_0200
     * @tc.desc   Test Text Symbol with FontScale, ReduceTo 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TextSymbolWithEnvFontScaleTest_0200', Level.LEVEL2, async () => {
      console.info('[TextSymbolWithEnvFontScaleTest_0200] START');
      driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        return;
      }

      let ReduceBtn = await driver.findComponent(ON.id('ReduceTo1.0Btn'));
      if (ReduceBtn === null) {
        expect().assertFail();
        console.error('[TextSymbolWithEnvFontScaleTest_0200] ReduceTo1.0Btn not found');
        return;
      }
      await ReduceBtn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('WithEnvText');
      let withEnvTextHeight:string = JSON.parse(strJson).$attrs.size.height
      console.log('[TextSymbolWithEnvFontScaleTest_0200] Text WithEnv font size'+withEnvTextHeight)
      let strJson2 = getInspectorByKey('WithEnvSymbol');
      let withEnvSymbolHeight:string = JSON.parse(strJson2).$attrs.size.height
      console.log('[TextSymbolWithEnvFontScaleTest_0200] Symbol WithEnv font size'+withEnvSymbolHeight)  
      let strJson3 = getInspectorByKey('WithoutEnvText');
      let withoutEnvTextHeight:string = JSON.parse(strJson3).$attrs.size.height
      console.log('[TextSymbolWithEnvFontScaleTest_0200] Text WithoutEnv font size'+withoutEnvTextHeight)
      let strJson4 = getInspectorByKey('WithoutEnvSymbol');
      let withoutEnvSymbolHeight:string = JSON.parse(strJson4).$attrs.size.height
      console.log('[TextSymbolWithEnvFontScaleTest_0200] Symbol WithoutEnv font size'+withoutEnvSymbolHeight)

      let wETHNumber:number = Number(withEnvTextHeight.split('.')[0])
      let wESHNumber:number = Number(withEnvSymbolHeight.split('.')[0])
      let wOETHNumber:number = Number(withoutEnvTextHeight.split('.')[0])
      let wOESHNumber:number = Number(withoutEnvSymbolHeight.split('.')[0])
      console.log('[TextSymbolWithEnvFontScaleTest_0200] -wETHNumber:'+wETHNumber)
      console.log('[TextSymbolWithEnvFontScaleTest_0200] -wESHNumber:'+wESHNumber)
      console.log('[TextSymbolWithEnvFontScaleTest_0200] -wOETHNumber:'+wOETHNumber)
      console.log('[TextSymbolWithEnvFontScaleTest_0200] -wOESHNumber:'+wOESHNumber)
      expect(wOETHNumber==wETHNumber).assertEqual(true);
      expect(wOESHNumber==wESHNumber).assertEqual(true);
      console.info('[TextSymbolWithEnvFontScaleTest_0200] END');
    })

    /**
     * @tc.name   TextSymbolWithEnvFontScaleTest_0300
     * @tc.number SUB_ARKUI_API_WITHENV_FONTSCALE_0300
     * @tc.desc   Test Text Symbol with FontScale, ReduceTo 1.5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TextSymbolWithEnvFontScaleTest_0300', Level.LEVEL2, async () => {
      console.info('[TextSymbolWithEnvFontScaleTest_0300] START');
      driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        return;
      }

      let ReduceBtn = await driver.findComponent(ON.id('ReduceTo1.5Btn'));
      if (ReduceBtn === null) {
        expect().assertFail();
        console.error('[TextSymbolWithEnvFontScaleTest_0300] ReduceTo1.5Btn not found');
        return;
      }
      await ReduceBtn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('WithEnvText');
      let withEnvTextHeight:string = JSON.parse(strJson).$attrs.size.height
      console.log('[TextSymbolWithEnvFontScaleTest_0300] Text WithEnv font size'+withEnvTextHeight)
      let strJson2 = getInspectorByKey('WithEnvSymbol');
      let withEnvSymbolHeight:string = JSON.parse(strJson2).$attrs.size.height
      console.log('[TextSymbolWithEnvFontScaleTest_0300] Symbol WithEnv font size'+withEnvSymbolHeight)  
      let strJson3 = getInspectorByKey('WithoutEnvText');
      let withoutEnvTextHeight:string = JSON.parse(strJson3).$attrs.size.height
      console.log('[TextSymbolWithEnvFontScaleTest_0300] Text WithoutEnv font size'+withoutEnvTextHeight)
      let strJson4 = getInspectorByKey('WithoutEnvSymbol');
      let withoutEnvSymbolHeight:string = JSON.parse(strJson4).$attrs.size.height
      console.log('[TextSymbolWithEnvFontScaleTest_0300] Symbol WithoutEnv font size'+withoutEnvSymbolHeight)

      let wETHNumber:number = Number(withEnvTextHeight.split('.')[0])
      let wESHNumber:number = Number(withEnvSymbolHeight.split('.')[0])
      let wOETHNumber:number = Number(withoutEnvTextHeight.split('.')[0])
      let wOESHNumber:number = Number(withoutEnvSymbolHeight.split('.')[0])
      console.log('[TextSymbolWithEnvFontScaleTest_0300] -wETHNumber:'+wETHNumber)
      console.log('[TextSymbolWithEnvFontScaleTest_0300] -wESHNumber:'+wESHNumber)
      console.log('[TextSymbolWithEnvFontScaleTest_0300] -wOETHNumber:'+wOETHNumber)
      console.log('[TextSymbolWithEnvFontScaleTest_0300] -wOESHNumber:'+wOESHNumber)
      expect(wOETHNumber<wETHNumber).assertEqual(true);
      expect(wOESHNumber<wESHNumber).assertEqual(true);
      console.info('[TextSymbolWithEnvFontScaleTest_0300] END');
    })

  })
}