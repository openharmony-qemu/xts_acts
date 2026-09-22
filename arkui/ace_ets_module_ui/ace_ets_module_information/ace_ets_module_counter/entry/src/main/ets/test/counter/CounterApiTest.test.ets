/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, afterEach, it, expect, Level, afterAll } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import Utils from '../Utils';
import { Driver } from '@ohos.UiTest';

export default function counterApi() {
  describe('counterApi', () => {
    beforeEach(async (done: Function) => {
      console.info('counterApi beforeEach start');
      try {
        router.clear();
        let pages = router.getState();
        console.info('get counterApi state pages:' + JSON.stringify(pages));
        if (!('counterApi' == pages.name)) {
          console.info('get Context pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/counter/counterApi'
          });
          await Utils.sleep(2000);
          console.info('push counterApi page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.log('push counterApi page error:' + err);
      }
      console.info('counterApi foreEach end');
      done();
    });
    afterEach(async () => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.log('counterApi afterEach error: ' + err);
      }
      console.info('counterApi after each called');
    });
    afterAll(async () => {
      AppStorage.delete('isActive');
      console.info("afterAll case");
    });

    /**
     * @tc.name      counterApi_001
     * @tc.number    SUB_ARKUI_API_COUNTER_API_0010
     * @tc.desc      counterApi onFocusDecrease event test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level     Level3
     */
    it('counterApi_001', Level.LEVEL3, async (done: Function) => {
      console.info('[counterApi_001] START');
      try {
        if(AppStorage.get('isActive')) {
          await Utils.sleep(1000);
          // press tab
          let driver = await Driver.create();
          await Utils.sleep(1000);
          await driver.triggerKey(2049);
          await Utils.sleep(1000);
          let strJson = getInspectorByKey('counterApiText2');
          await Utils.sleep(1000);
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info('[counterApi_001] component obj is: ' + JSON.stringify(obj));
          await Utils.sleep(1000);
          expect(obj.$attrs.content).assertEqual('onFocusDecrease');
        } else {
          expect(AppStorage.get('isActive')!=true).assertEqual(true);
        }
      } catch (err) {
        console.log('counterApi_001 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[counterApi_001] END');
      done();
    });

    /**
     * @tc.name      counterApi_002
     * @tc.number    SUB_ARKUI_API_COUNTER_API_0020
     * @tc.desc      counterApi onFocusIncrease and onBlurDecrease event test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level     Level3
     */
    it('counterApi_002', Level.LEVEL3, async (done: Function) => {
      console.info('[counterApi_002] START');
      try {
        if(AppStorage.get('isActive')) {
          await Utils.sleep(1000);
          // press tab
          let driver = await Driver.create();
          await Utils.sleep(1000);
          await driver.triggerKey(2049);
          await Utils.sleep(1000);
          let strJson = getInspectorByKey('counterApiText1');
          await Utils.sleep(1000);
          let strJson2 = getInspectorByKey('counterApiText2');
          await Utils.sleep(1000);
          console.info('[counterApi_002] component obj is: ' + JSON.stringify(JSON.parse(strJson)));
          console.info('[counterApi_002] component obj is: ' + JSON.stringify(JSON.parse(strJson2)));
          await Utils.sleep(1000);
          expect(JSON.parse(strJson).$attrs.content).assertEqual('onFocusIncrease');
          expect(JSON.parse(strJson2).$attrs.content).assertEqual('onBlurDecrease');
        } else {
          expect(AppStorage.get('isActive')!=true).assertEqual(true);
        }
      } catch (err) {
        console.log('counterApi_002 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[counterApi_002] END');
      done();
    });

    /**
     * @tc.name      counterApi_003
     * @tc.number    SUB_ARKUI_API_COUNTER_API_0030
     * @tc.desc      counterApi onBlurIncrease event test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level     Level3
     */
    it('counterApi_003', Level.LEVEL3, async (done: Function) => {
      console.info('[counterApi_003] START');
      try {
        if(AppStorage.get('isActive')) {
          await Utils.sleep(1000);
          // press tab
          let driver = await Driver.create();
          await Utils.sleep(1000);
          await driver.triggerKey(2049);
          await Utils.sleep(1000);
          let strJson2 = getInspectorByKey('counterApiText1');
          await Utils.sleep(1000);
          console.info('[counterApi_003] component obj is: ' + JSON.stringify(JSON.parse(strJson2)));
          await Utils.sleep(1000);
          expect(JSON.parse(strJson2).$attrs.content).assertEqual('onBlurIncrease');
        } else {
          expect(AppStorage.get('isActive')!=true).assertEqual(true);
        }
      } catch (err) {
        console.log('counterApi_003 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[counterApi_003] END');
      done();
    });
  });
}
