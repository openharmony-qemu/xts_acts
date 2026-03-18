/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { AnimationOptions } from '@ohos.arkui.drawableDescriptor';

const SLEEP_TIME = 1000;

export default function AnimationOptionsTest() {
  describe('AnimationOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] AnimationOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.draw.api23.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] AnimationOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/animationOptions/animationOptions',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] AnimationOptionsTest state pages: " + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] AnimationOptionsTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] AnimationOptionsTest afterEach start");
      // Clean up AppStorage data
      if (AppStorage.get<AnimationOptions>('animationOptionsFrameDurations') != undefined) {
        AppStorage.delete('animationOptionsFrameDurations');
      }
      if (AppStorage.get<AnimationOptions>('animationOptionsAutoPlay') != undefined) {
        AppStorage.delete('animationOptionsAutoPlay');
      }
      if (AppStorage.get<boolean>('animationControllerStart') != undefined) {
        AppStorage.delete('animationControllerStart');
      }
      if (AppStorage.get<number>('animationControllerStatus') != undefined) {
        AppStorage.delete('animationControllerStatus');
      }
      if (AppStorage.get<boolean>('animationControllerPause') != undefined) {
        AppStorage.delete('animationControllerPause');
      }
      if (AppStorage.get<boolean>('animationControllerResume') != undefined) {
        AppStorage.delete('animationControllerResume');
      }
      if (AppStorage.get<boolean>('animationControllerStop') != undefined) {
        AppStorage.delete('animationControllerStop');
      }
      if (AppStorage.get<boolean>('animatedDrawableDescriptorGetController') != undefined) {
        AppStorage.delete('animatedDrawableDescriptorGetController');
      }
      if (AppStorage.get<boolean>('animatedDrawableDescriptorGetControllerWithId') != undefined) {
        AppStorage.delete('animatedDrawableDescriptorGetControllerWithId');
      }
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] AnimationOptionsTest afterEach end");
    });

    /**
     * @tc.number AnimationOptionsTest_001
     * @tc.name animationOptionsFrameDurations
     * @tc.desc Test AnimationOptions property: frameDurations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('animationOptionsFrameDurations', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('AnimationOptionsTest execute: animationOptionsFrameDurations START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnFrameDurations'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let animationOptions = AppStorage.get<AnimationOptions>('animationOptionsFrameDurations');
        expect(animationOptions !== undefined).assertTrue();
        if (animationOptions !== undefined) {
          expect(animationOptions.frameDurations !== undefined).assertTrue();
          if (animationOptions?.frameDurations !== undefined) {
            expect(animationOptions?.frameDurations?.length).assertEqual(3);
          }
        }

        console.info('AnimationOptionsTest execute: animationOptionsFrameDurations END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] AnimationOptionsTest execute: animationOptionsFrameDurations error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number AnimationOptionsTest_002
     * @tc.name animationOptionsAutoPlay
     * @tc.desc Test AnimationOptions property: autoPlay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('animationOptionsAutoPlay', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('AnimationOptionsTest execute: animationOptionsAutoPlay START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnAutoPlay'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let animationOptions = AppStorage.get<AnimationOptions>('animationOptionsAutoPlay');
        expect(animationOptions !== undefined).assertTrue();
        if (animationOptions) {
          expect(animationOptions.autoPlay).assertEqual(true);
        }

        console.info('AnimationOptionsTest execute: animationOptionsAutoPlay END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] AnimationOptionsTest execute: animationOptionsAutoPlay error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number AnimationOptionsTest_003
     * @tc.name animationControllerStartStopPauseResumeGetStatus
     * @tc.desc Test AnimationController methods: start, stop, pause, resume, getStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('animationControllerStartStopPauseResumeGetStatus', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] AnimationOptionsTest execute: animationControllerStartStopPauseResumeGetStatus START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnAnimationController'));
        console.info('[ARKUI_NEW] AnimationOptionsTest animationControllerStartStopPauseResumeGetStatus btnAnimationController exist');
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let startResult = AppStorage.get<boolean>('animationControllerStart');
        let statusResult = AppStorage.get<number>('animationControllerStatus');
        let pauseResult = AppStorage.get<boolean>('animationControllerPause');
        let resumeResult = AppStorage.get<boolean>('animationControllerResume');
        let stopResult = AppStorage.get<boolean>('animationControllerStop');
        
        // 添加详细的日志输出
        console.info('[ARKUI_NEW] AnimationOptionsTest animationControllerStartStopPauseResumeGetStatus - startResult: ' + startResult);
        console.info('[ARKUI_NEW] AnimationOptionsTest animationControllerStartStopPauseResumeGetStatus - statusResult: ' + statusResult);
        console.info('[ARKUI_NEW] AnimationOptionsTest animationControllerStartStopPauseResumeGetStatus - pauseResult: ' + pauseResult);
        console.info('[ARKUI_NEW] AnimationOptionsTest animationControllerStartStopPauseResumeGetStatus - resumeResult: ' + resumeResult);
        console.info('[ARKUI_NEW] AnimationOptionsTest animationControllerStartStopPauseResumeGetStatus - stopResult: ' + stopResult);
        
        // Check value exists; if not, operation failed
        expect(startResult !== undefined).assertTrue();
        if (startResult !== undefined) {
          expect(startResult).assertEqual(true);
        } else {
          console.error('[ARKUI_NEW] AnimationOptionsTest animationControllerStartStopPauseResumeGetStatus - startResult is undefined');
        }
        expect(statusResult !== undefined).assertTrue();
        if (statusResult !== undefined) {
          console.info('[ARKUI_NEW] AnimationOptionsTest animationControllerStartStopPauseResumeGetStatus - statusResult value: ' + statusResult);
        } else {
          console.error('[ARKUI_NEW] AnimationOptionsTest animationControllerStartStopPauseResumeGetStatus - statusResult is undefined');
        }
        expect(pauseResult !== undefined).assertTrue();
        if (pauseResult !== undefined) {
          expect(pauseResult).assertEqual(true);
        } else {
          console.error('[ARKUI_NEW] AnimationOptionsTest animationControllerStartStopPauseResumeGetStatus - pauseResult is undefined');
        }
        expect(resumeResult !== undefined).assertTrue();
        if (resumeResult !== undefined) {
          expect(resumeResult).assertEqual(true);
        } else {
          console.error('[ARKUI_NEW] AnimationOptionsTest animationControllerStartStopPauseResumeGetStatus - resumeResult is undefined');
        }
        expect(stopResult !== undefined).assertTrue();
        if (stopResult !== undefined) {
          expect(stopResult).assertEqual(true);
        } else {
          console.error('[ARKUI_NEW] AnimationOptionsTest animationControllerStartStopPauseResumeGetStatus - stopResult is undefined');
        }

        console.info('[ARKUI_NEW] AnimationOptionsTest execute: animationControllerStartStopPauseResumeGetStatus END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] AnimationOptionsTest execute: animationControllerStartStopPauseResumeGetStatus error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number AnimationOptionsTest_004
     * @tc.name animatedDrawableDescriptorGetAnimationController
     * @tc.desc Test AnimatedDrawableDescriptor method: getAnimationController
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('animatedDrawableDescriptorGetAnimationController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('AnimationOptionsTest execute: animatedDrawableDescriptorGetAnimationController START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnGetAnimationController'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let getControllerResult = AppStorage.get<boolean>('animatedDrawableDescriptorGetController');
        let getControllerWithIdResult = AppStorage.get<boolean>('animatedDrawableDescriptorGetControllerWithId');
        
        expect(getControllerResult !== undefined).assertTrue();
        if (getControllerResult !== undefined) {
          expect(getControllerResult).assertEqual(true);
        }
        expect(getControllerWithIdResult !== undefined).assertTrue();

        console.info('AnimationOptionsTest execute: animatedDrawableDescriptorGetAnimationController END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] AnimationOptionsTest execute: animatedDrawableDescriptorGetAnimationController error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
