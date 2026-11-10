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
import { describe, it, expect, Level, beforeEach } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function WaterFlowScrollSnapStrategyTest() {
  describe('WaterFlowScrollSnapStrategyTest', () => {

    beforeEach(async () => {
      console.info('WaterFlowScrollSnapStrategyTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowScrollSnapStrategy',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get WaterFlowScrollSnapStrategyTest state pages:' + JSON.stringify(pages));
        if (!('WaterFlowScrollSnapStrategy' == pages.name)) {
          console.info('get WaterFlowScrollSnapStrategyTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push WaterFlowScrollSnapStrategyTest page error:' + err);
      }
      console.info('WaterFlowScrollSnapStrategyTest beforeEach end');
    });

    /**
     * @tc.name   WaterFlowScrollSnapStrategy_static_0100
     * @tc.number SUB_ARKUI_WATERFLOW_SCROLLSNAPSTRATEGY_STATIC_0100
     * @tc.desc   Test WaterFlow scrollSnapStrategy property with ScrollSnapAlign.START
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('WaterFlowScrollSnapStrategy_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('wf_snapStrategy_start');
      let obj = JSON.parseJsonElement(strJson);
      let content = obj.getElement('$attrs').getString('scrollSnapStrategy');
      console.log('[WaterFlowScrollSnapStrategy_static_0100] scrollSnapStrategy: ' + content);
      expect(obj.getString('$type')).assertEqual('WaterFlow');
      expect(content).assertEqual('ScrollSnapAlign.START');
      done();
    });

    /**
     * @tc.name   WaterFlowScrollSnapStrategy_static_0200
     * @tc.number SUB_ARKUI_WATERFLOW_SCROLLSNAPSTRATEGY_STATIC_0200
     * @tc.desc   Test WaterFlow scrollSnapStrategy property with ScrollSnapAlign.CENTER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('WaterFlowScrollSnapStrategy_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('wf_snapStrategy_center');
      let obj = JSON.parseJsonElement(strJson);
      let content = obj.getElement('$attrs').getString('scrollSnapStrategy');
      console.log('[WaterFlowScrollSnapStrategy_static_0200] scrollSnapStrategy: ' + content);
      expect(obj.getString('$type')).assertEqual('WaterFlow');
      expect(content).assertEqual('ScrollSnapAlign.CENTER');
      done();
    });

    /**
     * @tc.name   WaterFlowScrollSnapStrategy_static_0300
     * @tc.number SUB_ARKUI_WATERFLOW_SCROLLSNAPSTRATEGY_STATIC_0300
     * @tc.desc   Test WaterFlow scrollSnapStrategy property with ScrollSnapAlign.END
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('WaterFlowScrollSnapStrategy_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('wf_snapStrategy_end');
      let obj = JSON.parseJsonElement(strJson);
      let content = obj.getElement('$attrs').getString('scrollSnapStrategy');
      console.log('[WaterFlowScrollSnapStrategy_static_0300] scrollSnapStrategy: ' + content);
      expect(obj.getString('$type')).assertEqual('WaterFlow');
      expect(content).assertEqual('ScrollSnapAlign.END');
      done();
    });

    /**
     * @tc.name   WaterFlowScrollSnapStrategy_static_0400
     * @tc.number SUB_ARKUI_WATERFLOW_SCROLLSNAPSTRATEGY_STATIC_0400
     * @tc.desc   Test WaterFlow scrollSnapStrategy property with ScrollSnapAlign.NONE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('WaterFlowScrollSnapStrategy_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('wf_snapStrategy_none');
      let obj = JSON.parseJsonElement(strJson);
      let content = obj.getElement('$attrs').getString('scrollSnapStrategy');
      console.log('[WaterFlowScrollSnapStrategy_static_0400] scrollSnapStrategy: ' + content);
      expect(obj.getString('$type')).assertEqual('WaterFlow');
      expect(content).assertEqual('ScrollSnapAlign.NONE');
      done();
    });

    /**
     * @tc.name   WaterFlowScrollSnapStrategy_static_0500
     * @tc.number SUB_ARKUI_WATERFLOW_SCROLLSNAPSTRATEGY_STATIC_0500
     * @tc.desc   Test WaterFlow scrollSnapStrategy property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('WaterFlowScrollSnapStrategy_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('wf_snapStrategy_undefined');
      let obj = JSON.parseJsonElement(strJson);
      let content = obj.getElement('$attrs').getString('scrollSnapStrategy');
      console.log('[WaterFlowScrollSnapStrategy_static_0500] scrollSnapStrategy: ' + content);
      expect(obj.getString('$type')).assertEqual('WaterFlow');
      expect(content).assertEqual('ScrollSnapAlign.NONE');
      done();
    });

    /**
     * @tc.name   WaterFlowScrollSnapStrategy_static_0600
     * @tc.number SUB_ARKUI_WATERFLOW_SCROLLSNAPSTRATEGY_STATIC_0600
     * @tc.desc   Test WaterFlow scrollSnapStrategy property with ScrollSnapOffsetProvider object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('WaterFlowScrollSnapStrategy_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('wf_snapStrategy_provider');
      let obj = JSON.parseJsonElement(strJson);
      let content = obj.getElement('$attrs').getString('scrollSnapStrategy');
      console.log('[WaterFlowScrollSnapStrategy_static_0600] scrollSnapStrategy: ' + content);
      expect(content !== 'ScrollSnapAlign.NONE').assertTrue();
      done();
    });
  })
}
