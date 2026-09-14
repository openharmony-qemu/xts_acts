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
import { describe, beforeEach, afterEach, it, expect, Level, TestType, Size } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import deviceInfo from '@ohos.deviceInfo';

export default function showActionSheetMode() {
  describe('showActionSheetMode', () => {

    beforeEach(async () => {
      console.info("showActionSheetMode beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/actionSheet/showActionSheetMode",
      }
      try {
        const showActionSheetMode = AppStorage.get<Router>("router") as Router
        showActionSheetMode.clear();
        let pages:router.RouterState = showActionSheetMode.getState();
        console.info("get showActionSheetMode state pages: " + JSON.stringify(pages));
        if (!("showActionSheetMode" == pages.name)) {
          console.info("get showActionSheetMode state pages.name: " + JSON.stringify(pages.name));
          // let result = await showActionSheetMode.pushUrl(options);
          showActionSheetMode.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push showActionSheetMode success: " + JSON.stringify(result));
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push showActionSheetMode page error: " + err);
        expect().assertFail();
      }
    });


    
    

/**
     * @tc.number   showactionSheetMode_static_0100
     * @tc.name     showactionSheetMode_static_0100
     * @tc.desc     showactionSheetMode_static_0100
     * @tc.level    Level.LEVEL1
     */
it('showactionSheetMode_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showactionSheetMode_static_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('levelMode: OVERLAY')) ) as Component;
      try {
        await ( btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0100] overlay click');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      try {
        await ( btn0?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn1: Component = (await driver.findComponent(ON.id('showActionSheet'))) as Component;
      try {
        await ( btn1?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0100] showActionSheet click');

      let btn2: Component = (await driver.findComponent(ON.text('Confirm button'))) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showactionSheetMode_static_0100] Confirm button');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn3: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      try {
        await ( btn3?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0100] back');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn4: Component = (await driver.findComponent(ON.text('Confirm button'))) as Component;
      expect(btn4 != null).assertTrue();
      try {
        await ( btn4?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0100] END');
      done();
    });

    
    

/**
     * @tc.number   showactionSheetMode_static_0200
     * @tc.name     showactionSheetMode_static_0200
     * @tc.desc     showactionSheetMode_static_0200
     * @tc.level    Level.LEVEL1
     */
it('showactionSheetMode_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showactionSheetMode_static_0200 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('levelMode: EMBEDDED')) ) as Component;
      try {
        await ( btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0200] EMBEDDED click');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      try {
        await ( btn0?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

      let btn1: Component = (await driver.findComponent(ON.id('showActionSheet'))) as Component;
      try {
        await ( btn1?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0200] showActionSheet click');

      let btn2: Component = (await driver.findComponent(ON.text('Confirm button'))) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showactionSheetMode_static_0200] Confirm button');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn3: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      try {
        await ( btn3?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0200] back');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn4 = (await driver.findComponent(ON.text('Confirm button')));
      expect(btn4 != null).assertFalse();
      console.info('[showactionSheetMode_static_0200] END');
      done();
    });

    
    

/**
     * @tc.number   showactionSheetMode_static_0300
     * @tc.name     showactionSheetMode_static_0300
     * @tc.desc     showactionSheetMode_static_0300
     * @tc.level    Level.LEVEL1
     */
it('showactionSheetMode_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showactionSheetMode_static_0300 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('levelMode: OVERLAY')) ) as Component;
      try {
        await ( btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0300] OVERLAY click');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Abnormal value')) ) as Component;
      try {
        await ( btn0?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

      let btn1: Component = (await driver.findComponent(ON.id('showActionSheet'))) as Component;
      try {
        await ( btn1?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0300] showActionSheet click');

      let btn2: Component = (await driver.findComponent(ON.text('Confirm button'))) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showactionSheetMode_static_0300] Confirm button');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn3: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      try {
        await ( btn3?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0300] back');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn4: Component = (await driver.findComponent(ON.text('Confirm button'))) as Component;
      expect(btn4 != null).assertTrue();
      try {
        await ( btn4?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0300] END');
      done();
    });

    
    

/**
     * @tc.number   showactionSheetMode_static_0400
     * @tc.name     showactionSheetMode_static_0400
     * @tc.desc     showactionSheetMode_static_0400
     * @tc.level    Level.LEVEL1
     */
it('showactionSheetMode_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showactionSheetMode_static_0400 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('levelMode: EMBEDDED')) ) as Component;
      try {
        await ( btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0400] EMBEDDED click');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Abnormal value')) ) as Component;
      try {
        await ( btn0?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

      let btn1: Component = (await driver.findComponent(ON.id('showActionSheet'))) as Component;
      try {
        await ( btn1?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0400] showActionSheet click');

      let btn2: Component = (await driver.findComponent(ON.text('Confirm button'))) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showactionSheetMode_static_0400] Confirm button');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn3: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      try {
        await ( btn3?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0400] back');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn4: Component = (await driver.findComponent(ON.text('Confirm button'))) as Component;
      expect(btn4 != null).assertTrue();
      try {
        await ( btn4?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0400] END');
      done();
    });


     
    

/**
     * @tc.number   showactionSheetMode_static_0500
     * @tc.name     showactionSheetMode_static_0500
     * @tc.desc     showactionSheetMode_static_0500
     * @tc.level    Level.LEVEL1
     */
it('showactionSheetMode_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showactionSheetMode_static_0500 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
     let btn: Component = ( await driver.findComponent(ON.id('levelMode: EMBEDDED')) ) as Component;
      try {
        await ( btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0400] EMBEDDED click');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

       let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      try {
        await ( btn0?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }


      let button: Component = (await driver.findComponent(ON.id('imMode: extend'))) as Component;
      try {
        await ( button?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

      let btn1: Component = (await driver.findComponent(ON.id('showActionSheet'))) as Component;
      try {
        await ( btn1?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0500] showActionSheet click');

      let btn2: Component = (await driver.findComponent(ON.text('Confirm button'))) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showactionSheetMode_static_0500] Confirm button');
      try {
        await ( btn2?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0500] END');
      done();
    });

    
     
    

/**
     * @tc.number   showactionSheetMode_static_0600
     * @tc.name     showactionSheetMode_static_0600
     * @tc.desc     showactionSheetMode_static_0600
     * @tc.level    Level.LEVEL1
     */
it('showactionSheetMode_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showactionSheetMode_static_0500 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
     let btn: Component = ( await driver.findComponent(ON.id('levelMode: EMBEDDED')) ) as Component;
      try {
        await ( btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0400] EMBEDDED click');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

       let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      try {
        await ( btn0?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

      let button: Component = ( await driver.findComponent(ON.id('imMode: default')) ) as Component;
      try {
        await ( button?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

      let btn1: Component = (await driver.findComponent(ON.id('showActionSheet'))) as Component;
      try {
        await ( btn1?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0500] showActionSheet click');

      let btn2: Component = (await driver.findComponent(ON.text('Confirm button'))) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showactionSheetMode_static_0500] Confirm button');
      try {
        await ( btn2?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0500] END');
      done();
    });

    
    

/**
     * @tc.number   showactionSheetMode_static_0700
     * @tc.name     showactionSheetMode_static_0700
     * @tc.desc     showactionSheetMode_static_0700
     * @tc.level    Level.LEVEL1
     */
it('showactionSheetMode_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showactionSheetMode_static_0700 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn: Component = (await driver.findComponent(ON.id('undefined'))) as Component;
      try {
        await ( btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0700] overlay click');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      try {
        await ( btn0?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn1: Component = (await driver.findComponent(ON.id('showActionSheet'))) as Component;
      try {
        await ( btn1?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0700] showActionSheet click');

      let btn2: Component = (await driver.findComponent(ON.text('Confirm button'))) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showactionSheetMode_static_0700] Confirm button');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn3: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      try {
        await ( btn3?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0700] back');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn4: Component = (await driver.findComponent(ON.text('Confirm button'))) as Component;
      expect(btn4 != null).assertTrue();
      try {
        await ( btn4?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0700] END');
      done();
    });

    
    

/**
     * @tc.number   showactionSheetMode_static_0800
     * @tc.name     showactionSheetMode_static_0800
     * @tc.desc     showactionSheetMode_static_0800
     * @tc.level    Level.LEVEL1
     */
it('showactionSheetMode_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showactionSheetMode_static_0800 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('null')) ) as Component;
      try {
        await ( btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0800] overlay click');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      try {
        await ( btn0?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn1: Component = (await driver.findComponent(ON.id('showActionSheet'))) as Component;
      try {
        await ( btn1?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0800] showActionSheet click');

      let btn2: Component = (await driver.findComponent(ON.text('Confirm button'))) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showactionSheetMode_static_0800] Confirm button');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn3: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      try {
        await ( btn3?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0800] back');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      let btn4: Component = (await driver.findComponent(ON.text('Confirm button'))) as Component;
      expect(btn4 != null).assertTrue();
      try {
        await ( btn4?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      console.info('[showactionSheetMode_static_0800] END');
      done();
    });

  })
}