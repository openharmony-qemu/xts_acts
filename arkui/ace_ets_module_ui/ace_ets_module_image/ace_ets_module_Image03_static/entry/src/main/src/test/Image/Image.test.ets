/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Utils.test';

export default function imageJsunit() {
  describe('imageTest', () => {
    beforeAll(() => {
      console.info("imageJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.Image03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () :Promise<void>=> {
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get image state success " + JSON.stringify(pages));
        if (!("image" == pages.name)) {
          console.info("get image state success " + JSON.stringify(pages.name));
          router.pushUrl({url: 'MainAbility/pages/image'});
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push image page error: " + err);
      }
      // done();
    });

    /**
     * @tc.number imageTest_static_0001
     * @tc.name Test the properties of components
     * @tc.desc Set copyOption values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0001', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0001 START');
      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0001 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('copyOption')).assertEqual("CopyOptions.None");
      console.info('imageTest_static_0001 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0002
     * @tc.name Test the properties of components
     * @tc.desc Set colorFilter values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0002', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0002 START');
      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0002 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('colorFilter'))
        .assertEqual("1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 ");
      console.info('imageTest_static_0002 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0003
     * @tc.name Test the properties of components
     * @tc.desc Set syncLoad values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0003', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0003 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0003 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('syncLoad')).assertEqual("true");
      console.info('imageTest_static_0003 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0004
     * @tc.name Test the properties of components
     * @tc.desc Set sourceSize values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0004', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0004 START');
      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0004 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('sourceSize')).assertEqual('[200.00 x 100.00]');
      console.info('imageTest_static_0004 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0005
     * @tc.name Test the properties of components
     * @tc.desc Set interpolation values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0005', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0005 START');
      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0005 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('interpolation')).assertEqual("ImageInterpolation.None");
      console.info('imageTest_static_0005 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0006
     * @tc.name Test the properties of components
     * @tc.desc Set renderMode values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0006', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0006 START');
      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0006 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('renderMode')).assertEqual("ImageRenderMode.Original");
      console.info('imageTest_static_0006 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0007
     * @tc.name Test the properties of components
     * @tc.desc Set autoResize values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0007', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0007 START');
      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0007 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('autoResize')).assertEqual("true");
      console.info('imageTest_static_0007 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0008
     * @tc.name Test the properties of components
     * @tc.desc Set objectRepeat values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0008', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0008 START');
      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0008 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('objectRepeat')).assertEqual("ImageRepeat.NoRepeat");
      console.info('imageTest_static_0008 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0009
     * @tc.name Test the properties of components
     * @tc.desc Set objectFit values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0009', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0009 START');
      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0009 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('objectFit')).assertEqual("ImageFit.None");
      console.info('imageTest_static_0009 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0010
     * @tc.name Test the properties of components
     * @tc.desc Set fillColor values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0010', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0010 START');
      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0010 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('fillColor')).assertEqual("#FF182431");
      console.info('imageTest_static_0010 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0011
     * @tc.name Test the properties of components
     * @tc.desc Set fitOriginalSize values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0011', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0011 START');
      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0011 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('fitOriginalSize')).assertEqual("true");
      console.info('imageTest_static_0011 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0012
     * @tc.name Test the properties of components
     * @tc.desc Set matchTextDirection values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0012', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0012 START');
      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0012 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('matchTextDirection')).assertEqual("true");
      console.info('imageTest_static_0012 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0013
     * @tc.name Test the properties of components
     * @tc.desc Set alt values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0013', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0013 START');
      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0013 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('alt')).assertEqual("aaa");
      console.info('imageTest_static_0013 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0014
     * @tc.name Test the properties of components
     * @tc.desc Set draggable values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0014', 0, async (done: ()=>void) => {
      console.info('imageTest_static_0014 START');
      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0014 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('draggable')).assertEqual("false");
      console.info('imageTest_static_0014 END');
      done();
    });

    /**
     * @tc.number imageTest_static_0015
     * @tc.name Test the properties of components
     * @tc.desc Change syncLoad values
     * @tc.size MediumTest
     * @tc.type ()=>void
     * @tc.level 0
     */
    it('imageTest_static_0015', 0, async (done: ()=>void) => {

      console.info('imageTest_static_0015 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000)

      let strJsonNew = inspector.getInspectorByKey('image');
      
      console.info("imageTest_static_0015 component  is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('syncLoad')).assertEqual("true");
      console.info('imageTest_static_0015 END');
      done();
    });
  })
}