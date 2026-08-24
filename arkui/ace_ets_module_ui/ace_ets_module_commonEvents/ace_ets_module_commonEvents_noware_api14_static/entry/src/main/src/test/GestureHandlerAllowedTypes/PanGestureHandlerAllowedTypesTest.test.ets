'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Point } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function PanGestureHandlerAllowedTypesTest() {
  describe('PanGestureHandlerAllowedTypesTest', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandlerAllowedTypes/PanGestureHandlerAllowedTypes',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        let pages = routerInstance.getState();
        console.info("get PanGestureHandlerAllowedTypesTest state pages:" + JSON.stringify(pages));
        if (!("PanGestureHandlerAllowedTypes" == pages.name)) {
          console.info("get PanGestureHandlerAllowedTypesTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push PanGestureHandlerAllowedTypesTest page error:" + err);
      }
      console.info("PanGestureHandlerAllowedTypesTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("PanGestureHandlerAllowedTypesTest after each error: " + err);
      }
      console.info("PanGestureHandlerAllowedTypesTest after each called");
    });

    

/**
     * @tc.number   PanGestureHandlerAllowedTypesTest_static_0010
     * @tc.name     PanGestureHandlerAllowedTypesTest_static_0010
     * @tc.desc     PanGestureHandlerAllowedTypesTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('PanGestureHandlerAllowedTypesTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('PanGestureHandlerAllowedTypesTest_static_0010 START');
        await CommonFunc.sleep(1000);
        let windowOffsetX:number = AppStorage.get<number>("winLeft") as number;
        let windowOffsetY:number = AppStorage.get<number>("winTop") as number;
        console.log('PanGestureHandlerAllowedTypesTest_static_0010 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
        let areaObj1 = CommonFunc.getComponentRectOnScreen('PanGestureHandlerAllowedTypes_Text');
        let areaHeight1 = areaObj1.bottom - areaObj1.top
        let areaWidth1 = areaObj1.right - areaObj1.left
        console.log('PanGestureHandlerAllowedTypesTest_static_0010 areaObj1',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
        console.log('PanGestureHandlerAllowedTypesTest_static_0010 areaObj1 clicked start',Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2))
        console.log('PanGestureHandlerAllowedTypesTest_static_0010 areaObj1 clicked end',Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2))

        // trigger gesture with finger
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2).toInt(),Math.round(areaObj1.top + areaHeight1/2).toInt(),Math.round(areaObj1.left + areaWidth1 * 0.8).toInt(),Math.round(areaObj1.top + areaHeight1/2).toInt())
        await CommonFunc.sleep(3000);
        let text1 = inspector.getInspectorByKey('PanGestureHandlerAllowedTypes_result');
        let obj1 = JSON.parseJsonElement(text1);
        console.log('PanGestureHandlerAllowedTypesTest_static_0010 obj1 $attrs content',obj1.getElement('$attrs').getString('content'),obj1)
        expect(obj1.getElement('$attrs').getString('content')).assertEqual('allowed types success');

        // trigger gesture with mouse
        await CommonFunc.sleep(1000);
        await driver.mouseDrag({x: Math.round(areaObj1.left + areaWidth1 * 0.2).toInt(),y: Math.round(areaObj1.top + areaHeight1/2).toInt()} as Point, {x: Math.round(areaObj1.left + areaWidth1 * 0.8).toInt(), y: Math.round(areaObj1.top + areaHeight1/2).toInt()} as Point)
        await CommonFunc.sleep(3000);
        let text2 = inspector.getInspectorByKey('PanGestureHandlerAllowedTypes_result');
        let obj2 = JSON.parseJsonElement(text2);
        console.log('PanGestureHandlerAllowedTypesTest_static_0010 obj2 $attrs content',obj2.getElement('$attrs').getString('content'),obj2)
        expect(obj2.getElement('$attrs').getString('content')).assertEqual('allowed types success');

        // click button to change types to [SourceTool.MOUSE]
        let button1 = await driver.findComponent(ON.id('Mouse_Type'));
        await (button1?.click() as Promise<void>);
        await CommonFunc.sleep(3000);
        let text3 = inspector.getInspectorByKey('PanGestureHandlerAllowedTypes_result');
        let obj3 = JSON.parseJsonElement(text3);
        console.log('PanGestureHandlerAllowedTypesTest_static_0010 obj3 $attrs content',obj3.getElement('$attrs').getString('content'))
        expect(obj3.getElement('$attrs').getString('content')).assertEqual('allowed types default');

        // trigger gesture again with finger
        await CommonFunc.sleep(1000);
        await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2).toInt(),Math.round(areaObj1.top + areaHeight1/2).toInt(),Math.round(areaObj1.left + areaWidth1 * 0.8).toInt(),Math.round(areaObj1.top + areaHeight1/2).toInt())
        await CommonFunc.sleep(3000);
        let text4 = inspector.getInspectorByKey('PanGestureHandlerAllowedTypes_result');
        let obj4 = JSON.parseJsonElement(text4);
        console.log('PanGestureHandlerAllowedTypesTest_static_0010 obj4 $attrs content',obj4.getElement('$attrs').getString('content'),obj4)
        expect(obj4.getElement('$attrs').getString('content')).assertEqual('allowed types default');

        // trigger gesture again with mouse
        await CommonFunc.sleep(1000);
        await driver.mouseDrag({x: Math.round(areaObj1.left + areaWidth1 * 0.2).toInt(),y: Math.round(areaObj1.top + areaHeight1/2).toInt()} as Point, {x: Math.round(areaObj1.left + areaWidth1 * 0.8).toInt(), y: Math.round(areaObj1.top + areaHeight1/2).toInt()} as Point)
        await CommonFunc.sleep(3000);
        let text5 = inspector.getInspectorByKey('PanGestureHandlerAllowedTypes_result');
        let obj5 = JSON.parseJsonElement(text5);
        console.log('PanGestureHandlerAllowedTypesTest_static_0010 obj5 $attrs content',obj5.getElement('$attrs').getString('content'),obj5)
        expect(obj5.getElement('$attrs').getString('content')).assertEqual('allowed types success');

        // click button to change types to [SourceTool.Finger]
        let button2 = await driver.findComponent(ON.id('Finger_Type'));
        await (button2?.click() as Promise<void>);
        await CommonFunc.sleep(3000);
        let text6 = inspector.getInspectorByKey('PanGestureHandlerAllowedTypes_result');
        let obj6 = JSON.parseJsonElement(text6);
        console.log('PanGestureHandlerAllowedTypesTest_static_0010 obj6 $attrs content',obj6.getElement('$attrs').getString('content'),obj6)
        expect(obj6.getElement('$attrs').getString('content')).assertEqual('allowed types default');

        // trigger gesture again with mouse
        await CommonFunc.sleep(1000);
        await driver.mouseDrag({x: Math.round(areaObj1.left + areaWidth1 * 0.2).toInt(),y: Math.round(areaObj1.top + areaHeight1/2).toInt()} as Point, {x: Math.round(areaObj1.left + areaWidth1 * 0.8).toInt(), y: Math.round(areaObj1.top + areaHeight1/2).toInt()} as Point)
        await CommonFunc.sleep(3000);
        let text7 = inspector.getInspectorByKey('PanGestureHandlerAllowedTypes_result');
        let obj7 = JSON.parseJsonElement(text7);
        console.log('PanGestureHandlerAllowedTypesTest_static_0010 obj7 $attrs content',obj7.getElement('$attrs').getString('content'),obj7)
        expect(obj7.getElement('$attrs').getString('content')).assertEqual('allowed types default');

        // trigger gesture again with finger
        await CommonFunc.sleep(1000);
        await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2).toInt(),Math.round(areaObj1.top + areaHeight1/2).toInt(),Math.round(areaObj1.left + areaWidth1 * 0.8).toInt(),Math.round(areaObj1.top + areaHeight1/2).toInt())
        await CommonFunc.sleep(3000);
        let text8 = inspector.getInspectorByKey('PanGestureHandlerAllowedTypes_result');
        let obj8 = JSON.parseJsonElement(text8);
        console.log('PanGestureHandlerAllowedTypesTest_static_0010 obj8 $attrs content',obj8.getElement('$attrs').getString('content'),obj8)
        expect(obj8.getElement('$attrs').getString('content')).assertEqual('allowed types success');

        // change types to invalid types
        await CommonFunc.sleep(1000);
        let button3 = await driver.findComponent(ON.id('Invalid_type'));
        await (button3?.click() as Promise<void>);
        await CommonFunc.sleep(3000);
        let text9 = inspector.getInspectorByKey('PanGestureHandlerAllowedTypes_result');
        let obj9 = JSON.parseJsonElement(text9);
        console.log('PanGestureHandlerAllowedTypesTest_static_0010 obj9 $attrs content',obj9.getElement('$attrs').getString('content'),obj9)
        expect(obj9.getElement('$attrs').getString('content')).assertEqual('allowed types default');

        console.info('PanGestureHandlerAllowedTypesTest_static_0010 END');
        done();
      } catch (err) {
        console.info('PanGestureHandlerAllowedTypesTest_static_0010 err: ' + JSON.stringify(err));
        done();
      }
    });
  })
}
