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

import {
  describe,
  beforeEach,
  afterEach,
  it,
  expect,
  Level
} from '../../../../hypium';
import { Driver } from '@ohos.UiTest';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function SegmentButtonBorderTest() {
  describe('SegmentButtonBorderTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("SegmentButtonBorderTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segmentButton/SegmentButtonBorder',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SegmentButtonBorderTest state pages:" + JSON.stringify(pages));
        if (!("SegmentButtonBorderTest" == pages.name)) {
          console.info("get SegmentButtonBorderTest pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SegmentButtonBorderTest page error:" + err);
        expect().assertFail();
      }
      console.info("SegmentButtonBorderTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('SegmentButtonBorderTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info('SegmentButtonBorderTest after each called');
    });


    /**
     * @tc.name   SegmentButtonBorderTest_0100
     * @tc.number SegmentButtonBorderTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonBorderTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonBorderTest_0100 START');
      try {
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(200);
        let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[1]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("SegmentButtonV2Test_static_0100", JSON.stringify(obj))
        expect(obj.getElement('$attrs').getString('borderRadius')).assertEqual('14.00vp');
        let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[1]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("SegmentButtonV2Test_static_0100", JSON.stringify(obj2))
        // expect(obj2.getElement('$attrs').getString('borderRadius')).assertEqual(JSON.stringify({
        //   topLeft: "12.00vp",
        //   topRight: "12.00vp",
        //   bottomLeft: "12.00vp",
        //   bottomRight: "12.00vp"
        // }));


        console.info('[SegmentButtonBorderTest_0100] END');
      } catch (error) {
        console.error('[SegmentButtonBorderTest_0100] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   SegmentButtonBorderTest_0200
     * @tc.number SegmentButtonBorderTest_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonBorderTest_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonBorderTest_0200 START');
      try {
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(200);
        let obj3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[3]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("SegmentButtonV2Test_static_0100", JSON.stringify(obj3))
        expect(obj3.getElement('$attrs').getString('borderRadius')).assertEqual('20.00vp');
        let obj4 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[3]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("SegmentButtonV2Test_static_0100", JSON.stringify(obj4))
        console.info('[SegmentButtonBorderTest_0200] END');
      } catch (error) {
        console.error('[SegmentButtonBorderTest_0200] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

  })
}
