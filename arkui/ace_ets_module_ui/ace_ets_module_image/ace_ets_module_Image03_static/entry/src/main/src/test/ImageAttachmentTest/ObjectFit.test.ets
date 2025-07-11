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
import { describe, beforeEach, it, expect, Level, beforeAll } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Utils.test';

export default function ObjectFitTest() {
  describe('ObjectFitTest', () => {
    beforeAll(() => {
      console.info("ObjectFitTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.Image03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () :Promise<void> => {
      console.info("ObjectFitTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAttachment/ObjectFit',
      }
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get ObjectFitTest state pages: " + JSON.stringify(pages));
        if (!("ObjectFit" == pages.name)) {
          console.info("get ObjectFitTest state pages.name: " + JSON.stringify(pages.name));
          router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ObjectFitTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectFitTest page error: " + err);
        expect().assertFail();
      }
      // done();
    });
    
    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0010
     * @tc.name      ObjectFitTest_static_0010
     * @tc.desc      set ImageAttachment ObjectFit: ImageFit.Auto
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('ObjectFitTest_static_0010', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      // let obj = JSON.parseJsonElement(strJson);
      // console.info("[ObjectFitTest_static_0010] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      // expect(obj.getElement('$attrs').getElement('content')).assertContain('3');
      console.info('[ObjectFitTest_static_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0020
     * @tc.name      ObjectFitTest_static_0020
     * @tc.desc      set ImageAttachment ObjectFit: ImageFit.Contain
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0020', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_Contain'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0020] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertContain('1');
      console.info('[ObjectFitTest_static_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0030
     * @tc.name      ObjectFitTest_static_0030
     * @tc.desc      test ImageAttachment ObjectFit: ImageFit.Cover
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0030', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_Cover'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0030] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('2');
      console.info('[ObjectFitTest_static_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0040
     * @tc.name      ObjectFitTest_static_0040
     * @tc.desc      test ImageAttachment ObjectFit: ImageFit.Fill
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0040', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_Fill'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0040] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('0');
      console.info('[ObjectFitTest_static_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0050
     * @tc.name      ObjectFitTest_static_0050
     * @tc.desc      test ImageAttachment ObjectFit: ImageFit.ScaleDown
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0050', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0050] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_ScaleDown'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0050] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('6');
      console.info('[ObjectFitTest_static_0050] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0060
     * @tc.name      ObjectFitTest_static_0060
     * @tc.desc      test ImageAttachment ObjectFit: ImageFit.None
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0060', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0060] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_None'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0060] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('5');
      console.info('[ObjectFitTest_static_0060] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0070
     * @tc.name      ObjectFitTest_static_0070
     * @tc.desc      test ImageAttachment ObjectFit: ImageFit.TOP_START
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0070', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0070] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_TOP_START'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0070] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('7');
      console.info('[ObjectFitTest_static_0070] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0080
     * @tc.name      ObjectFitTest_static_0080
     * @tc.desc      test ImageAttachment ObjectFit: ImageFit.Fill
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0080', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0080] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_TOP'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0080] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('8');
      console.info('[ObjectFitTest_static_0080] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0090
     * @tc.name      ObjectFitTest_static_0090
     * @tc.desc      test ImageAttachment ObjectFit: ImageFit.TOP_END
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0090', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0090] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_TOP_END'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0090] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('9');
      console.info('[ObjectFitTest_static_0090] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0100
     * @tc.name      ObjectFitTest_static_0100
     * @tc.desc      test ImageAttachment ObjectFit: ImageFit.START
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0100', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_START'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0100] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('10');
      console.info('[ObjectFitTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0110
     * @tc.name      ObjectFitTest_static_0110
     * @tc.desc      test ImageAttachment ObjectFit: ImageFit.CENTER
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0110', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0110] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_CENTER'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0110] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('11');
      console.info('[ObjectFitTest_static_0110] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0120
     * @tc.name      ObjectFitTest_static_0120
     * @tc.desc      test ImageAttachment ObjectFit: ImageFit.END
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0120', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0120] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_END'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0120] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('12');
      console.info('[ObjectFitTest_static_0120] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0130
     * @tc.name      ObjectFitTest_static_0130
     * @tc.desc      test ImageAttachment ObjectFit: ImageFit.BOTTOM_START
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0130', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0130] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_BOTTOM_START'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0130] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('13');
      console.info('[ObjectFitTest_static_0130] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0140
     * @tc.name      ObjectFitTest_static_0140
     * @tc.desc      test ImageAttachment ObjectFit: ImageFit.BOTTOM
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0140', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0140] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_BOTTOM'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0140] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('14');
      console.info('[ObjectFitTest_static_0140] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ObjectFitTest_static_0150
     * @tc.name      ObjectFitTest_static_0150
     * @tc.desc      test ImageAttachment ObjectFit: ImageFit.BOTTOM_END
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ObjectFitTest_static_0150', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[ObjectFitTest_static_0150] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_ImageFit_BOTTOM_END'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_ObjectFit_append'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_ObjectFit_styles'));
      await (Button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_static_0150] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('15');
      console.info('[ObjectFitTest_static_0150] END');
      done();
    });
  })
}