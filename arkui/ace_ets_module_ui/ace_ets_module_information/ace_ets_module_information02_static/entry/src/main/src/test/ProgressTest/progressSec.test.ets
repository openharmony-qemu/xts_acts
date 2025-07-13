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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index'
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import resourceManager from '@ohos.resourceManager';
import { Resource } from '@ohos.arkui.component';
import {
  Resource,
  Color,
  $r,
  FontWeight,
  FontStyle,
  ProgressStatus,
  LinearGradient,
} from '@ohos.arkui.component';
import inspector from "@ohos.arkui.inspector";
import { ProgressSec } from "../../../ets/MainAbility/pages/Progress/ProgressSec";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Utils.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

let emitKey = "emitUserAgent";

function progressFontWeight(sysFontWeight: Resource): string {
  let fontWeightArr: string[] = [
    '100',
    '200',
    '300',
    '400',
    '500',
    '600',
    '700',
    '800',
    '900',
    'FontWeight.Bold',
    'FontWeight.Normal',
    'FontWeight.Bolder',
    'FontWeight.Lighter',
    'FontWeight.Medium',
    'FontWeight.Regular']
  // let resourceFontWeight = OffscreenCanvas.getContext().resourceManager.getNumber(sysFontWeight.id)
  // let newFontWeight: string = fontWeightArr[resourceFontWeight]
  // return newFontWeight;
  return ''
}

export default function progressSecTest() {
  describe('ActsProgressSecTest', () => {
    beforeAll(() => {
      console.info("ActsProgressSecTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    afterEach(async (): Promise<void> => {
      console.info("ActsProgressSecTest afterEach start");
      let progress_capsule_borderWidth_number: number = 0
      let progress_capsule_borderWidth_string: string = '0vp'
      let progress_capsule_borderWidth_resource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
      let progress_capsule_borderColor_number: number = 0xFF000000
      let progress_capsule_borderColor_string: string = '#FFFF9535'
      let progress_capsule_borderColor_color: Color = Color.Red
      let progress_capsule_borderColor_resource: Resource = $r('sys.color.ohos_id_color_connected')
      let progress_capsule_fontSize_number: number = 0
      let progress_capsule_fontSize_string: string = '0vp'
      let progress_capsule_fontSize_resource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
      let progress_capsule_fontWeight_number: number = 400
      let progress_capsule_fontWeight_string: string = '400'
      let progress_capsule_fontWeight_fontWeight: FontWeight = FontWeight.Normal
      let progress_capsule_fontStyle_fontStyle: FontStyle = FontStyle.Normal
      let progress_capsule_fontColor_number: number = 0xFF000000
      let progress_capsule_fontColor_string: string = '#FFFF9535'
      let progress_capsule_fontColor_color: Color = Color.Red
      let progress_capsule_fontColor_resource: Resource = $r('sys.color.ohos_id_color_connected')
      let progress_capsule_content_string: string = '下载'
      let progress_capsule_enableScanEffect_boolean: boolean = false
      let progress_capsule_showDefaultPercentage_boolean: boolean = false
      let progress_capsule_enableSmoothEffect_boolean: boolean = false

      let progress_ring_strokeWidth_number: number = 4
      let progress_ring_strokeWidth_string: string = '4vp'
      let progress_ring_strokeWidth_resource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
      let progress_ring_shadow_bool: boolean = false
      let progress_ring_status_progressStatus: ProgressStatus = ProgressStatus.PROGRESSING
      let progress_ring_color_purity: number = 0x000000
      // let progress_ring_color_linear_number: LinearGradient = new LinearGradient([{
      //   color: 0xFFFF0000, offset: 0
      // }, {
      //   color: 0xFFFFFFFF, offset: 1
      // }])
      // let progress_ring_color_linear_string: LinearGradient = new LinearGradient([{
      //   color: '#FFFF9A35', offset: 0
      // }, {
      //   color: '#FFFFFFFF', offset: 1
      // }])
      // let progress_ring_color_linear_color: LinearGradient = new LinearGradient([{
      //   color: Color.Red, offset: 0
      // }, {
      //   color: Color.White, offset: 1
      // }])
      // let progress_ring_color_linear_resource: LinearGradient = new LinearGradient([{
      //   color: $r('sys.color.ohos_id_color_connected'), offset: 0
      // }, {
      //   color: $r('sys.color.ohos_id_color_background'), offset: 1
      // }])
      // let progress_ring_color_linear_null: LinearGradient | null = null
      // let progress_ring_color_linear_undefined: LinearGradient | undefined = undefined
      let progress_ring_enableScanEffect_boolean: boolean = false
      let progress_ring_enableSmoothEffect_boolean: boolean = false

      let progress_linear_enableScanEffect_boolean: boolean = false
      let progress_linear_enableSmoothEffect_boolean: boolean = false

      let progress_scaleRing_enableSmoothEffect_boolean: boolean = false
      let progress_eclipse_enableSmoothEffect_boolean: boolean = false

      try {
        let eventData: events_emitter.EventData = {
          data: {
            'progress_capsule_borderWidth_number': progress_capsule_borderWidth_number,
            'progress_capsule_borderWidth_string': progress_capsule_borderWidth_string,
            'progress_capsule_borderWidth_resource': progress_capsule_borderWidth_resource,
            'progress_capsule_borderColor_number': progress_capsule_borderColor_number,
            'progress_capsule_borderColor_string': progress_capsule_borderColor_string,
            'progress_capsule_borderColor_color': progress_capsule_borderColor_color,
            'progress_capsule_borderColor_resource': progress_capsule_borderColor_resource,
            'progress_capsule_fontSize_number': progress_capsule_fontSize_number,
            'progress_capsule_fontSize_string': progress_capsule_fontSize_string,
            'progress_capsule_fontSize_resource': progress_capsule_fontSize_resource,
            'progress_capsule_fontWeight_number': progress_capsule_fontWeight_number,
            'progress_capsule_fontWeight_string': progress_capsule_fontWeight_string,
            'progress_capsule_fontWeight_fontWeight': progress_capsule_fontWeight_fontWeight,
            'progress_capsule_fontStyle_fontStyle': progress_capsule_fontStyle_fontStyle,
            'progress_capsule_fontColor_number': progress_capsule_fontColor_number,
            'progress_capsule_fontColor_string': progress_capsule_fontColor_string,
            'progress_capsule_fontColor_color': progress_capsule_fontColor_color,
            'progress_capsule_fontColor_resource': progress_capsule_fontColor_resource,
            'progress_capsule_content_string': progress_capsule_content_string,
            'progress_capsule_enableScanEffect_boolean': progress_capsule_enableScanEffect_boolean,
            'progress_capsule_showDefaultPercentage_boolean': progress_capsule_showDefaultPercentage_boolean,
            'progress_capsule_enableSmoothEffect_boolean': progress_capsule_enableSmoothEffect_boolean,

            'progress_ring_strokeWidth_number': progress_ring_strokeWidth_number,
            'progress_ring_strokeWidth_string': progress_ring_strokeWidth_string,
            'progress_ring_strokeWidth_resource': progress_ring_strokeWidth_resource,
            'progress_ring_shadow_bool': progress_ring_shadow_bool,
            'progress_ring_status_progressStatus': progress_ring_status_progressStatus,
            'progress_ring_color_purity': progress_ring_color_purity,
            // 'progress_ring_color_linear_number': progress_ring_color_linear_number,
            // 'progress_ring_color_linear_string': progress_ring_color_linear_string,
            // 'progress_ring_color_linear_color': progress_ring_color_linear_color,
            // 'progress_ring_color_linear_resource': progress_ring_color_linear_resource,
            // 'progress_ring_color_linear_null': progress_ring_color_linear_null,
            // 'progress_ring_color_linear_undefined': progress_ring_color_linear_undefined,
            'progress_ring_enableScanEffect_boolean': progress_ring_enableScanEffect_boolean,
            'progress_ring_enableSmoothEffect_boolean': progress_ring_enableSmoothEffect_boolean,

            'progress_linear_enableScanEffect_boolean': progress_linear_enableScanEffect_boolean,
            'progress_linear_enableSmoothEffect_boolean': progress_linear_enableSmoothEffect_boolean,

            'progress_scaleRing_enableSmoothEffect_boolean': progress_scaleRing_enableSmoothEffect_boolean,
            'progress_eclipse_enableSmoothEffect_boolean': progress_eclipse_enableSmoothEffect_boolean,
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("ActsProgressSecTest afterEach start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.info("ActsProgressSecTest afterEach start to publish change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
    })

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100
     * @tc.name ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100
     * @tc.desc Get the default value of backgroundColor
     */
    it('ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      let newJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100]: " + JSON.stringify(newJson));
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100]: " + JSON.stringify(newJsonDefault));

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);

      let strColor = JSON.stringify(objDefault.getElement('$attrs').getElement('backgroundColor'));
      let strOpicity = JSON.stringify(objDefault.getElement('$attrs').getElement('padding'));
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('backgroundColor')));
      expect(obj.getElement('$attrs').getElement('backgroundColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Color_0100
     * @tc.name ArkUI_Stage_Progress_Capsule_Color_static_0100
     * @tc.desc Get the default value of color
     */
    it('ArkUI_Stage_Progress_Capsule_Color_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      let newJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(newJson));
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(newJsonDefault));

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);

      let strColor = JSON.stringify(objDefault.getElement('$attrs').getElement('color'));
      let strOpicity = JSON.stringify(objDefault.getElement('$attrs').getElement('margin'));
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('color')));
      expect(obj.getElement('$attrs').getElement('color')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0100
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderWidth_static_0100
     * @tc.desc Get the default value of capsuleStyle.borderWidth
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      let newJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth"));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0200
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderWidth_static_0200
     * @tc.desc Set the value of capsuleStyle.borderWidth as 3
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = 3;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")).assertEqual("3.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0300
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderWidth_static_0300
     * @tc.desc Set the value of capsuleStyle.borderWidth as 3vp
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '3vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")).assertEqual("3.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0400
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderWidth_static_0400
     * @tc.desc Set the value of capsuleStyle.borderWidth as ohos_id_text_margin_vertical
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " + JSON.stringify(newJson));
      let progress_capsule_borderWidth_resource = $r('sys.float.ohos_id_text_margin_vertical');
      let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      progressSec.message.notify({name: 'progress_capsule_borderWidth_resource', value: progress_capsule_borderWidth_resource})

      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")).assertEqual(objJudge.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth"));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0500
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderWidth_static_0500
     * @tc.desc Set the value of capsuleStyle.borderWidth as 9px
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")).assertEqual("9.00px");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0600
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderWidth_static_0600
     * @tc.desc Set the value of capsuleStyle.borderWidth as 9vp
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")).assertEqual("9.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0700
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderWidth_static_0700
     * @tc.desc Set the value of capsuleStyle.borderWidth as 9fp
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")).assertEqual("9.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0800
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderWidth_static_0800
     * @tc.desc Set the value of capsuleStyle.borderWidth as 9lpx
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")).assertEqual("9.00lpx");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0900
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderWidth_static_0900
     * @tc.desc Set the value of capsuleStyle.borderWidth as 0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")).assertEqual("0.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_1000
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderWidth_static_1000
     * @tc.desc Set the value of capsuleStyle.borderWidth as -10
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = -10;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth"));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_1100
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderWidth_static_1100
     * @tc.desc Set the value of capsuleStyle.borderWidth as 10000
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = 10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")).assertEqual("10000.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_static_1200
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderWidth_static_1200
     * @tc.desc Set the value of capsuleStyle.borderWidth as null
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth"));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_static_1300
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderWidth_static_1300
     * @tc.desc Set the value of capsuleStyle.borderWidth as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth")).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement("borderWidth"));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0100
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderColor_static_0100
     * @tc.desc Get the default value of capsuleStyle.borderColor
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      let newJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(newJson));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(newJsonDefault));

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);

      let strColor = JSON.stringify(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor'));
      let strOpicity = JSON.stringify(objDefault.getElement('$attrs').getElement('margin'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0200
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderColor_static_0200
     * @tc.desc Set the value of capsuleStyle.borderColor as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_number = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderColor_number": progress_capsule_borderColor_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0300
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderColor_static_0300
     * @tc.desc Set the value of capsuleStyle.borderColor as '#FFFF9535'
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = '#FFFF9535';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderColor_string": progress_capsule_borderColor_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor')).assertEqual("#FFFF9535");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0400
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderColor_static_0400
     * @tc.desc Set the value of capsuleStyle.borderColor as Color.Red
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_color = Color.Red;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderColor_color": progress_capsule_borderColor_color
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0500
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderColor_static_0500
     * @tc.desc Set the value of capsuleStyle.borderColor as ohos_id_color_connected
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_resource = $r('sys.color.ohos_id_color_connected');
      let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      progressSec.message.notify({
        name: 'progress_capsule_borderColor_resource', value: progress_capsule_borderColor_resource
      })
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderColor")))
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderColor")).assertEqual(objJudge.getElement('$attrs').getElement("capsuleStyle").getElement("borderColor"));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0600
     * @tc.name ArkUI_Stage_Progress_Capsule_BorderColor_static_0600
     * @tc.desc Set the value of capsuleStyle.borderColor as 'abcdefghijk'
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderColor_string": progress_capsule_borderColor_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(strJson))
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(strJsonDefault));

      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);

      let strColor = JSON.stringify(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement("borderColor"));
      let strOpicity = JSON.stringify(objDefault.getElement('$attrs').getElement('margin'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderColor")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("borderColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0700
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.borderColor as null
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderColor_string": progress_capsule_borderColor_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(strJson))
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(strJsonDefault));

      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);

      let strColor = JSON.stringify(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor'));
      let strOpicity = JSON.stringify(objDefault.getElement('$attrs').getElement('margin'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0800
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.borderColor as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderColor_string": progress_capsule_borderColor_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(strJson))
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(strJsonDefault));

      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);

      let strColor = JSON.stringify(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor'));
      let strOpicity = JSON.stringify(objDefault.getElement('$attrs').getElement('margin'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_static_0100
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Size_static_0100
     * @tc.desc Get the default value of capsuleStyle.font.size
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      let newJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size"));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_static_0200
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Size_static_0200
     * @tc.desc Set the value of capsuleStyle.font.size as 16
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = 16;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")).assertEqual("16.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_static_0300
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Size_static_0300
     * @tc.desc Set the value of capsuleStyle.font.size as '16vp'
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '16vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")).assertEqual("16.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_static_0400
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Size_static_0400
     * @tc.desc Set the value of capsuleStyle.font.size as ohos_id_text_margin_vertical
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_resource = $r('sys.float.ohos_id_text_margin_vertical');
      let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      progressSec.message.notify({
        name: 'progress_capsule_fontSize_resource', value: progress_capsule_fontSize_resource
      })
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")).assertEqual(objJudge.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size"));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_static_0500
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Size_static_0500
     * @tc.desc Set the value of capsuleStyle.font.size as '18px'
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0500]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")).assertEqual("18.00px");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_static_0600
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Size_static_0600
     * @tc.desc Set the value of capsuleStyle.font.size as '18vp'
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0600]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")).assertEqual("18.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_static_0700
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Size_static_0700
     * @tc.desc Set the value of capsuleStyle.font.size as '18fp'
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0700]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")).assertEqual("18.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_static_0800
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Size_static_0800
     * @tc.desc Set the value of capsuleStyle.font.size as '18lpx'
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0800]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")).assertEqual("18.00lpx");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_static_0900
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Size_static_0900
     * @tc.desc Set the value of capsuleStyle.font.size as 0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0900] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0900]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0900] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0900]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0900]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")).assertEqual("0.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_0900] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_static_1000
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Size_static_1000
     * @tc.desc Set the value of capsuleStyle.font.size as -10
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1000] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1000]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = -10;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1000] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1000]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1000]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size"));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1000] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_static_1100
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Size_static_1100
     * @tc.desc Set the value of capsuleStyle.font.size as 10000
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1100]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = 10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1100] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("size")).assertEqual("10000.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_static_1200
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.font.size as null
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1200]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getElement('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getElement('size')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement('font').getElement('size'));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_static_1300
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.font.size as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1300]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getElement('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getElement('size')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement('font').getElement('size'));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_static_1300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_0100
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Weight_static_0100
     * @tc.desc Get the default value of capsuleStyle.font.weight
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200
     * @tc.desc Set the value of capsuleStyle.font.weight as 700
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = 700;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")).assertEqual("700");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300
     * @tc.desc Set the value of capsuleStyle.font.weight as '700'
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_string = '700';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_string": progress_capsule_fontWeight_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")).assertEqual("700");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400
     * @tc.desc Set the value of capsuleStyle.font.weight as FontWeight.Lighter
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Lighter;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")).assertEqual("FontWeight.Lighter");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500
     * @tc.desc Set the value of capsuleStyle.font.weight as FontWeight.Normal
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Normal;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600
     * @tc.desc Set the value of capsuleStyle.font.weight as FontWeight.Regular
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Regular;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")).assertEqual("FontWeight.Regular");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700
     * @tc.desc Set the value of capsuleStyle.font.weight as FontWeight.Medium
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Medium;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")).assertEqual("FontWeight.Medium");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800
     * @tc.desc Set the value of capsuleStyle.font.weight as FontWeight.Bold
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Bold;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")).assertEqual("FontWeight.Bold");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900
     * @tc.desc Set the value of capsuleStyle.font.weight as FontWeight.Bolder
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Bolder;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")).assertEqual("FontWeight.Bolder");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000
     * @tc.desc Set the value of capsuleStyle.font.weight as 0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100
     * @tc.desc Set the value of capsuleStyle.font.weight as -10
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = -10;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200
     * @tc.desc Set the value of capsuleStyle.font.weight as 10000
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = 10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("weight")).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.font.weight as null
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getElement('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getElement('weight')).assertEqual(progressFontWeight($r('sys.float.font_weight')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.font.weight as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getElement('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getElement('weight')).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Style_static_0100
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Style_static_0100
     * @tc.desc Get the default value of capsuleStyle.getElement("font").getElement("style")
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("style")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("style")).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Style_static_0200
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Style_static_0200
     * @tc.desc Set the value of capsuleStyle.getElement("font").getElement("style") as FontStyle.Italic
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = FontStyle.Italic;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontStyle_fontStyle": progress_capsule_fontStyle_fontStyle
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("style")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("style")).assertEqual("FontStyle.Italic");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Style_static_0300
     * @tc.name ArkUI_Stage_Progress_Capsule_Font_Style_static_0300
     * @tc.desc Set the value of capsuleStyle.getElement("font").getElement("style") as FontStyle.Normal
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = FontStyle.Normal;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontStyle_fontStyle": progress_capsule_fontStyle_fontStyle
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font")));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("style")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("style")).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Style_static_0400
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.getElement("font").getElement("style") as null
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontStyle_fontStyle": progress_capsule_fontStyle_fontStyle
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("style")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("style")).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Style_static_0500
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.getElement("font").getElement("style") as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0500]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontStyle_fontStyle": progress_capsule_fontStyle_fontStyle
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("style")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("font").getElement("style")).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_static_0100
     * @tc.name ArkUI_Stage_Progress_Capsule_FontColor_static_0100
     * @tc.desc Get the default value of capsuleStyle.fontColor
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      let newJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor")).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor"));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_static_0200
     * @tc.name ArkUI_Stage_Progress_Capsule_FontColor_static_0200
     * @tc.desc Set the value of capsuleStyle.fontColor as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_number = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontColor_number": progress_capsule_fontColor_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor")).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_static_0300
     * @tc.name ArkUI_Stage_Progress_Capsule_FontColor_static_0300
     * @tc.desc Set the value of capsuleStyle.fontColor as '#FFFF9535'
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = '#FFFF9535';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontColor_string": progress_capsule_fontColor_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor")).assertEqual("#FFFF9535");
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_static_0400
     * @tc.name ArkUI_Stage_Progress_Capsule_FontColor_static_0400
     * @tc.desc Set the value of capsuleStyle.fontColor as Color.Red
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_color = Color.Red;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontColor_color": progress_capsule_fontColor_color
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor")).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_static_0500
     * @tc.name ArkUI_Stage_Progress_Capsule_FontColor_static_0500
     * @tc.desc Set the value of capsuleStyle.fontColor as ohos_id_color_connected
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0500]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_resource = $r('sys.color.ohos_id_color_connected');

      let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      progressSec.message.notify({
        name: 'progress_capsule_fontColor_resource', value: progress_capsule_fontColor_resource
      })
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor")).assertEqual(objJudge.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor"));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_static_0600
     * @tc.name ArkUI_Stage_Progress_Capsule_FontColor_static_0600
     * @tc.desc Set the value of capsuleStyle.fontColor as 'abcdefghijk'
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0600]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontColor_string": progress_capsule_fontColor_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_static_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor")).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement("fontColor"));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_static_0700
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.fontColor as null
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0700]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontColor_string": progress_capsule_fontColor_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_static_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('fontColor')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement('fontColor'));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_static_0800
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.fontColor as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0800]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontColor_string": progress_capsule_fontColor_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_static_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('fontColor')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement('fontColor'));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_static_0800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_static_0100
     * @tc.name ArkUI_Stage_Progress_Capsule_Content_static_0100
     * @tc.desc Get the default value of capsuleStyle.content
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_showDefaultPercentage_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("content")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("content")).assertEqual("60%");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_static_0200
     * @tc.name ArkUI_Stage_Progress_Capsule_Content_static_0200
     * @tc.desc Set the value of capsuleStyle.fontColor as '下载'
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0200]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '下载';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("content")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("content")).assertEqual("下载");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_static_0300
     * @tc.name ArkUI_Stage_Progress_Capsule_Content_static_0300
     * @tc.desc Set the value of capsuleStyle.fontColor as '继续'
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0300]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '继续';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("content")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("content")).assertEqual("继续");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_static_0400
     * @tc.name ArkUI_Stage_Progress_Capsule_Content_static_0400
     * @tc.desc Set the value of capsuleStyle.fontColor as '安装中'
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0400]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '安装中';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("content")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("content")).assertEqual("安装中");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_static_0500
     * @tc.name ArkUI_Stage_Progress_Capsule_Content_static_0500
     * @tc.desc Set the value of capsuleStyle.fontColor as '打开'
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0500]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '打开';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("content")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("content")).assertEqual("打开");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_static_0600
     * @tc.name ArkUI_Stage_Progress_Capsule_Content_static_0600
     * @tc.desc Set the value of capsuleStyle.fontColor as ''
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0600]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_static_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("content")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("content")).assertEqual("");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_static_0700
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.fontColor as null
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0700]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = -10000;
      let progress_capsule_showDefaultPercentage_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string,
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_static_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('content')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('content')).assertEqual("60%");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_static_0800
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.fontColor as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0800]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = -10000;
      let progress_capsule_showDefaultPercentage_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string,
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_static_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('content')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('content')).assertEqual("60%");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_static_0800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0100
     * @tc.name ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0100
     * @tc.desc Get the default value of capsuleStyle.enableScanEffect
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("enableScanEffect")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("enableScanEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200
     * @tc.name ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200
     * @tc.desc Set the value of capsuleStyle.enableScanEffect as true
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableScanEffect_boolean": progress_capsule_enableScanEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("enableScanEffect")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("enableScanEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300
     * @tc.name ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300
     * @tc.desc Set the value of capsuleStyle.enableScanEffect as false
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableScanEffect_boolean": progress_capsule_enableScanEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("enableScanEffect")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("enableScanEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.enableScanEffect as null
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableScanEffect_boolean": progress_capsule_enableScanEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.enableScanEffect as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableScanEffect_boolean": progress_capsule_enableScanEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0100
     * @tc.name ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0100
     * @tc.desc Get the default value of capsuleStyle.showDefaultPercentage
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("showDefaultPercentage")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("showDefaultPercentage")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200
     * @tc.name ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200
     * @tc.desc Set the value of capsuleStyle.showDefaultPercentage as true
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("showDefaultPercentage")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("showDefaultPercentage")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300
     * @tc.name ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300
     * @tc.desc Set the value of capsuleStyle.showDefaultPercentage as false
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement("showDefaultPercentage")));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement("showDefaultPercentage")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.showDefaultPercentage as null
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('showDefaultPercentage')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('showDefaultPercentage')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of capsuleStyle.showDefaultPercentage as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('capsuleStyle').getElement('showDefaultPercentage')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('showDefaultPercentage')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500] end");
      done();
    });


    /**
     * @tc.number ArkUI_Stage_Progress_Ring_BackgroundColor_static_0100
     * @tc.name ArkUI_Stage_Progress_Ring_BackgroundColor_static_0100
     * @tc.desc Get the default value of backgroundColor
     */
    it('ArkUI_Stage_Progress_Ring_BackgroundColor_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      let newJsonDefault = inspector.getInspectorByKey('progress_ring_default_default');
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);

      let strColor = JSON.stringify(objDefault.getElement('$attrs').getElement('backgroundColor'));
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_static_0100]: " + strColor);

      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('backgroundColor')));
      expect(obj.getElement('$attrs').getElement('backgroundColor')).assertEqual(objDefault.getElement('$attrs').getElement('backgroundColor'));
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_static_0100
     * @tc.name ArkUI_Stage_Progress_Ring_StrokeWidth_static_0100
     * @tc.desc Get the default value of ringStyle.strokeWidth
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200
     * @tc.name ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200
     * @tc.desc Set the value of ringStyle.strokeWidth as 10
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = 10;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300
     * @tc.name ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300
     * @tc.desc Set the value of ringStyle.strokeWidth as 10vp
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '10vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_static_0400
     * @tc.name ArkUI_Stage_Progress_Ring_StrokeWidth_static_0400
     * @tc.desc Set the value of ringStyle.strokeWidth as ohos_id_text_margin_vertical
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_ring_resource');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0400]: " + JSON.stringify(newJson));


      let progress_ring_strokeWidth_resource = $r('sys.float.ohos_id_text_margin_vertical');

      let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      progressSec.message.notify({
        name: 'progress_ring_strokeWidth_resource', value: progress_ring_strokeWidth_resource
      })
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')).assertEqual(objJudge.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth'));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500
     * @tc.name ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500
     * @tc.desc Set the value of ringStyle.strokeWidth as 20px
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')).assertEqual("20.00px");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600
     * @tc.name ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600
     * @tc.desc Set the value of ringStyle.strokeWidth as 20vp
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600] start");
      let newJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')).assertEqual("20.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700
     * @tc.name ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700
     * @tc.desc Set the value of ringStyle.strokeWidth as 20fp
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700] start");
      let newJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')).assertEqual("20.00fp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800
     * @tc.name ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800
     * @tc.desc Set the value of ringStyle.strokeWidth as 20lpx
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800] start");
      let newJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')).assertEqual("20.00lpx");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900
     * @tc.name ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900
     * @tc.desc Set the value of ringStyle.strokeWidth as 0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000
     * @tc.name ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000
     * @tc.desc Set the value of ringStyle.strokeWidth as -10
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = -10;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100
     * @tc.name ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100
     * @tc.desc Set the value of ringStyle.strokeWidth as 10000
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = 10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')).assertEqual("10000.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200
     * @tc.name Tests the ringStyle property of the progress ring component
     * @tc.desc Set the value of ringStyle.strokeWidth as null
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300
     * @tc.name Tests the ringStyle property of the progress ring component
     * @tc.desc Set the value of ringStyle.strokeWidth as undefined
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('strokeWidth')).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Shadow_static_0100
     * @tc.name ArkUI_Stage_Progress_Ring_Shadow_static_0100
     * @tc.desc Get the default value of ringStyle.shadow
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('shadow')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('shadow')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Shadow_static_0200
     * @tc.name ArkUI_Stage_Progress_Ring_Shadow_static_0200
     * @tc.desc Set the value of ringStyle.shadow as true
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0200]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_shadow_bool": progress_ring_shadow_bool
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('shadow')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('shadow')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Shadow_static_0300
     * @tc.name ArkUI_Stage_Progress_Ring_Shadow_static_0300
     * @tc.desc Set the value of ringStyle.shadow as false
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0300]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_shadow_bool": progress_ring_shadow_bool
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('shadow')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('shadow')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Shadow_static_0400
     * @tc.name Tests the ringStyle property of the progress ring component
     * @tc.desc Set the value of ringStyle.shadow as null
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0400]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_shadow_bool": progress_ring_shadow_bool
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('shadow')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('shadow')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Shadow_static_0500
     * @tc.name Tests the ringStyle property of the progress ring component
     * @tc.desc Set the value of ringStyle.shadow as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0500]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_shadow_bool": progress_ring_shadow_bool
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('shadow')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('shadow')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Status_static_0100
     * @tc.name ArkUI_Stage_Progress_Ring_Status_static_0100
     * @tc.desc Get the default value of ringStyle.status
     */
    it('ArkUI_Stage_Progress_Ring_Status_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('status')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('status')).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Status_static_0200
     * @tc.name ArkUI_Stage_Progress_Ring_Status_static_0200
     * @tc.desc Set the value of ringStyle.status as ProgressStatus.LOADING
     */
    it('ArkUI_Stage_Progress_Ring_Status_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0200]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = ProgressStatus.LOADING;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_status_progressStatus": progress_ring_status_progressStatus
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Status_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('status')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('status')).assertEqual("ProgressStatus.LOADING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Status_static_0300
     * @tc.name ArkUI_Stage_Progress_Ring_Status_static_0300
     * @tc.desc Set the value of ringStyle.status as ProgressStatus.PROGRESSING
     */
    it('ArkUI_Stage_Progress_Ring_Status_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0300]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = ProgressStatus.PROGRESSING;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_status_progressStatus": progress_ring_status_progressStatus
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Status_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('status')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('status')).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Status_static_0400
     * @tc.name Tests the ringStyle property of the progress ring component
     * @tc.desc Set the value of ringStyle.status as null
     */
    it('ArkUI_Stage_Progress_Ring_Status_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0400]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_status_progressStatus": progress_ring_status_progressStatus
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Status_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('status')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('status')).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Status_static_0500
     * @tc.name Tests the ringStyle property of the progress ring component
     * @tc.desc Set the value of ringStyle.status as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Status_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0500]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_status_progressStatus": progress_ring_status_progressStatus
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Status_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement('status')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement('status')).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_0100
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_0100
     * @tc.desc Get the default value of color
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      let newJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefaultColorBegin = JSON.parseJsonElement(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_0200
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_0200
     * @tc.desc Set the value of color as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('color')));
      expect(obj.getElement('$attrs').getElement('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_0300
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_0300
     * @tc.desc Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0300]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_number: LinearGradient = new LinearGradient([{
      //   color: 0xFFFF0000, offset: 0
      // }, {
      //   color: 0xFFFFFFFF, offset: 1
      // }]);
      // // globalThis.value.message.notify({
      // //   name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      // // });
      // AppStorage.get<object>("progress_ring_color_linear_number")
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      // })
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_0400
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_0400
     * @tc.desc Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_ring_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0400]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_string: LinearGradient = new LinearGradient([{
      //   color: '#FFFF9A35', offset: 0
      // }, {
      //   color: '#FFFFFFFF', offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      // });
      let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      // })
      await CommonFunc.sleep(2000);


      let strJson = inspector.getInspectorByKey('progress_ring_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_0500
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_0500
     * @tc.desc Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_ring_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0500]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_color = new LinearGradient([{
      //   color: Color.Red, offset: 0
      // }, {
      //   color: Color.White, offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      // });
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      // })
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_0600
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_0600
     * @tc.desc Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0600] start");
      let newJson = inspector.getInspectorByKey('progress_ring_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0600]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_resource = new LinearGradient([{
      //   color: $r('sys.color.ohos_id_color_connected'), offset: 0
      // }, {
      //   color: $r('sys.color.ohos_id_color_background'), offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      // });
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      // })
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_linear_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0600]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.getElement('$attrs').getElement("backgroundColor") + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_0700
     * @tc.name Tests the color property of the progress ring component
     * @tc.desc Set the value of color as null
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0700] start");
      let newJson = inspector.getInspectorByKey('progress_ring_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = -10000
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_linear_null');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0700]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_0800
     * @tc.name Tests the color property of the progress ring component
     * @tc.desc Set the value of color as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0800] start");
      let newJson = inspector.getInspectorByKey('progress_ring_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = -10000
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_linear_undefined');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0800]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_0800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_1100
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_1100
     * @tc.desc Get the default value of color
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1100] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_default');
      let newJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefaultColorBegin = JSON.parseJsonElement(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_1200
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_1200
     * @tc.desc Set the value of color as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1200] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('color')));
      expect(obj.getElement('$attrs').getElement('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_1300
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_1300
     * @tc.desc Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1300] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1300]: " + JSON.stringify(newJson));


      // let progress_ring_color_linear_number = new LinearGradient([{
      //   color: 0xFFFF0000, offset: 0
      // }, {
      //   color: 0xFFFFFFFF, offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      // })
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      // })
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_1400
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_1400
     * @tc.desc Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1400] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1400]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_string = new LinearGradient([{
      //   color: '#FFFF9A35', offset: 0
      // }, {
      //   color: '#FFFFFFFF', offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      // })
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      // })
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_1500
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_1500
     * @tc.desc Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1500] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1500]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_color = new LinearGradient([{
      //   color: Color.Red, offset: 0
      // }, {
      //   color: Color.White, offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      // })
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      // })
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_1600
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_1600
     * @tc.desc Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1600] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1600]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_resource = new LinearGradient([{
      //   color: $r('sys.color.ohos_id_color_connected'), offset: 0
      // }, {
      //   color: $r('sys.color.ohos_id_color_background'), offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      // })
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      // })
      await CommonFunc.sleep(2000);


      let strJson = inspector.getInspectorByKey('progress_linear_color_linear_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1600]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.getElement('$attrs').getElement("backgroundColor") + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_1700
     * @tc.name Tests the color property of the progress ring component
     * @tc.desc Set the value of color as null
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1700] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = -10000
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_1700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_linear_null');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1700]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_1800
     * @tc.name Tests the color property of the progress ring component
     * @tc.desc Set the value of color as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1800] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = -10000
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_1800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_linear_undefined');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1800]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_1800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_2100
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_2100
     * @tc.desc Get the default value of color
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2100] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_default');
      let newJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefaultColorBegin = JSON.parseJsonElement(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_2200
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_2200
     * @tc.desc Set the value of color as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2200] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_2200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('color')));
      expect(obj.getElement('$attrs').getElement('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_2300
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_2300
     * @tc.desc Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2300] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2300]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_number = new LinearGradient([{
      //   color: 0xFFFF0000, offset: 0
      // }, {
      //   color: 0xFFFFFFFF, offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      // });
      let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      // });

      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_2400
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_2400
     * @tc.desc Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2400] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2400]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_string = new LinearGradient([{
      //   color: '#FFFF9A35', offset: 0
      // }, {
      //   color: '#FFFFFFFF', offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      // });
      let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      // });

      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_2500
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_2500
     * @tc.desc Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2500] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2500]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_color = new LinearGradient([{
      //   color: Color.Red, offset: 0
      // }, {
      //   color: Color.White, offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      // });
      let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      // })

      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_2600
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_2600
     * @tc.desc Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2600] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2600]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_resource = new LinearGradient([{
      //   color: $r('sys.color.ohos_id_color_connected'), offset: 0
      // }, {
      //   color: $r('sys.color.ohos_id_color_background'), offset: 1
      // }]);

      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      // });
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      // });
      await CommonFunc.sleep(2000);


      let strJson = inspector.getInspectorByKey('progress_eclipse_color_linear_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2600]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.getElement('$attrs').getElement("backgroundColor") + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_2700
     * @tc.name Tests the color property of the progress ring component
     * @tc.desc Set the value of color as null
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2700] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = -10000
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_2700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_linear_null');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2700]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_2800
     * @tc.name Tests the color property of the progress ring component
     * @tc.desc Set the value of color as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2800] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = -10000
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_2800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_linear_undefined');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2800]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_2800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_3100
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_3100
     * @tc.desc Get the default value of color
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3100] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_default');
      let newJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefaultColorBegin = JSON.parseJsonElement(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_3200
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_3200
     * @tc.desc Set the value of color as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3200] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_3200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_3200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('color')));
      expect(obj.getElement('$attrs').getElement('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_3300
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_3300
     * @tc.desc Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3300] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3300]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_number = new LinearGradient([{
      //   color: 0xFFFF0000, offset: 0
      // }, {
      //   color: 0xFFFFFFFF, offset: 1
      // }]);

      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      // });
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      // });
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_3400
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_3400
     * @tc.desc Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3400] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3400]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_string = new LinearGradient([{
      //   color: '#FFFF9A35', offset: 0
      // }, {
      //   color: '#FFFFFFFF', offset: 1
      // }]);

      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      // });
      let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      // });
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_3500
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_3500
     * @tc.desc Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3500] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3500]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_color = new LinearGradient([{
      //   color: Color.Red, offset: 0
      // }, {
      //   color: Color.White, offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      // });
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      // });
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_3600
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_3600
     * @tc.desc Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3600] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3600]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_resource = new LinearGradient([{
      //   color: $r('sys.color.ohos_id_color_connected'), offset: 0
      // }, {
      //   color: $r('sys.color.ohos_id_color_background'), offset: 1
      // }]);

      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      // });
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      // });

      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3600]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.getElement('$attrs').getElement("backgroundColor") + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_3700
     * @tc.name Tests the color property of the progress ring component
     * @tc.desc Set the value of color as null
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3700] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = -10000
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_3700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_3700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_null');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3700]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_3800
     * @tc.name Tests the color property of the progress ring component
     * @tc.desc Set the value of color as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3800] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = -10000
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_3800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_3800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_undefined');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3800]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_3800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_4100
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_4100
     * @tc.desc Get the default value of color
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_default');
      let newJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefaultColorBegin = JSON.parseJsonElement(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_4200
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_4200
     * @tc.desc Set the value of color as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_4200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_4200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('color')));
      expect(obj.getElement('$attrs').getElement('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_4300
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_4300
     * @tc.desc Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4300]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_number = new LinearGradient([{
      //   color: 0xFFFF0000, offset: 0
      // }, {
      //   color: 0xFFFFFFFF, offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      // });
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      // });
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_4400
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_4400
     * @tc.desc Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4400]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_string = new LinearGradient([{
      //   color: '#FFFF9A35', offset: 0
      // }, {
      //   color: '#FFFFFFFF', offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      // });
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      // });
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_4500
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_4500
     * @tc.desc Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4500]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_color = new LinearGradient([{
      //   color: Color.Red, offset: 0
      // }, {
      //   color: Color.White, offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      // });
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      // });
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor"))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_4600
     * @tc.name ArkUI_Stage_Progress_Ring_Color_static_4600
     * @tc.desc Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4600]: " + JSON.stringify(newJson));

      // let progress_ring_color_linear_resource = new LinearGradient([{
      //   color: $r('sys.color.ohos_id_color_connected'), offset: 0
      // }, {
      //   color: $r('sys.color.ohos_id_color_background'), offset: 1
      // }]);
      // globalThis.value.message.notify({
      //   name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      // });
      // let progressSec = AppStorage.get<ProgressSec>("progressSecTest", Type.from<ProgressSec>()) as ProgressSec
      // progressSec.message.notify({
      //   name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      // });
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_linear_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4600]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.getElement('$attrs').getElement("backgroundColor") + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_4700
     * @tc.name Tests the color property of the progress ring component
     * @tc.desc Set the value of color as null
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = -10000
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_4700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_4700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_linear_null');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4700]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_Color_static_4800
     * @tc.name Tests the color property of the progress ring component
     * @tc.desc Set the value of color as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = -10000
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_static_4800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_static_4800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_linear_undefined');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4800]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getElement('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getElement('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("progressGradientColor")));
      expect(obj.getElement('$attrs').getElement("progressGradientColor")).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_static_4800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0100
     * @tc.name ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0100
     * @tc.desc Get the default value of ringStyle.enableScanEffect
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement("enableScanEffect")));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement("enableScanEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200
     * @tc.name ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200
     * @tc.desc Set the value of ringStyle.enableScanEffect as true
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableScanEffect_boolean": progress_ring_enableScanEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement("enableScanEffect")));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement("enableScanEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300
     * @tc.name ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300
     * @tc.desc Set the value of ringStyle.enableScanEffect as false
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableScanEffect_boolean": progress_ring_enableScanEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement("enableScanEffect")));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement("enableScanEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400
     * @tc.name Tests the ringStyle property of the progress ring component
     * @tc.desc Set the value of ringStyle.enableScanEffect as null
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableScanEffect_boolean": progress_ring_enableScanEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement("enableScanEffect")));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement("enableScanEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500
     * @tc.name Tests the ringStyle property of the progress ring component
     * @tc.desc Set the value of ringStyle.enableScanEffect as undefined
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableScanEffect_boolean": progress_ring_enableScanEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('ringStyle').getElement("enableScanEffect")));
      expect(obj.getElement('$attrs').getElement('ringStyle').getElement("enableScanEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0100
     * @tc.name ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0100
     * @tc.desc Get the default value of linearStyle.enableScanEffect
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_default');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("linearStyle")));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("linearStyle").getElement("enableScanEffect")));
      expect(obj.getElement('$attrs').getElement("linearStyle").getElement("enableScanEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200
     * @tc.name ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200
     * @tc.desc Set the value of linearStyle.enableScanEffect as true
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableScanEffect_boolean": progress_linear_enableScanEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("linearStyle")));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("linearStyle").getElement("enableScanEffect")));
      expect(obj.getElement('$attrs').getElement("linearStyle").getElement("enableScanEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300
     * @tc.name ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300
     * @tc.desc Set the value of linearStyle.enableScanEffect as false
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableScanEffect_boolean": progress_linear_enableScanEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("linearStyle")));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("linearStyle").getElement("enableScanEffect")));
      expect(obj.getElement('$attrs').getElement("linearStyle").getElement("enableScanEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400
     * @tc.name Tests the linearStyle property of the progress linear component
     * @tc.desc Set the value of linearStyle.enableScanEffect as null
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableScanEffect_boolean": progress_linear_enableScanEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("linearStyle")));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("linearStyle").getElement("enableScanEffect")));
      expect(obj.getElement('$attrs').getElement("linearStyle").getElement("enableScanEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500
     * @tc.name Tests the linearStyle property of the progress linear component
     * @tc.desc Set the value of linearStyle.enableScanEffect as undefined
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableScanEffect_boolean": progress_linear_enableScanEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("linearStyle")));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement("linearStyle").getElement("enableScanEffect")));
      expect(obj.getElement('$attrs').getElement("linearStyle").getElement("enableScanEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0100
     * @tc.name ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0100
     * @tc.desc Get the default value of enableSmoothEffect
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200
     * @tc.name ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200
     * @tc.desc Set the value of enableSmoothEffect as true
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableSmoothEffect_boolean": progress_ring_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300
     * @tc.name ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300
     * @tc.desc Set the value of enableSmoothEffect as false
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableSmoothEffect_boolean": progress_ring_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0400
     * @tc.name Tests the ringStyle property of the progress ring component
     * @tc.desc Set the value of enableSmoothEffect as null
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0400]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableSmoothEffect_boolean": progress_ring_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0500
     * @tc.name Tests the ringStyle property of the progress ring component
     * @tc.desc Set the value of enableSmoothEffect as undefined
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0500]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableSmoothEffect_boolean": progress_ring_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0100
     * @tc.name ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0100
     * @tc.desc Get the default value of enableSmoothEffect
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200
     * @tc.name ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200
     * @tc.desc Set the value of enableSmoothEffect as true
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableSmoothEffect_boolean": progress_linear_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300
     * @tc.name ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300
     * @tc.desc Set the value of enableSmoothEffect as false
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableSmoothEffect_boolean": progress_linear_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0400
     * @tc.name Tests the linearStyle property of the progress linear component
     * @tc.desc Set the value of enableSmoothEffect as null
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0400]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableSmoothEffect_boolean": progress_linear_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0500
     * @tc.name Tests the linearStyle property of the progress linear component
     * @tc.desc Set the value of enableSmoothEffect as undefined
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0500]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableSmoothEffect_boolean": progress_linear_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0100
     * @tc.name ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0100
     * @tc.desc Get the default value of enableSmoothEffect
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200
     * @tc.name ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200
     * @tc.desc Set the value of enableSmoothEffect as true
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableSmoothEffect_boolean": progress_capsule_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300
     * @tc.name ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300
     * @tc.desc Set the value of enableSmoothEffect as false
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableSmoothEffect_boolean": progress_capsule_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0400
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of enableSmoothEffect as null
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0400]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableSmoothEffect_boolean": progress_capsule_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0500
     * @tc.name Tests the capsuleStyle property of the progress capsule component
     * @tc.desc Set the value of enableSmoothEffect as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0500]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableSmoothEffect_boolean": progress_capsule_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0100
     * @tc.name ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0100
     * @tc.desc Get the default value of enableSmoothEffect
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200
     * @tc.name ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200
     * @tc.desc Set the value of enableSmoothEffect as true
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_scaleRing_enableSmoothEffect_boolean": progress_scaleRing_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300
     * @tc.name ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300
     * @tc.desc Set the value of enableSmoothEffect as false
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_scaleRing_enableSmoothEffect_boolean": progress_scaleRing_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0400
     * @tc.name Tests the scaleRingStyle property of the progress scaleRing component
     * @tc.desc Set the value of enableSmoothEffect as null
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0400]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_scaleRing_enableSmoothEffect_boolean": progress_scaleRing_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0500
     * @tc.name Tests the scaleRingStyle property of the progress scaleRing component
     * @tc.desc Set the value of enableSmoothEffect as undefined
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0500]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_scaleRing_enableSmoothEffect_boolean": progress_scaleRing_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0100
     * @tc.name ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0100
     * @tc.desc Get the default value of enableSmoothEffect
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0100] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_default');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200
     * @tc.name ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200
     * @tc.desc Set the value of enableSmoothEffect as true
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_eclipse_enableSmoothEffect_boolean": progress_eclipse_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300
     * @tc.name ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300
     * @tc.desc Set the value of enableSmoothEffect as false
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_eclipse_enableSmoothEffect_boolean": progress_eclipse_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0400
     * @tc.name Tests the eclipseStyle property of the progress eclipse component
     * @tc.desc Set the value of enableSmoothEffect as null
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0400] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0400]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_eclipse_enableSmoothEffect_boolean": progress_eclipse_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0500
     * @tc.name Tests the eclipseStyle property of the progress eclipse component
     * @tc.desc Set the value of enableSmoothEffect as undefined
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0500] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0500]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = -10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_eclipse_enableSmoothEffect_boolean": progress_eclipse_enableSmoothEffect_boolean
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement("$attrs").getElement("enableSmoothEffect")));
      expect(obj.getElement("$attrs").getElement("enableSmoothEffect")).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0500] end");
      done();
    });
  })
}
