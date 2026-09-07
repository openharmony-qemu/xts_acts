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

import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME_L = 1000;

export default function GetMaskClipPathTest() {
  describe('GetMaskClipPathTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("GetMaskClipPathTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/drawableDescriptor/GetMaskClipPath',
      }
      try {
        const routerInstance: Router = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get GetMaskClipPath state pages:" + JSON.stringify(pages));
        if (!("GetMaskClipPathTest" == pages.name)) {
          console.info("get GetMaskClipPath pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push GetMaskClipPath page error:" + err);
      }
      console.info("GetMaskClipPathTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("GetMaskClipPathTest after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_LAYEREDDRAWABLEDESCRIPTOR_GETMASKCLIPPATH_RETURN_STATIC_0100
     * @tc.name     layeredDrawableDescriptorGetMaskClipPathReturnType_static_0100
     * @tc.desc     Test LayeredDrawableDescriptor getMaskClipPath return value type is string
     * @tc.level    Level.LEVEL2
     */
    it('layeredDrawableDescriptorGetMaskClipPathReturnType_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[layeredDrawableDescriptorGetMaskClipPathReturnType_static_0100] START');
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME_L);
        const button = await driver.findComponent(ON.id('btnTest001'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_L);

        let strJson = inspector.getInspectorByKey('GetMaskClipPathTest001');
        let obj = JSON.parseJsonElement(strJson);
        let resultText: string = obj.getElement('$attrs').getString('content');
        console.info('[layeredDrawableDescriptorGetMaskClipPathReturnType_static_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        done();
      } catch (err) {
        console.error('[layeredDrawableDescriptorGetMaskClipPathReturnType_static_0100] error: ' + err);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number   SUB_ARKUI_LAYEREDDRAWABLEDESCRIPTOR_GETMASKCLIPPATH_RETURN_STATIC_0200
     * @tc.name     layeredDrawableDescriptorGetMaskClipPathNotEmpty_static_0100
     * @tc.desc     Test LayeredDrawableDescriptor getMaskClipPath return value is not empty
     * @tc.level    Level.LEVEL2
     */
    it('layeredDrawableDescriptorGetMaskClipPathNotEmpty_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[layeredDrawableDescriptorGetMaskClipPathNotEmpty_static_0100] START');
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME_L);
        const button = await driver.findComponent(ON.id('btnTest002'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_L);

        let strJson = inspector.getInspectorByKey('GetMaskClipPathTest002');
        let obj = JSON.parseJsonElement(strJson);
        let resultText: string = obj.getElement('$attrs').getString('content');
        console.info('[layeredDrawableDescriptorGetMaskClipPathNotEmpty_static_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('length=');
        done();
      } catch (err) {
        console.error('[layeredDrawableDescriptorGetMaskClipPathNotEmpty_static_0100] error: ' + err);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number   SUB_ARKUI_LAYEREDDRAWABLEDESCRIPTOR_GETMASKCLIPPATH_RETURN_STATIC_0300
     * @tc.name     layeredDrawableDescriptorGetMaskClipPathValidCommand_static_0100
     * @tc.desc     Test LayeredDrawableDescriptor getMaskClipPath return value starts with valid SVG path command
     * @tc.level    Level.LEVEL2
     */
    it('layeredDrawableDescriptorGetMaskClipPathValidCommand_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[layeredDrawableDescriptorGetMaskClipPathValidCommand_static_0100] START');
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME_L);
        const button = await driver.findComponent(ON.id('btnTest003'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_L);

        let strJson = inspector.getInspectorByKey('GetMaskClipPathTest003');
        let obj = JSON.parseJsonElement(strJson);
        let resultText: string = obj.getElement('$attrs').getString('content');
        console.info('[layeredDrawableDescriptorGetMaskClipPathValidCommand_static_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('starts with');
        done();
      } catch (err) {
        console.error('[layeredDrawableDescriptorGetMaskClipPathValidCommand_static_0100] error: ' + err);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number   SUB_ARKUI_LAYEREDDRAWABLEDESCRIPTOR_GETMASKCLIPPATH_RETURN_STATIC_0400
     * @tc.name     layeredDrawableDescriptorGetMaskClipPathConsistency_static_0100
     * @tc.desc     Test LayeredDrawableDescriptor getMaskClipPath returns consistent value across multiple calls
     * @tc.level    Level.LEVEL2
     */
    it('layeredDrawableDescriptorGetMaskClipPathConsistency_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[layeredDrawableDescriptorGetMaskClipPathConsistency_static_0100] START');
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME_L);
        const button = await driver.findComponent(ON.id('btnTest004'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_L);

        let strJson = inspector.getInspectorByKey('GetMaskClipPathTest004');
        let obj = JSON.parseJsonElement(strJson);
        let resultText: string = obj.getElement('$attrs').getString('content');
        console.info('[layeredDrawableDescriptorGetMaskClipPathConsistency_static_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('consistent');
        done();
      } catch (err) {
        console.error('[layeredDrawableDescriptorGetMaskClipPathConsistency_static_0100] error: ' + err);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number   SUB_ARKUI_LAYEREDDRAWABLEDESCRIPTOR_GETMASKCLIPPATH_RETURN_STATIC_0500
     * @tc.name     layeredDrawableDescriptorGetMaskClipPathStaticCall_static_0100
     * @tc.desc     Test LayeredDrawableDescriptor getMaskClipPath can be called statically without instance
     * @tc.level    Level.LEVEL2
     */
    it('layeredDrawableDescriptorGetMaskClipPathStaticCall_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[layeredDrawableDescriptorGetMaskClipPathStaticCall_static_0100] START');
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME_L);
        const button = await driver.findComponent(ON.id('btnTest005'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_L);

        let strJson = inspector.getInspectorByKey('GetMaskClipPathTest005');
        let obj = JSON.parseJsonElement(strJson);
        let resultText: string = obj.getElement('$attrs').getString('content');
        console.info('[layeredDrawableDescriptorGetMaskClipPathStaticCall_static_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('static');
        done();
      } catch (err) {
        console.error('[layeredDrawableDescriptorGetMaskClipPathStaticCall_static_0100] error: ' + err);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number   SUB_ARKUI_LAYEREDDRAWABLEDESCRIPTOR_GETMASKCLIPPATH_RETURN_STATIC_0600
     * @tc.name     layeredDrawableDescriptorGetMaskClipPathHasCoordinates_static_0100
     * @tc.desc     Test LayeredDrawableDescriptor getMaskClipPath return value contains numeric coordinates
     * @tc.level    Level.LEVEL2
     */
    it('layeredDrawableDescriptorGetMaskClipPathHasCoordinates_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[layeredDrawableDescriptorGetMaskClipPathHasCoordinates_static_0100] START');
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME_L);
        const button = await driver.findComponent(ON.id('btnTest006'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_L);

        let strJson = inspector.getInspectorByKey('GetMaskClipPathTest006');
        let obj = JSON.parseJsonElement(strJson);
        let resultText: string = obj.getElement('$attrs').getString('content');
        console.info('[layeredDrawableDescriptorGetMaskClipPathHasCoordinates_static_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('numeric');
        done();
      } catch (err) {
        console.error('[layeredDrawableDescriptorGetMaskClipPathHasCoordinates_static_0100] error: ' + err);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number   SUB_ARKUI_LAYEREDDRAWABLEDESCRIPTOR_GETMASKCLIPPATH_RETURN_STATIC_0700
     * @tc.name     layeredDrawableDescriptorGetMaskClipPathConstructPath_static_0100
     * @tc.desc     Test LayeredDrawableDescriptor getMaskClipPath return value can construct a Path object
     * @tc.level    Level.LEVEL2
     */
    it('layeredDrawableDescriptorGetMaskClipPathConstructPath_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[layeredDrawableDescriptorGetMaskClipPathConstructPath_static_0100] START');
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME_L);
        const button = await driver.findComponent(ON.id('btnTest007'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_L);

        let strJson = inspector.getInspectorByKey('GetMaskClipPathTest007');
        let obj = JSON.parseJsonElement(strJson);
        let resultText: string = obj.getElement('$attrs').getString('content');
        console.info('[layeredDrawableDescriptorGetMaskClipPathConstructPath_static_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('Path');
        done();
      } catch (err) {
        console.error('[layeredDrawableDescriptorGetMaskClipPathConstructPath_static_0100] error: ' + err);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number   SUB_ARKUI_LAYEREDDRAWABLEDESCRIPTOR_GETMASKCLIPPATH_RETURN_STATIC_0800
     * @tc.name     layeredDrawableDescriptorGetMaskClipPathApplyClipShape_static_0100
     * @tc.desc     Test LayeredDrawableDescriptor getMaskClipPath return value can be applied to Image clipShape without crash
     * @tc.level    Level.LEVEL2
     */
    it('layeredDrawableDescriptorGetMaskClipPathApplyClipShape_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[layeredDrawableDescriptorGetMaskClipPathApplyClipShape_static_0100] START');
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME_L);
        const button = await driver.findComponent(ON.id('btnTest008'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_L);

        let strJson = inspector.getInspectorByKey('GetMaskClipPathTest008');
        let obj = JSON.parseJsonElement(strJson);
        let resultText: string = obj.getElement('$attrs').getString('content');
        console.info('[layeredDrawableDescriptorGetMaskClipPathApplyClipShape_static_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('clipShape');

        let imgJson = inspector.getInspectorByKey('imgClipShape');
        let imgObj = JSON.parseJsonElement(imgJson);
        let imgId: string = imgObj.getElement('$attrs').getString('id');
        console.info('[layeredDrawableDescriptorGetMaskClipPathApplyClipShape_static_0100] imgId: ' + imgId);
        expect(imgId).assertEqual('imgClipShape');
        done();
      } catch (err) {
        console.error('[layeredDrawableDescriptorGetMaskClipPathApplyClipShape_static_0100] error: ' + err);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number   SUB_ARKUI_LAYEREDDRAWABLEDESCRIPTOR_GETMASKCLIPPATH_RETURN_STATIC_0900
     * @tc.name     layeredDrawableDescriptorGetMaskClipPathAfterInstance_static_0100
     * @tc.desc     Test LayeredDrawableDescriptor getMaskClipPath returns same value before and after creating instance
     * @tc.level    Level.LEVEL2
     */
    it('layeredDrawableDescriptorGetMaskClipPathAfterInstance_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[layeredDrawableDescriptorGetMaskClipPathAfterInstance_static_0100] START');
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME_L);
        const button = await driver.findComponent(ON.id('btnTest009'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_L);

        let strJson = inspector.getInspectorByKey('GetMaskClipPathTest009');
        let obj = JSON.parseJsonElement(strJson);
        let resultText: string = obj.getElement('$attrs').getString('content');
        console.info('[layeredDrawableDescriptorGetMaskClipPathAfterInstance_static_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('same result');
        done();
      } catch (err) {
        console.error('[layeredDrawableDescriptorGetMaskClipPathAfterInstance_static_0100] error: ' + err);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number   SUB_ARKUI_LAYEREDDRAWABLEDESCRIPTOR_GETMASKCLIPPATH_RETURN_STATIC_1000
     * @tc.name     layeredDrawableDescriptorGetMaskClipPathHasCloseCommand_static_0100
     * @tc.desc     Test LayeredDrawableDescriptor getMaskClipPath return value contains path closing command Z or z
     * @tc.level    Level.LEVEL2
     */
    it('layeredDrawableDescriptorGetMaskClipPathHasCloseCommand_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[layeredDrawableDescriptorGetMaskClipPathHasCloseCommand_static_0100] START');
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME_L);
        const button = await driver.findComponent(ON.id('btnTest010'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_L);

        let strJson = inspector.getInspectorByKey('GetMaskClipPathTest010');
        let obj = JSON.parseJsonElement(strJson);
        let resultText: string = obj.getElement('$attrs').getString('content');
        console.info('[layeredDrawableDescriptorGetMaskClipPathHasCloseCommand_static_0100] result: ' + resultText);

        expect(resultText).assertContain('PASS');
        expect(resultText).assertContain('closing');
        done();
      } catch (err) {
        console.error('[layeredDrawableDescriptorGetMaskClipPathHasCloseCommand_static_0100] error: ' + err);
        expect(false).assertTrue();
        done();
      }
    })
  })
}
