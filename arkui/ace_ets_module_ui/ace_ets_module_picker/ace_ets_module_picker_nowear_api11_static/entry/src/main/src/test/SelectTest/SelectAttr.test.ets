'use static';
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
import router from '@ohos.router';
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import Utils from "../../../ets/MainAbility/common/Utils";
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function SelectAttr() {
  describe('SelectAttr', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SelectAttr beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/SelectAttr',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SelectAttr state pages:" + JSON.stringify(pages));
        if (!("SelectAttr" == pages.name)) {
          console.info("get SelectAttr pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SelectAttr page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SelectAttr page error: " + err);
      }
      // done()
    });

    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info("SelectAttr after each error: " + JSON.stringify(err));
      }
      console.info("SelectAttr after each called");
    });


    
    /**
     * @tc.number   SelectAttr_static_001
     * @tc.name     SelectAttr_static_001
     * @tc.desc     SelectAttr_static_001
     * @tc.level    Level.LEVEL1
     */
it('SelectAttr_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SelectAttr_static_001] START');
        await Utils.sleep(1000);

        let driver = Driver.create();
        await Utils.sleep(1000);
        let btn1 = await driver.findComponent(ON.id('SelectAttr_Select'));
        await (btn1?.click() as Promise<void>)
        await Utils.sleep(3000);

        let strJson1 = inspector.getInspectorByKey('SelectAttr_Select');
        let obj1 = JSON.parseJsonElement(strJson1);
        await Utils.sleep(1000);
        console.info("[SelectAttr_static_001] obj1 is: " + JSON.stringify(obj1));

        let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(1000);
                // Inspector tree 与 byKey 两侧 width 字符串可能因浮点精度存在 0.01vp 差异
        // (如 "199.99vp" vs "200.00vp")，解析为数值并取整后比较，避免精度误差导致的断言失败
        let treeWidthStr = obj2.getArray("$children")[1].getArray("$children")[0].getElement('$attrs').getString("width");
        let keyWidthStr = obj1.getElement('$attrs').getString("width");
        let treeWidthVp = treeWidthStr.endsWith('px')
          ? Math.round(UIContext.resolveUIContext()!.px2vp(parseFloat(treeWidthStr.replace('px', ''))))
          : Math.round(parseFloat(treeWidthStr.replace('vp', '')));
        let keyWidthVp = keyWidthStr.endsWith('px')
          ? Math.round(UIContext.resolveUIContext()!.px2vp(parseFloat(keyWidthStr.replace('px', ''))))
          : Math.round(parseFloat(keyWidthStr.replace('vp', '')));
        console.info("[SelectAttr_static_001] treeWidthVp=" + treeWidthVp + ", keyWidthVp=" + keyWidthVp);
        expect(treeWidthVp).assertEqual(keyWidthVp);

        console.info('[SelectAttr_static_001] END');
        done();
      } catch (err) {
        console.info('[SelectAttr_static_001] ERR ' + JSON.stringify(err));
        done();
      }
    });

  })
}


