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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

function sleep(time: int): Promise<void> {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}
export default function menuDividerTest() {
  describe('ActsMenuDividerTest', () => {
    beforeAll(() => {
      console.info("menuDivider beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

    });

    beforeEach(async (): Promise<void> => {
      console.info("menuDivider beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Menu/menuDivider",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get menuDivider state pages:" + JSON.stringify(pages));
        if (!("menuDivider" == pages.name)) {
          console.info("get menuDivider pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push menuDivider page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuDivider page error:" + err);
      }
      console.info("menuDivider beforeEach end");
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_static_0001
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_static_0001', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0001] START');

      let myJson = inspector.getInspectorByKey('menuItemDividerText');
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0001] component obj1 is:${JSON.stringify(myJson)}`);
      await sleep(200);
      let obj1 = JSON.parseJsonElement(myJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0001] component obj1 is:${JSON.stringify(obj1)}`);
      await sleep(1000);

      expect(obj1.getElement('$attrs').getElement('itemDivider').getString('strokeWidth')).assertEqual('1.50vp');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0001] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_static_0002
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_static_0002', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0200] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0002] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('color')).assertEqual('#FFFFC0CB');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0002] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_static_0003
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_static_0003', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0003] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0003] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('endMargin')).assertEqual('2.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0003] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_static_0004
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */
    it('ArkUX_Stage_Menu_menuItemDivider_static_0004', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0004] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0004] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('endMargin')).assertEqual('2.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0004] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_static_0005
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_static_0005', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0005] START');

      let myJson = inspector.getInspectorByKey('menuItemDividerText1');
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0005] component obj1 is:${JSON.stringify(myJson)}`);
      await sleep(200);
      let obj1 = JSON.parseJsonElement(myJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0005] component obj1 is:${JSON.stringify(obj1)}`);
      await sleep(1000);

      expect(obj1.getElement('$attrs').getElement('itemDivider').getString('strokeWidth')).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0005] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_static_0006
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_static_0006', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0006] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0006] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('color')).assertEqual('#00000000');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0006] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_static_0007
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_static_0007', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0007] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0007] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('endMargin')).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0007] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_static_0008
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */
    it('ArkUX_Stage_Menu_menuItemDivider_static_0008', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0012] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0008] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('endMargin')).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0008] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_static_0009
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_static_0009', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[menuItemDivider_0100] START');

      let myJson = inspector.getInspectorByKey('menuItemDividerText1');
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0005] component obj1 is:${JSON.stringify(myJson)}`);
      await sleep(200);
      let obj1 = JSON.parseJsonElement(myJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0009] component obj1 is:${JSON.stringify(obj1)}`);
      await sleep(1000);

      expect(obj1.getElement('$attrs').getElement('itemDivider').getString('strokeWidth')).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0009] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_static_0010
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_static_0010', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0010] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0010] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('color')).assertEqual('#00000000');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0010] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_static_0011
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_static_0011', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0011] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0011] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('endMargin')).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0011] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_static_0012
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */
    it('ArkUX_Stage_Menu_menuItemDivider_static_0012', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0012] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0012] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('endMargin')).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0012] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_static_0013
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

      it('ArkUX_Stage_Menu_menuItemDivider_static_0013', Level.LEVEL2,async (done: () => void): Promise<void> => {
        console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0013] START');
  
        let strJson = inspector.getInspectorByKey('menuItemDividerText3');
        await sleep(200);
        let obj = JSON.parseJsonElement(strJson);
        console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0013] component obj is:${JSON.stringify(obj)}`);
        await sleep(1000);
  
        expect(obj.getElement('$attrs').getElement('itemDivider').getString('color')).assertEqual('#FF000000');
        console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0013] END');
        done();
      });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_001
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_001', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_001] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_static_001] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('strokeWidth')).assertEqual('50.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_001] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0002
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0002', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0002] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0002] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('color')).assertEqual('#FF0000FF');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0002] END');
      done();
    })
  
    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0003
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0003', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0003] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0003] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('endMargin')).assertEqual('2.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0003] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0004
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */
    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0004', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0004] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0004] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('endMargin')).assertEqual('2.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0004] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0005
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0005', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0005] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_static_0005] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('strokeWidth')).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0005] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0006
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0006', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0006] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0006] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('color')).assertEqual('#00000001');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0006] END');
      done();
    })

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0007
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0007', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_006] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0007] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('endMargin')).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0007] END');
      done();
    });
  
    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0008
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */
    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0008', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_007] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0008] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('endMargin')).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0008] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0009
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0009', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0009] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_static_0009] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('strokeWidth')).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0009] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0010
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0010', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0010] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0010] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('color')).assertEqual('#00000001');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0010] END');
      done();
    })

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0011
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0011', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0011] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0011] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('endMargin')).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0011] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0012
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */
    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0012', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0013] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0012] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('endMargin')).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0012] END');
      done();
    });
 
    /**
       * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0013
       * @tc.name      menuItemGroupDivider test
       * @tc.desc      menuItemGroupDivider test
       */

      it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0013', Level.LEVEL2,async (done: () => void): Promise<void> => {
        console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0013] START');
  
        let strJson = inspector.getInspectorByKey('menuItemGroupDividerText3');
        await sleep(200);
        let obj = JSON.parseJsonElement(strJson);
        console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0013] component obj is:${JSON.stringify(obj)}`);
        await sleep(1000);
  
        expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('color')).assertEqual('#FF000000');
        console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0013] END');
        done();
      })

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0014
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      subMenuExpandingMode test
     */
    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0014', Level.LEVEL2,async (done: () => void): Promise<void> => {
        console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0014] START');
  
        let strJson = inspector.getInspectorByKey('menuItemGroupDividerText');
        await sleep(200);
        let obj = JSON.parseJsonElement(strJson);
        console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_static_0014] component obj is: " + JSON.stringify(obj));
        await sleep(1000);
  
        expect(obj.getElement('$attrs').getString('subMenuExpandingMode')).assertEqual('SubMenuExpandingMode.SIDE');
        console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0014] END');
        done();
      });
      
    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0015
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      subMenuExpandingMode test
     */
    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0015', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0015] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_static_0015] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.getElement('$attrs').getString('subMenuExpandingMode')).assertEqual('SubMenuExpandingMode.EMBEDDED');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0015] END');
      done();
    });
      
    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_static_0016
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      subMenuExpandingMode test
     */
    it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0016', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0016] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_static_0016] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.getElement('$attrs').getString('subMenuExpandingMode')).assertEqual('SubMenuExpandingMode.STACK');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0016] END');
      done();
    });

  })
}