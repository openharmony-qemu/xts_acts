'use static';
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

import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';



export default function splitLayoutTest() {
  describe('splitLayoutTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("splitLayoutTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/splitLayout/splitLayoutTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get splitLayoutTest state pages:" + JSON.stringify(pages));
        if (!("splitLayoutTest" == pages.name)) {
          console.info("get splitLayoutTest pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push splitLayoutTest page error:" + err);
      }
      console.info("splitLayoutTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('splitLayoutTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info('splitLayoutTest after each called');
    })

    /**
     * @tc.number   testSplitLayout_static_0100
     * @tc.name     testSplitLayout_static_0100
     * @tc.desc     testSplitLayout_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('testSplitLayout_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSplitLayout_static_0100] START');
      try {
      let driver = Driver.create();
      await driver.delayMs(2000);

      //查询SplitLayout是否存在 以下信息的文本文字
      let  SplitLayoutItem1 = await driver.findComponent(ON.text('primaryText'));
      let  SplitLayoutItem2 = await driver.findComponent(ON.text('secondaryText'));
      let  SplitLayoutItem3 = await driver.findComponent(ON.text('tertiaryText'));

      expect(SplitLayoutItem1!== null).assertTrue();
      expect(SplitLayoutItem2!== null).assertTrue();
      expect(SplitLayoutItem3!== null).assertTrue();
      console.info('[testSplitLayout_static_0100] END');
      done();
      } catch (err) {
        console.error('testSplitLayout_static_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   testSplitLayout_static_0200
     * @tc.name     testSplitLayout_static_0200
     * @tc.desc     testSplitLayout_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('testSplitLayout_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSplitLayout_static_0200] START');
      try {
      let driver = Driver.create();
      await driver.delayMs(2000);

      let SplitLayoutItem = await driver.findComponent(ON.text('示例：空白区域容器内可添加组件'));
      await CommonFunc.sleep(2000);
      expect(SplitLayoutItem!== null).assertTrue();
      console.info('[testSplitLayout_static_0200] END');
      done();
      } catch (err) {
        console.error('testSplitLayout_static_0200 error: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
