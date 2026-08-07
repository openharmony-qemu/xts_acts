/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeEach, afterEach, it, Level, expect, Size, TestType } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SetResourceManagerCacheNullUndefinedTest() {
  describe('SetResourceManagerCacheNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SetResourceManagerCacheNullUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uiContext/SetResourceManagerCacheNullUndefinedTest',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('SetResourceManagerCacheMaxCountForHSPNullUndefinedTest' == pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push SetResourceManagerCacheNullUndefinedTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
    });

    /**
     * @tc.name : setResourceManagerCacheMaxCountForHSPNull_0100
     * @tc.number : setResourceManagerCacheMaxCountForHSPNull_0100
     * @tc.desc : 异常入参 null/undefined
     * @tc.type : FUNCTION
     * @tc.size : SMALLTEST
     * @tc.level : LEVEL2
     */
    it('setResourceManagerCacheMaxCountForHSPNull_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);
        let button1 = await driver.findComponent(ON.id('setResourceManagerCache_null_id'));
        await button1.click();
        await CommonFunc.sleep(500);
        expect(AppStorage.get('setResourceManagerCacheMaxCountForHSP_null')).assertEqual('success');
        expect(AppStorage.get('setResourceManagerCacheMaxCountForHSP_undefined')).assertEqual('success');
        AppStorage.delete('setResourceManagerCacheMaxCountForHSP_null');
        AppStorage.delete('setResourceManagerCacheMaxCountForHSP_undefined');
        done();
      });

    /**
     * @tc.name : setResourceManagerCacheMaxCountForHSPNormal_0200
     * @tc.number : setResourceManagerCacheMaxCountForHSPNormal_0200
     * @tc.desc : 正常入参调用 + void 返回（不抛异常）
     * @tc.type : FUNCTION
     * @tc.size : SMALLTEST
     * @tc.level : LEVEL1
     */
    it('setResourceManagerCacheMaxCountForHSPNormal_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('setResourceManagerCache_normal_id'));
        await button.click();
        await CommonFunc.sleep(500);
        expect(AppStorage.get('setResourceManagerCacheMaxCountForHSP_normal')).assertEqual('void_ok');
        AppStorage.delete('setResourceManagerCacheMaxCountForHSP_normal');
        done();
      });

    /**
     * @tc.name : setResourceManagerCacheMaxCountForHSPError_0300
     * @tc.number : setResourceManagerCacheMaxCountForHSPError_0300
     * @tc.desc : 错误码 100101(负数) / 100102(浮点)
     * @tc.type : FUNCTION
     * @tc.size : SMALLTEST
     * @tc.level : LEVEL2
     */
    it('setResourceManagerCacheMaxCountForHSPError_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('setResourceManagerCache_error_id'));
        await button.click();
        await CommonFunc.sleep(500);
        expect(AppStorage.get('setResourceManagerCacheMaxCountForHSP_neg')).assertEqual(100101);
        expect(AppStorage.get('setResourceManagerCacheMaxCountForHSP_float')).assertEqual(100102);
        AppStorage.delete('setResourceManagerCacheMaxCountForHSP_neg');
        AppStorage.delete('setResourceManagerCacheMaxCountForHSP_float');
        done();
      });
  });
}
