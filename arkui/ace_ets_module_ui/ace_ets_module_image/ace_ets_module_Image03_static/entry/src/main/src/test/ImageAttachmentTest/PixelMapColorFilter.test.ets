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

export default function PixelMapColorFilterTest() {
  describe('PixelMapColorFilterTest', () => {
    beforeAll(() => {
      console.info("PixelMapColorFilterTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.Image03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () :Promise<void> => {
      console.info("PixelMapColorFilterTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAttachment/PixelMapColorFilter',
      }
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get PixelMapColorFilterTest state pages: " + JSON.stringify(pages));
        if (!("PixelMapColorFilter" == pages.name)) {
          console.info("get PixelMapColorFilterTest state pages.name: " + JSON.stringify(pages.name));
          router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push PixelMapColorFilterTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PixelMapColorFilterTest page error: " + err);
        expect().assertFail();
      }
      // done();
    });
    
    /**
     * @tc.number    SUB_ACE_PixelMap_ColorFilterTest_0010
     * @tc.name      PixelMapColorFilterTest_static_0010
     * @tc.desc      set resource ColorFilter: number[]
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('PixelMapColorFilterTest_static_0010', Level.LEVEL2, async (done: ()=>void ) => {
      console.info('[PixelMapColorFilterTest_static_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_resource'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ColorFilter_content');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PixelMapColorFilterTest_static_0010] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('[1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0]');
      console.info('[PixelMapColorFilterTest_static_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_PixelMap_ColorFilterTest_0020
     * @tc.name      PixelMapColorFilterTest_static_0020
     * @tc.desc      set string ColorFilter: number[]
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('PixelMapColorFilterTest_static_0020', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[PixelMapColorFilterTest_static_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_str'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ColorFilter_content');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PixelMapColorFilterTest_static_0020] component obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('[1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0]');
      console.info('[PixelMapColorFilterTest_static_0020] END');
      done();
    });
  })
}