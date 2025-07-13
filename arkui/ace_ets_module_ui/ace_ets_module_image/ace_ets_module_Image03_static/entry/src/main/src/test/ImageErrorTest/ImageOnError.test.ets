/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../../hypium/index';
import { ON, Driver } from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Utils.test';

const uiContext = new UIContext()

export default function ImageOnErrorTest() {
  describe('ImageOnErrorTest', () => {
    beforeAll(() => {
      console.info("ImageOnErrorTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.Image03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () :Promise<void> => {
      console.info('ImageOnErrorTest beforeEach start');
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info('get ImageOnErrorTest state pages:' + JSON.stringify(pages));
        if (!('ImageOnError' == pages.name)) {
          console.info('get ImageOnErrorTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl({url: 'MainAbility/pages/ImageError/ImageOnError'});
          await Utils.sleep(2500);
          // console.info('push ImageOnErrorTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageOnErrorTest page error:' + err);
      }
      console.info('ImageOnErrorTest beforeEach end');
      // done();
    });
    /* *
    * @tc.number: ImageOnErrorTest_static_001
    * @tc.name  : ImageOnErrorTest_static_001
    * @tc.desc  : To test the ImageOnError componentWidth componentHeight
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('ImageOnErrorTest_static_001', Level.LEVEL0, async (done: ()=>void) => {
      console.info('ImageOnErrorTest_static_001 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('image');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('componentWidth');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[ImageOnErrorTest_static_001] obj1.getElement('$attrs').getElement('width') is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('content')));
      console.info("[ImageOnErrorTest_static_001] px2vp(obj1.getElement('$attrs').getElement('width')) is: " + uiContext.px2vp(parseFloat(obj1.getElement('$attrs').getString('width'))));
      let componentWidth = Math.round(uiContext.px2vp(parseFloat(obj1.getElement('$attrs').getString('width')))) + '.00vp'
      expect(obj.getElement('$attrs').getElement('width')).assertEqual(componentWidth);

      let strJson2 = inspector.getInspectorByKey('componentHeight');
      let obj2 = JSON.parseJsonElement(strJson2);
      await Utils.sleep(1000);
      console.info("[ImageOnErrorTest_static_001] obj2.getElement('$attrs').getElement('width') is: " + JSON.stringifyJsonElement(obj2.getElement('$attrs').getElement('content')));
      let componentHeight = Math.round(uiContext.px2vp(parseFloat(obj2.getElement('$attrs').getString('width')))) + '.00vp'
      expect(obj.getElement('$attrs').getElement('height')).assertEqual(componentHeight);
      console.info('[ImageOnErrorTest_static_001] END');
      done();
    });
  })
}
