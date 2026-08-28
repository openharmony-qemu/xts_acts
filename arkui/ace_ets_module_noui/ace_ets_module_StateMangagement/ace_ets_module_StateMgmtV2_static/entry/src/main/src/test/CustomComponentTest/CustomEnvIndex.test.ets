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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON } from '@kit.TestKit';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function CustomEnvIndex(): void {
  describe('CustomEnvIndexTest', (): void => {

    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomComponent/CustomEnvIndex',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get CustomEnvIndexstate pages:' + JSON.stringify(pages));
        if (!('CustomEnvIndex' == pages.name)) {
          console.info('get CustomEnvIndex state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CustomEnvIndex page error:' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvIndex after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvIndex_0100
     * @tc.number SUB_ARKUI_CustomEnvIndex_0100
     * @tc.desc   test the CustomEnvIndexTest_static CustomEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvIndex_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvIndex_0100] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('text0');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0100] strJson is: ' + strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0100] CustomEnvIndexTest obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('联合类型:This is default value737');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_CustomEnvIndex_0100] END')
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CustomEnvIndex_0200
     * @tc.number SUB_ARKUI_CustomEnvIndex_0200
     * @tc.desc   test the CustomEnvIndexTest_static CustomEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvIndex_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvIndex_0200] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('text1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0200] strJson is: ' + strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0200] CustomEnvIndexTest obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('小数:0.5');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_CustomEnvIndex_0200] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvIndex_0300
     * @tc.number SUB_ARKUI_CustomEnvIndex_0300
     * @tc.desc   test the CustomEnvIndexTest_static CustomEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvIndex_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvIndex_0300] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('text2');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0300] strJson is: ' + strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0300] CustomEnvIndexTest obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('布尔:true');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_CustomEnvIndex_0300] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvIndex_0400
     * @tc.number SUB_ARKUI_CustomEnvIndex_0400
     * @tc.desc   test the CustomEnvIndexTest_static CustomEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvIndex_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvIndex_0400] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('text3');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0400] strJson is: ' + strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0400] CustomEnvIndexTest obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('null:null');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_CustomEnvIndex_0400] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvIndex_0500
     * @tc.number SUB_ARKUI_CustomEnvIndex_0500
     * @tc.desc   test the CustomEnvIndexTest_static CustomEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvIndex_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvIndex_0500] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('text5');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0500] strJson is: ' + strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0500] CustomEnvIndexTest obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('零:0');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_CustomEnvIndex_0500] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvIndex_0600
     * @tc.number SUB_ARKUI_CustomEnvIndex_0600
     * @tc.desc   test the CustomEnvIndexTest_static CustomEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvIndex_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvIndex_0600] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('text6');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0600] strJson is: ' + strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0600] CustomEnvIndexTest obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('负数:-1');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_CustomEnvIndex_0600] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvIndex_0700
     * @tc.number SUB_ARKUI_CustomEnvIndex_0700
     * @tc.desc   test the CustomEnvIndexTest_static CustomEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvIndex_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvIndex_0700] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('text7');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0700] strJson is: ' + strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0700] CustomEnvIndexTest obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('枚举:enum1');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_CustomEnvIndex_0700] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvIndex_0800
     * @tc.number SUB_ARKUI_CustomEnvIndex_0800
     * @tc.desc   test the CustomEnvIndexTest_static CustomEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvIndex_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvIndex_0800] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('text8');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0800] strJson is: ' + strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0800] CustomEnvIndexTest obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('对象:object pass');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_CustomEnvIndex_0800] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvIndex_0900
     * @tc.number SUB_ARKUI_CustomEnvIndex_0900
     * @tc.desc   test the CustomEnvIndexTest_static CustomEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvIndex_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvIndex_0900] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('text9');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0900] strJson is: ' + strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_0900] CustomEnvIndexTest obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('数组:1,2');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_CustomEnvIndex_0900] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvIndex_1000
     * @tc.number SUB_ARKUI_CustomEnvIndex_1000
     * @tc.desc   test the CustomEnvIndexTest_static CustomEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvIndex_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvIndex_1000] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('text10');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_1000] strJson is: ' + strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_1000] CustomEnvIndexTest obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('类:123');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_CustomEnvIndex_1000] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvIndex_1100
     * @tc.number SUB_ARKUI_CustomEnvIndex_1100
     * @tc.desc   test the CustomEnvIndexTest_static CustomEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvIndex_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvIndex_1100] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('text11');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_1100] strJson is: ' + strJson);
      console.info('[SUB_ARKUI_CustomEnvIndex_1100] CustomEnvIndexTest obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('字符串:This is default value');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_CustomEnvIndex_1100] END')
      done();
    });
  })
}