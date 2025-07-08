/*
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index'
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { ComputedBarAttribute } from '@ohos.arkui.component'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
export default function gridScrollbarUpdateTest() {
  describe('gridScrollbarUpdateTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grid/gridScrollBar',
      }
      const routerAlp = AppStorage.get<Router>("router",Type.from<Router>()) as Router
      try {
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get gridScrollBar state success " + JSON.stringify(pages));
        if (!("gridScrollBar" == pages.name)) {
          console.info("get gridScrollBar state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          // console.info("push gridScrollBar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridScrollBar page error: " + err);
      }
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    it('Grid_scrollbarUpdate_static_0801', 0, async (done: () => void): Promise<void> => {
      console.info('Grid_scrollbarUpdate_static_0801 START');
      setTimeout(() => {
        try {
          let computeda: ComputedBarAttribute = {
            totalOffset: 10, totalLength: 10
          } as ComputedBarAttribute
          console.info("Grid_scrollbarUpdate_static_0801 computeda is: " + JSON.stringify(computeda))
          let strJson = inspector.getInspectorByKey('Grid_scrollbarUpdate_0800');
          console.info('Grid_scrollbarUpdate_static_0801 START  :' + JSON.stringify(strJson));
          console.info("Grid_scrollbarUpdate_static_0801 obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("90.00%");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("300.00vp");
          console.info('Grid_scrollbarUpdate_static_0801 END ');
        } catch (err) {
          expect().assertFail()
          console.info('Grid_scrollbarUpdate_static_0801 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    })

    it('Grid_scrollbarUpdate_static_0802', 0, async (done: () => void): Promise<void> => {
      console.info('Grid_scrollbarUpdate_static_0802 START');
      setTimeout(() => {
        try {
          let computedb: ComputedBarAttribute = {
            totalOffset: 0, totalLength: 0
          } as ComputedBarAttribute
          console.info("Grid_scrollbarUpdate_static_0802 computedb is: " + JSON.stringify(computedb))
          let strJson = inspector.getInspectorByKey('Grid_scrollbarUpdate_0800');
          console.info('Grid_scrollbarUpdate_static_0802 START  :' + JSON.stringify(strJson));
          console.info("Grid_scrollbarUpdate_static_0802 obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Grid");
          console.info('Grid_scrollbarUpdate_static_0802 END ');
        } catch (err) {
          expect().assertFail()
          console.info('Grid_scrollbarUpdate_static_0802 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    })
  })
}