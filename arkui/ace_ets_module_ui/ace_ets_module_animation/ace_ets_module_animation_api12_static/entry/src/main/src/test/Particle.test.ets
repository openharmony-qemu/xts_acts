'use static';
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

import CommonFunc from '../../ets/MainAbility/common/Common';
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ParticlePage() {
  describe('ParticlePage', () => {

    beforeEach(async (): Promise<void> => {
      console.info("ParticlePage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Particle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ParticlePage state pages:" + JSON.stringify(pages));
        if (!("ParticlePage" == pages.name)) {
          console.info("get ParticlePage pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ParticlePage page error:" + err);
      }
      console.info("ParticlePage beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ParticlePage err: ' + JSON.stringify(err));
      }
      console.info("ParticlePage after each called");
    });




/**
     * @tc.number   ParticlePage_static_0100
     * @tc.name     ParticlePage_static_0100
     * @tc.desc     ParticlePage_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ParticlePage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ParticlePage_static_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ParticlePage err: ' + JSON.stringify(err));
      }

      let driver = Driver.create();
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ParticlePage err: ' + JSON.stringify(err));
      }

      let strJson = inspector.getInspectorByKey('particleId');
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ParticlePage err: ' + JSON.stringify(err));
      }
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ParticlePage_static_0100] component obj is: ' +
      JSON.stringify(obj.getElement('$attrs').getArray('particles')));
      console.info('[ParticlePage_static_0100] content obj is: ' + JSON.stringify(obj.getElement('$attrs')
        .getElement('particles')[0]
        .getElement('color')
        .getElement('updater')
        .getElement('config')));
      console.info('[ParticlePage_static_0100] content obj b is: ' + JSON.stringify(obj.getElement('$attrs')
        .getElement('particles')[0]
        .getElement('color')
        .getElement('updater')
        .getElement('config')
        .getString('b')));
      expect(obj.getElement('$attrs')
        .getElement('particles')[0]
        .getElement('color')
        .getElement('updater')
        .getElement('config')
        .getString('b')).assertEqual('[1.000000,20.000000]');

      console.info('ParticlePage_static_0100 END');
      done();
    });


  })
}
