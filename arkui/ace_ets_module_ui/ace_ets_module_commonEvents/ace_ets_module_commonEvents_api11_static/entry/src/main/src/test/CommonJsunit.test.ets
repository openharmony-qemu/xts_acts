/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index'
import display from '@ohos.display';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';

import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from './Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const uiContext = new UIContext();

const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

function asNum(v: string | number) {
  return v as number;
}


export default function commonJsunit() {
  describe('commonTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("commonTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/commonTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get commonTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get commonTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push commonTest page error:" + err);
      }
      console.info("commonTest beforeEach end");
    });


    /*
     * @tc.number    commonTest_static_0100
     * @tc.name      commonTest_static_0100
     * @tc.desc      commonTest_static_0100
     * @tc.level     2
     */
    it('commonTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {


        console.info('commonTest_0100 END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });

    /*
     * @tc.number    commonTest_static_0200
     * @tc.name      commonTest_static_0200
     * @tc.desc      commonTest_static_0200
     * @tc.level     2
     */
    it('commonTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      try {
        console.info('commonTest_0200 END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });

    /*
     * @tc.number    commonTest_static_0300
     * @tc.name      commonTest_static_0300
     * @tc.desc      commonTest_static_0300
     * @tc.level     2
     */
    it('commonTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('commonTest_0300 START');
        let a = '30';
        let b: number = UIContext.getFocusedUIContext()!.vp2px(asNum(a));
        console.info('commonTest_0300 vp2px result:' + b);

        console.info('commonTest_0300 END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });

    /*
     * @tc.number    commonTest_static_0400
     * @tc.name      commonTest_static_0400
     * @tc.desc      commonTest_static_0400
     * @tc.level     2
     */
    it('commonTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('commonTest_0400 START');


        console.info('commonTest_0400 END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });

    /*
     * @tc.number    commonTest_static_0500
     * @tc.name      commonTest_static_0500
     * @tc.desc      commonTest_static_0500
     * @tc.level     2
     */
    it('commonTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('commonTest_0500 START');


        console.info('commonTest_0500 END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });

    /*
     * @tc.number    commonTest_static_0600
     * @tc.name      commonTest_static_0600
     * @tc.desc      commonTest_static_0600
     * @tc.level     2
     */
    it('commonTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('commonTest_0600 START');
        let a = '80';
        let b = UIContext.getFocusedUIContext()!.px2vp(asNum(a));
        console.info('commonTest_0600 px2vp result:' + b);

        console.info('commonTest_0600 END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });

    /*
     * @tc.number    commonTest_static_0700
     * @tc.name      commonTest_static_0700
     * @tc.desc      commonTest_static_0700
     * @tc.level     2
     */
    it('commonTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('commonTest_0700 START');


        console.info('commonTest_0700 END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });

    /*
     * @tc.number    commonTest_static_0800
     * @tc.name      commonTest_static_0800
     * @tc.desc      commonTest_static_0800
     * @tc.level     2
     */
    it('commonTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('commonTest_0800 START');


        console.info('commonTest_0800 END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });

    /*
     * @tc.number    commonTest_static_0900
     * @tc.name      commonTest_static_0900
     * @tc.desc      commonTest_static_0900
     * @tc.level     2
     */
    it('commonTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('commonTest_0900 START');


        console.info('commonTest_0900 END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });

    /*
     * @tc.number    commonTest_static_1000
     * @tc.name      commonTest_static_1000
     * @tc.desc      commonTest_static_1000
     * @tc.level     2
     */
    it('commonTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('commonTest_1000 START');


        console.info('commonTest_1000 END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });

    /*
     * @tc.number    commonTest_static_1100
     * @tc.name      commonTest_static_1100
     * @tc.desc      commonTest_static_1100
     * @tc.level     2
     */
    it('commonTest_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('commonTest_1100 START');


        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });

    /*
     * @tc.number    commonTest_static_1200
     * @tc.name      commonTest_static_1200
     * @tc.desc      commonTest_static_1200
     * @tc.level     2
     */
    it('commonTest_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('commonTest_1200 START');
        let a = '60';
        let b = uiContext.px2fp(asNum(a));
        console.info('commonTest_1200 px2fp result:' + b);

        console.info('commonTest_1200 END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });


    /*
     * @tc.number    commonTest_static_1500
     * @tc.name      commonTest_static_1500
     * @tc.desc      commonTest_static_1500
     * @tc.level     2
     */
    it('commonTest_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('commonTest_1500 START');
        let a = '50';
        let b = uiContext.lpx2px(asNum(a));
        console.info('commonTest_1500 lpx2px result:' + b);

        console.info('commonTest_1500 END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });

    /*
     * @tc.number    commonTest_static_1800
     * @tc.name      commonTest_static_1800
     * @tc.desc      commonTest_static_1800
     * @tc.level     2
     */
    it('commonTest_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('commonTest_1800 START');
        let a = '40';
        let b = uiContext.px2lpx(asNum(a));
        console.info('commonTest_1800 px2lpx result:' + b);

        console.info('commonTest_1800 END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });
  })
}