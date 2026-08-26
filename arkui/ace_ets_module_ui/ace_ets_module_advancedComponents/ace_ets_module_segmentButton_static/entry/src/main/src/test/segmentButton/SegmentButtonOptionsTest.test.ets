'use static';
/*
 * Copyright (C) 2026Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage,SegmentButtonOptions } from '@kit.ArkUI';
import inspector from '@ohos.arkui.inspector'

export default function SegmentButtonOptionsTest() {
  describe('SegmentButtonOptionsTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("SegmentButtonOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButtonOptionsDemo",
      }
      try {
        const SegmentButtonOptionsTest = AppStorage.get<Router>("router") as Router
        SegmentButtonOptionsTest.clear();
        let pages:router.RouterState = SegmentButtonOptionsTest.getState();
        console.info("get SegmentButtonOptionsTest state pages: " + JSON.stringify(pages));
        if (!("SegmentButtonOptionsDemo" == pages.name)) {
          console.info("get SegmentButtonOptionsTest state pages.name: " + JSON.stringify(pages.name));
          await SegmentButtonOptionsTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SegmentButtonOptionsTest page error:" + err);
      }
      console.info("SegmentButtonOptionsTest beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('SegmentButtonOptionsTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("SegmentButtonOptionsTest after each called");
    });

    /**
     * @tc.number   SegmentButtonOptionsTest_static_001
     * @tc.name     SegmentButtonOptionsTest_static_001
     * @tc.desc     onItemClicked 事件回调
     * @tc.level    Level.LEVEL0
     */
    it('SegmentButtonOptionsTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SegmentButtonOptionsTest_001] START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(2000);
        let button = await driver.findComponent(ON.text('页签按钮2'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let strJsonNew = inspector.getInspectorByKey('onItemClickedIndex');
        console.info( 'SegmentButtonOptionsTest_001 strJsonNew  is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
          .getElement('$attrs')
          .getString('content')));
        expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('1');
        await CommonFunc.sleep(2000);
        console.info('[SegmentButtonOptionsTest_001] END');
      } catch (error) {
        console.error('[SegmentButtonOptionsTest_static_001] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number   SegmentButtonOptionsTest_static_002
     * @tc.name     SegmentButtonOptionsTest_static_002
     * @tc.desc     SegmentButtonOptions属性
     * @tc.level    Level.LEVEL0
     */
    it('SegmentButtonOptionsTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SegmentButtonOptionsTest_002] START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(2000);

        let tabOptions = AppStorage.get<SegmentButtonOptions>('SegmentButtonOptions001')!
        let tabOptions2 = AppStorage.get<SegmentButtonOptions>('SegmentButtonOptions002')!
        expect(tabOptions.type).assertEqual('tab');
        expect(tabOptions2.type).assertEqual('capsule');
        expect(tabOptions.multiply).assertEqual(false);
        expect(tabOptions2.multiply).assertEqual(true);
        expect(tabOptions.fontColor).assertEqual('#FF000000');
        expect(tabOptions.selectedFontColor).assertEqual('#FFFFFF00');
        expect(tabOptions.fontSize).assertEqual(18);
        expect(tabOptions.selectedFontSize).assertEqual(20);
        expect(tabOptions.selectedFontWeight).assertEqual(0);
        expect(tabOptions.fontWeight).assertEqual(5);
        expect(tabOptions.backgroundColor).assertEqual('#FF008000');
        expect(tabOptions.selectedBackgroundColor).assertEqual('#FFFFA500');
        expect(tabOptions.imageSize.width).assertEqual(40);
        expect(JSON.stringify(tabOptions.buttonPadding)).assertEqual('{"top":4}');
        await CommonFunc.sleep(2000);
        AppStorage.delete('SegmentButtonOptions001');
        AppStorage.delete('SegmentButtonOptions002');
        await CommonFunc.sleep(2000);
        console.info('[SegmentButtonOptionsTest_002] END');
      } catch (error) {
        console.error('[SegmentButtonOptionsTest_static_002] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });
  })
}
