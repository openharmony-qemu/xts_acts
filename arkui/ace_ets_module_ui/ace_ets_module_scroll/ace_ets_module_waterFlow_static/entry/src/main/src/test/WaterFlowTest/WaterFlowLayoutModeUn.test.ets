'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function WaterFlowLayoutModeUn() {
  describe('WaterFlowLayoutModeUn', () => {

    beforeEach(async () => {
      console.info('WaterFlowLayoutModeUn beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowLayoutModeUn',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get WaterFlowLayoutModeUn state pages:' + JSON.stringify(pages));
        if (!('WaterFlowLayoutModeUn' == pages.name)) {
          console.info('get WaterFlowLayoutModeUn pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push WaterFlowLayoutModeUn page error:' + err);
      }
      console.info('WaterFlowLayoutModeUn beforeEach end');
    });

    /**
     * @tc.name   waterFlowLayoutModeUn_static_0100
     * @tc.number SUB_ARKUI_WATERFLOW_WATERFLOWLAYOUTMODEUN_STATIC_0100
     * @tc.desc   Verify WaterFlow component is created successfully when layoutMode is set to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterFlowLayoutModeUn_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowLayoutModeUn_static_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('waterFlow_layoutMode_undefined');
        console.info('[waterFlowLayoutModeUn_static_0100] strJson: ' + strJson);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getString('$type')).assertEqual('WaterFlow');
        console.info('[waterFlowLayoutModeUn_static_0100] END');
        done();
      } catch (error) {
        console.error('[waterFlowLayoutModeUn_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   waterFlowLayoutModeUn_static_0200
     * @tc.number SUB_ARKUI_WATERFLOW_WATERFLOWLAYOUTMODEUN_STATIC_0200
     * @tc.desc   Test WaterFlow with undefined layoutMode, verify FlowItems render with correct text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterFlowLayoutModeUn_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowLayoutModeUn_static_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let driver = await Driver.create();
        await CommonFunc.sleep(1000);
        let firstItem = await driver.findComponent(ON.text('N0'));
        expect(firstItem !== null).assertTrue();
        console.info('[waterFlowLayoutModeUn_static_0200] END');
        done();
      } catch (error) {
        console.error('[waterFlowLayoutModeUn_static_0200] error:' + error);
        expect().assertFail();
        done();
      }
    });
  })
}
