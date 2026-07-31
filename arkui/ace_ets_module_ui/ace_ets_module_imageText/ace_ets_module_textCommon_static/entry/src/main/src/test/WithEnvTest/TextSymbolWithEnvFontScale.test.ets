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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function TextSymbolWithEnvFontScaleTest() {
  describe('TextSymbolWithEnvFontScaleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextSymbolWithEnvFontScaleTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.textCommon.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextSymbolWithEnvFontScaleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WithEnv/TextSymbolWithEnvFontScale',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('TextSymbolWithEnvFontScaleTest state pages: ' + JSON.stringify(pages));
        if (!("TextSymbolWithEnvFontScale" == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("push TextSymbolWithEnvFontScaleTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   TextSymbolWithEnvFontScaleTest_0100
     * @tc.number SUB_ARKUI_API_WITHENV_FONTSCALE_0100
     * @tc.desc   Test Text Symbol with FontScale, ReduceTo 0.5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TextSymbolWithEnvFontScaleTest_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextSymbolWithEnvFontScaleTest_0100] START');
      let driver: Driver = Driver.create();
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
      await (ReduceBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('WithEnvText');
      let withEnvTextHeight:string = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('size').getString('height')
      console.log('[TextSymbolWithEnvFontScaleTest_0100] Text WithEnv font size'+withEnvTextHeight)
      let strJson2 = inspector.getInspectorByKey('WithEnvSymbol');
      let withEnvSymbolHeight:string = JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('size').getString('height')
      console.log('[TextSymbolWithEnvFontScaleTest_0100] Symbol WithEnv font size'+withEnvSymbolHeight)  
      let strJson3 = inspector.getInspectorByKey('WithoutEnvText');
      let withoutEnvTextHeight:string = JSON.parseJsonElement(strJson3).getElement('$attrs').getElement('size').getString('height')
      console.log('[TextSymbolWithEnvFontScaleTest_0100] Text WithoutEnv font size'+withoutEnvTextHeight)
      let strJson4 = inspector.getInspectorByKey('WithoutEnvSymbol');
      let withoutEnvSymbolHeight:string = JSON.parseJsonElement(strJson4).getElement('$attrs').getElement('size').getString('height')
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
      done();
    })

    /**
     * @tc.name   TextSymbolWithEnvFontScaleTest_0200
     * @tc.number SUB_ARKUI_API_WITHENV_FONTSCALE_0200
     * @tc.desc   Test Text Symbol with FontScale, ReduceTo 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TextSymbolWithEnvFontScaleTest_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextSymbolWithEnvFontScaleTest_0200] START');
      let driver: Driver = Driver.create();
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
      await (ReduceBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('WithEnvText');
      let withEnvTextHeight:string = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('size').getString('height')
      console.log('[TextSymbolWithEnvFontScaleTest_0200] Text WithEnv font size'+withEnvTextHeight)
      let strJson2 = inspector.getInspectorByKey('WithEnvSymbol');
      let withEnvSymbolHeight:string = JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('size').getString('height')
      console.log('[TextSymbolWithEnvFontScaleTest_0200] Symbol WithEnv font size'+withEnvSymbolHeight)  
      let strJson3 = inspector.getInspectorByKey('WithoutEnvText');
      let withoutEnvTextHeight:string = JSON.parseJsonElement(strJson3).getElement('$attrs').getElement('size').getString('height')
      console.log('[TextSymbolWithEnvFontScaleTest_0200] Text WithoutEnv font size'+withoutEnvTextHeight)
      let strJson4 = inspector.getInspectorByKey('WithoutEnvSymbol');
      let withoutEnvSymbolHeight:string = JSON.parseJsonElement(strJson4).getElement('$attrs').getElement('size').getString('height')
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
      done();
    })

    /**
     * @tc.name   TextSymbolWithEnvFontScaleTest_0300
     * @tc.number SUB_ARKUI_API_WITHENV_FONTSCALE_0300
     * @tc.desc   Test Text Symbol with FontScale, ReduceTo 1.5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TextSymbolWithEnvFontScaleTest_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextSymbolWithEnvFontScaleTest_0300] START');
      let driver: Driver = Driver.create();
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
      await (ReduceBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('WithEnvText');
      let withEnvTextHeight:string = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('size').getString('height')
      console.log('[TextSymbolWithEnvFontScaleTest_0300] Text WithEnv font size'+withEnvTextHeight)
      let strJson2 = inspector.getInspectorByKey('WithEnvSymbol');
      let withEnvSymbolHeight:string = JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('size').getString('height')
      console.log('[TextSymbolWithEnvFontScaleTest_0300] Symbol WithEnv font size'+withEnvSymbolHeight)  
      let strJson3 = inspector.getInspectorByKey('WithoutEnvText');
      let withoutEnvTextHeight:string = JSON.parseJsonElement(strJson3).getElement('$attrs').getElement('size').getString('height')
      console.log('[TextSymbolWithEnvFontScaleTest_0300] Text WithoutEnv font size'+withoutEnvTextHeight)
      let strJson4 = inspector.getInspectorByKey('WithoutEnvSymbol');
      let withoutEnvSymbolHeight:string = JSON.parseJsonElement(strJson4).getElement('$attrs').getElement('size').getString('height')
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
      done();
    })

  })
}