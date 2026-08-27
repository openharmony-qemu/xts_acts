'use static';
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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function GridRows1() {
  describe('GridRows1', () => {
    beforeEach(async (): Promise<void> => {
      console.info("GridRows1 beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get GridRows1 state pages:" + "");
        if (!("GridRows1" == pages.name)) {
          console.info("get  GridRows1 pages.name:" + "");
          routerInstance.pushUrl({url:"MainAbility/pages/GridRow/GridRows1"})
          await CommonFunc.sleep(4000);
          console.info("push GridRows1 page result:" + "");
        }
      } catch (err) {
        console.error("push GridRows1 page error:" + err);
      }
      console.info("GridRows1 foreEach end");
    });
    afterEach(async () => {
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      console.info("GridRows1 after each called");
    });

/**
     * @tc.number   GridRows1_static_001
     * @tc.name     GridRows1_static_001
     * @tc.desc     GridRows1_static_001
     * @tc.level    Level.LEVEL0
     */
it('GridRows1_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridRows1_static_001] START');

      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      let row1 = CommonFunc.getComponentRect('GridRows1_1');
      let row2 = CommonFunc.getComponentRect('GridRows1_5');
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }

      console.info("[GridRows1_static_001] GridRows1_1 is: " + JSON.stringify(row1) + 'GridRows1_5:' + JSON.stringify(row2) );
      expect(Math.abs(Math.round(row2.top - row1.bottom)) <= 1).assertTrue();

      console.info('[GridRows1_static_001] END');
      done();
    });

/**
     * @tc.number   GridRows1_static_002
     * @tc.name     GridRows1_static_002
     * @tc.desc     GridRows1_static_002
     * @tc.level    Level.LEVEL0
     */
it('GridRows1_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridRows1_static_002] START');

      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      try {
      await driver.findComponent(ON.id('GridRows1Bt1'));
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      try {
      await (button_Bottom?.click() as Promise<void>);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }

      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      let row1 = CommonFunc.getComponentRect('GridRows1_1');
      let row2 = CommonFunc.getComponentRect('GridRows1_5');
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }

      console.info("[GridRows1_static_002] GridRows1_1 is: " + JSON.stringify(row1) + 'GridRows1_5:' + JSON.stringify(row2) );
      expect(Math.abs(Math.round(row2.top - row1.bottom)) <= 1).assertTrue();

      console.info('[GridRows1_static_002] END');
      done();
    });

/**
     * @tc.number   GridRows1_static_003
     * @tc.name     GridRows1_static_003
     * @tc.desc     GridRows1_static_003
     * @tc.level    Level.LEVEL0
     */
it('GridRows1_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridRows1_static_003] START');

      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      let driver = Driver.create()
      try {
      await driver.findComponent(ON.id('GridRows1Bt3'));
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      try {
      await (button_Bottom?.click() as Promise<void>);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }

      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      let row1 = CommonFunc.getComponentRect('GridRows1_1');
      let row2 = CommonFunc.getComponentRect('GridRows1_5');
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }

      console.info("[GridRows1_static_003] GridRows1_1 is: " + JSON.stringify(row1) + 'GridRows1_5:' + JSON.stringify(row2) );
      expect(Math.abs(Math.round(row2.top - row1.bottom) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5)))) <= 1).assertTrue();

      console.info('[GridRows1_static_003] END');
      done();
    });

/**
     * @tc.number   GridRows1_static_004
     * @tc.name     GridRows1_static_004
     * @tc.desc     GridRows1_static_004
     * @tc.level    Level.LEVEL0
     */
it('GridRows1_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridRows1_static_004] START');

      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      try {
      await driver.findComponent(ON.id('GridRows1Bt2'));
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      try {
      await (button_Bottom?.click() as Promise<void>);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }

      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }
      let row1 = CommonFunc.getComponentRect('GridRows1_1');
      let row2 = CommonFunc.getComponentRect('GridRows1_2');
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('GridRows1Test await err: ' + JSON.stringify(err));
      }

      console.info("[GridRows1_static_004] GridRows1_1 is: " + JSON.stringify(row1) + 'GridRows1_5:' + JSON.stringify(row2) );
      expect(Math.abs(Math.round(row2.left - row1.right)) <= 1).assertTrue();

      console.info('[GridRows1_static_004] END');
      done();
    });
  })
}
