/**
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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

const UI_EVENT_CLICK: number = 10;

export default function SliderEnableHapticFeedbackTest() {
  describe('SliderEnableHapticFeedbackTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SliderAddEnableHapticFeedbackApi beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/slider/SliderEnableHapticFeedbackTest',
      }
      try {
        let pages = router.getState();
        if (pages.name !== 'SliderEnableHapticFeedbackTest') {
          router.clear();
          await router.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push SliderAddEnableHapticFeedbackApi page error:' + err);
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_Slider_enableHapticFeedback_0100
     * @tc.name      SliderAddEnableHapticFeedbackApi_001
     * @tc.desc      testing EnableHpaticFeedback for slider with true value
     * @tc.level     Level 1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SliderAddEnableHapticFeedbackApi_001', Level.LEVEL1, async (done: Function) => {
      console.info('[SliderAddEnableHapticFeedbackApi_001] START');
      await Utils.sleep(1000);
      expect(sendEventByKey('SliderEnableHapticFeedbackTest_true', UI_EVENT_CLICK, '')).assertTrue();
      await Utils.sleep(1000);
      let obj: ESObject = Utils.parseInspectorKey('SliderEnableHapticFeedbackTest_slider');
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[SliderAddEnableHapticFeedbackApi_001] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Slider_enableHapticFeedback_0200
     * @tc.name      SliderAddEnableHapticFeedbackApi_002
     * @tc.desc      testing EnableHpaticFeedback for slider with false value
     * @tc.level     Level 1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SliderAddEnableHapticFeedbackApi_002', Level.LEVEL1, async (done: Function) => {
      console.info('[SliderAddEnableHapticFeedbackApi_002] START');
      await Utils.sleep(1000);
      expect(sendEventByKey('SliderEnableHapticFeedbackTest_false', UI_EVENT_CLICK, '')).assertTrue();
      await Utils.sleep(1000);
      let obj: ESObject = Utils.parseInspectorKey('SliderEnableHapticFeedbackTest_slider');
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[SliderAddEnableHapticFeedbackApi_002] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Slider_enableHapticFeedback_0300
     * @tc.name      SliderAddEnableHapticFeedbackApi_003
     * @tc.desc      testing EnableHpaticFeedback for slider with undefied value
     * @tc.level     Level 1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SliderAddEnableHapticFeedbackApi_003', Level.LEVEL1, async (done: Function) => {
      console.info('[SliderAddEnableHapticFeedbackApi_003] START');
      await Utils.sleep(1000);
      expect(sendEventByKey('SliderEnableHapticFeedbackTest_undefied', UI_EVENT_CLICK, '')).assertTrue();
      await Utils.sleep(1000);
      let obj: ESObject = Utils.parseInspectorKey('SliderEnableHapticFeedbackTest_slider');
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[SliderAddEnableHapticFeedbackApi_003] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Slider_enableHapticFeedback_0400
     * @tc.name      SliderAddEnableHapticFeedbackApi_004
     * @tc.desc      testing EnableHpaticFeedback for slider with null value
     * @tc.level     Level 1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SliderAddEnableHapticFeedbackApi_004', Level.LEVEL1, async (done: Function) => {
      console.info('[SliderAddEnableHapticFeedbackApi_004] START');
      await Utils.sleep(1000);
      expect(sendEventByKey('SliderEnableHapticFeedbackTest_null', UI_EVENT_CLICK, '')).assertTrue();
      await Utils.sleep(1000);
      let obj: ESObject = Utils.parseInspectorKey('SliderEnableHapticFeedbackTest_slider');
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[SliderAddEnableHapticFeedbackApi_004] END');
      done();
    });
  })
}
