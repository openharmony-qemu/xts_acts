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
import { Driver } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function ImageAnimatorAttributeModifierTest() {
  describe('ImageAnimatorAttributeModifierTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ImageAnimatorAttributeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimator/ImageAnimatorAttributeModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageAnimatorAttributeModifierTest state pages:" + JSON.stringify(pages));
        if (!("ImageAnimatorAttributeModifier" == pages.name)) {
          console.info("get ImageAnimatorAttributeModifierTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("push ImageAnimatorAttributeModifierTest page error:" + err);
      }
      console.info("ImageAnimatorAttributeModifierTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("ImageAnimatorAttributeModifierTest after each called");
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_IMAGES_PARAM_0100
     * @tc.name   ImageAnimatorAttributeModifierTest_static_0100
     * @tc.desc   Verify images property set via AttributeModifier applyNormalAttribute
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_0100 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_images');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0100] $type: ' + obj.getString('$type'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
      } catch (err) {
        console.error('[static_0100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_STATE_PARAM_0100
     * @tc.name   ImageAnimatorAttributeModifierTest_static_0200
     * @tc.desc   Verify state property set to AnimationStatus.Initial via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_0200 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_state_initial');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0200] $type: ' + obj.getString('$type'));
        console.info('[static_0200] state: ' + obj.getElement('$attrs').getString('state'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('state')).assertContain('Initial');
      } catch (err) {
        console.error('[static_0200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_STATE_PARAM_0200
     * @tc.name   ImageAnimatorAttributeModifierTest_static_0300
     * @tc.desc   Verify state property set to AnimationStatus.Running via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_0300 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_state_running');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0300] $type: ' + obj.getString('$type'));
        console.info('[static_0300] state: ' + obj.getElement('$attrs').getString('state'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('state')).assertContain('Running');
      } catch (err) {
        console.error('[static_0300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_DURATION_PARAM_0100
     * @tc.name   ImageAnimatorAttributeModifierTest_static_0400
     * @tc.desc   Verify duration property set to 2000 via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_0400 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_duration_2000');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0400] $type: ' + obj.getString('$type'));
        console.info('[static_0400] duration: ' + obj.getElement('$attrs').getString('duration'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('duration')).assertContain('2000');
      } catch (err) {
        console.error('[static_0400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_DURATION_PARAM_0200
     * @tc.name   ImageAnimatorAttributeModifierTest_static_0500
     * @tc.desc   Verify duration property set to 500 via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_0500 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_duration_500');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0500] $type: ' + obj.getString('$type'));
        console.info('[static_0500] duration: ' + obj.getElement('$attrs').getString('duration'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('duration')).assertContain('500');
      } catch (err) {
        console.error('[static_0500] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_REVERSE_PARAM_0100
     * @tc.name   ImageAnimatorAttributeModifierTest_static_0600
     * @tc.desc   Verify reverse property set to true via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_0600 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_reverse_true');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0600] $type: ' + obj.getString('$type'));
        console.info('[static_0600] reverse: ' + obj.getElement('$attrs').getString('reverse'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('reverse')).assertContain('true');
      } catch (err) {
        console.error('[static_0600] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_REVERSE_PARAM_0200
     * @tc.name   ImageAnimatorAttributeModifierTest_static_0700
     * @tc.desc   Verify reverse property set to false via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_0700 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_reverse_false');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0700] $type: ' + obj.getString('$type'));
        console.info('[static_0700] reverse: ' + obj.getElement('$attrs').getString('reverse'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('reverse')).assertContain('false');
      } catch (err) {
        console.error('[static_0700] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_FIXEDSIZE_PARAM_0100
     * @tc.name   ImageAnimatorAttributeModifierTest_static_0800
     * @tc.desc   Verify fixedSize property set to true via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_0800 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_fixedsize_true');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0800] $type: ' + obj.getString('$type'));
        console.info('[static_0800] fixedSize: ' + obj.getElement('$attrs').getString('fixedSize'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('fixedSize')).assertContain('true');
      } catch (err) {
        console.error('[static_0800] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_FIXEDSIZE_PARAM_0200
     * @tc.name   ImageAnimatorAttributeModifierTest_static_0900
     * @tc.desc   Verify fixedSize property set to false via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_0900 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_fixedsize_false');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0900] $type: ' + obj.getString('$type'));
        console.info('[static_0900] fixedSize: ' + obj.getElement('$attrs').getString('fixedSize'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('fixedSize')).assertContain('false');
      } catch (err) {
        console.error('[static_0900] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_FILLMODE_PARAM_0100
     * @tc.name   ImageAnimatorAttributeModifierTest_static_1000
     * @tc.desc   Verify fillMode property set to FillMode.Forwards via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_1000 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_fillmode_forwards');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1000] $type: ' + obj.getString('$type'));
        console.info('[static_1000] fillMode: ' + obj.getElement('$attrs').getString('fillMode'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('fillMode')).assertContain('Forwards');
      } catch (err) {
        console.error('[static_1000] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_FILLMODE_PARAM_0200
     * @tc.name   ImageAnimatorAttributeModifierTest_static_1100
     * @tc.desc   Verify fillMode property set to FillMode.None via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_1100 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_fillmode_none');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1100] $type: ' + obj.getString('$type'));
        console.info('[static_1100] fillMode: ' + obj.getElement('$attrs').getString('fillMode'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('fillMode')).assertContain('None');
      } catch (err) {
        console.error('[static_1100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_ITERATIONS_PARAM_0100
     * @tc.name   ImageAnimatorAttributeModifierTest_static_1200
     * @tc.desc   Verify iterations property set to 3 via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_1200 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_iterations_3');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1200] $type: ' + obj.getString('$type'));
        console.info('[static_1200] iterations: ' + obj.getElement('$attrs').getString('iterations'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('iterations')).assertContain('3');
      } catch (err) {
        console.error('[static_1200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_ITERATIONS_PARAM_0200
     * @tc.name   ImageAnimatorAttributeModifierTest_static_1300
     * @tc.desc   Verify iterations property set to -1 (infinite) via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_1300 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_iterations_infinite');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1300] $type: ' + obj.getString('$type'));
        console.info('[static_1300] iterations: ' + obj.getElement('$attrs').getString('iterations'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('iterations')).assertContain('-1');
      } catch (err) {
        console.error('[static_1300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_MONITORINVISIBLEAREA_PARAM_0100
     * @tc.name   ImageAnimatorAttributeModifierTest_static_1400
     * @tc.desc   Verify monitorInvisibleArea property set to true via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_1400 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_monitor_invisible_true');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1400] $type: ' + obj.getString('$type'));
        console.info('[static_1400] monitorInvisibleArea: ' + obj.getElement('$attrs').getString('monitorInvisibleArea'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('monitorInvisibleArea')).assertContain('true');
      } catch (err) {
        console.error('[static_1400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_MONITORINVISIBLEAREA_PARAM_0200
     * @tc.name   ImageAnimatorAttributeModifierTest_static_1500
     * @tc.desc   Verify monitorInvisibleArea property set to false via AttributeModifier
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorAttributeModifierTest_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorAttributeModifierTest_static_1500 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_modifier_monitor_invisible_false');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_1500] $type: ' + obj.getString('$type'));
        console.info('[static_1500] monitorInvisibleArea: ' + obj.getElement('$attrs').getString('monitorInvisibleArea'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('monitorInvisibleArea')).assertContain('false');
      } catch (err) {
        console.error('[static_1500] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
  })
}
