'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import curves from '@ohos.curves';
import { PlayMode } from '@ohos.arkui.component'

interface Ani {
  duration: number
  curve: curves.Curve
  delay: number
  iterations: number
  playMode: PlayMode
}

export default function playModeReverseJsunit() {
  describe('playModeReverseTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("playModeReverseTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Animation/animate_play_mode",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get playModeReverseTest state pages:" + JSON.stringify(pages));
        if (!("animate_play_mode" == pages?.name)) {
          console.info("get playModeReverseTest pages.name:" + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push playModeReverseTest page error:" + err);
      }
      console.info("playModeReverseTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('playModeReverse afterEach err: ' + JSON.stringify(err));
      }
      console.info("playModeReverse after each called");
    });

    
    /**
     * @tc.number   testPlayModeReverse_static_0001
     * @tc.name     testPlayModeReverse_static_0001
     * @tc.desc     testPlayModeReverse_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testPlayModeReverse_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PlayModeReverse testPlayModeReverse0001 START');
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('testPlayModeReverse0001 err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('Reverse');
      console.info("[testradioGroup0001] component width strJson:" + strJson);
      let typeParam = JSON.parseJsonElement(strJson);
      expect(typeParam.getString('$type')).assertEqual('Button');
      let param1: Ani = {
        duration: 3000, // 动画时长
        curve: curves.Curve.EaseOut, // 动画曲线
        delay: 1000, // 动画延迟
        iterations: 1, // 播放次数
        playMode: PlayMode.Reverse // 动画模式
      }
      expect(typeParam.getElement('$attrs').getString('animation')).assertEqual(param1);
      console.info("[testPlayModeReverse0001] width value :" + typeParam.getElement('$attrs').getString('animation'));
      done();
    });

    
    /**
     * @tc.number   testPlayModeAlternate_static_0001
     * @tc.name     testPlayModeAlternate_static_0001
     * @tc.desc     testPlayModeAlternate_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testPlayModeAlternate_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('radioGroup testPlayModeAlternate0001 START');
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('testPlayModeAlternate0001 err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('Alternate');
      console.info("[testPlayModeAlternate0001] component padding strJson:" + strJson);
      let typeParam = JSON.parseJsonElement(strJson);
      expect(typeParam.getString('$type')).assertEqual('Button');
      let param1: Ani = {
        duration: 3000,
        curve: curves.Curve.EaseOut,
        delay: 1000,
        iterations: 1,
        playMode: PlayMode.Alternate
      }
      expect(typeParam.getElement('$attrs').getString('animation')).assertEqual(param1);
      console.info("[testPlayModeAlternate0001] padding value :" +
      typeParam.getElement('$attrs').getString('animation'));
      done();
    });
  })
}