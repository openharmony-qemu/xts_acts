'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON, PointerMatrix, Rect,Component } from '@ohos.UiTest';
import Utils from '../common/Utils';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

export default function nodeHandleByIdTest(){

  describe('NodeHandleByIdTest', () => {
    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(100);
      } catch (err) {
        console.info('NodeHandleByIdTest afterEach err: ' + JSON.stringify(err));
      }
    })

    
    /**
     * @tc.number   testNodeHandleById001
     * @tc.name     testNodeHandleById001
     * @tc.desc     testNodeHandleById001
     * @tc.level    Level.LEVEL1
     */
    it('testNodeHandleById001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.log('testNodeHandleById001 Utils.pushPage start')
        let PAGE_TAG = 'TestNodeHandleById';
        await Utils.pushPage(`node/${PAGE_TAG}`);
        console.log('testNodeHandleById001 Utils.pushPage end')
        await Utils.sleep(1000)
        let driver = Driver.create()
        await Utils.sleep(1000)
        console.log('driver.findComponent start')
        let button1 = await driver.findComponent(ON.id('button_id0'));
        await (button1?.click() as Promise<void>);
        await Utils.sleep(1000)
        let button2 = await driver.findComponent(ON.id('button_id1'));
        await (button2?.click() as Promise<void>);
        await Utils.sleep(1000)
        let button3 = await driver.findComponent(ON.id('button_id2'));
        await (button3?.click() as Promise<void>);
        await Utils.sleep(1000)
        let strJson1 = inspector.getInspectorByKey('button_id0')
        let obj1 = JSON.parseJsonElement(strJson1);
        let strJson2 = inspector.getInspectorByKey('button_id1')
        let obj2 = JSON.parseJsonElement(strJson2);
        let strJson3 = inspector.getInspectorByKey('button_id2')
        let obj3 = JSON.parseJsonElement(strJson3);
        expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
        expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
        expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
        done();
      } catch (err) {
        console.info('testNodeHandleById001 err: ' + JSON.stringify(err));
        done();
      }
    });

  })
}