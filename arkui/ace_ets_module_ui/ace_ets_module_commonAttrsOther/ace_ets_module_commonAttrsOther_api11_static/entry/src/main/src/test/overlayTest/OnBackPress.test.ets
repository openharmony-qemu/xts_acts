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
import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Driver,
  ON
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function onBackPress(): void {
  describe('onBackPress', () => {
    beforeEach(async (): Promise<void> => {
      console.info("onBackPress beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/overlay/onBackPress',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onBackPress state pages: " + JSON.stringify(pages));
        if (!("onBackPress" == pages.name)) {
          console.info("get onBackPress state pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onBackPress page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('onBackPress afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("overlay after each called");
    });

    /**
     * @tc.name   onBackPress_0100
     * @tc.number SUB_ARKUI_COMMONATTRSOTHER_ONBACKPRESS_0100
     * @tc.desc   显示浮层后可关闭浮层
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onBackPress_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onBackPress_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let buttonS = await driver.findComponent(ON.id('show'));
        await buttonS!.click();
        await CommonFunc.sleep(1500);
        let buttonClose = await driver.findComponent(ON.text('关闭'));
        expect(buttonClose).not().assertUndefined();
        await CommonFunc.sleep(1500);
        await buttonClose!.click();
      } catch (err) {
        console.error('[onBackPress_0100] error: ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info('[onBackPress_0100] END');
      done();
    });

    /**
     * @tc.name   NodeIdentity_0100
     * @tc.number SUB_ARKUI_COMMONATTRSOTHER_NODEIDENTITY_0100
     * @tc.desc   NodeIdentity 类型覆盖：s1 为 string、s2 为 number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NodeIdentity_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[NodeIdentity_0100] START');
      try {
        await CommonFunc.sleep(2000);
        let s1Type: string = AppStorage.get<string>('NodeIdentity_sring') as string;
        let s2Type: string = AppStorage.get<string>('NodeIdentity_number') as string;
        console.info('[NodeIdentity_0100] s1Type: ' + s1Type + ', s2Type: ' + s2Type);
        expect(s1Type).assertEqual('string');
        // ArkTS 静态模式下整数字面量推断为 int，typeof 返回 'int'；动态模式返回 'number'。
        // 两者均为数值类型，NodeIdentity 覆盖验证以数值语义为准。
        expect(s2Type === 'number' || s2Type === 'int').assertTrue();
      } catch (err) {
        console.error('[NodeIdentity_0100] error: ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info('[NodeIdentity_0100] END');
      done();
    });

  })
}
