/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeRender from 'libnativerender.so';
import { Driver, ON, Component } from '@kit.TestKit';

export default function ArcListEventCallbackTest() {
  describe('ArcListEventCallbackTest', () => {
    let driver: Driver;
    let scrollComponent: Component;

    beforeAll(async (done: Function) => {
      console.info('[ArcListEventCallbackTest] beforeAll');
      driver = Driver.create();
      await Utils.pushPage('pages/arclist/ArcListEventCallbackTest');
      await Utils.sleep(1000);
      scrollComponent = await driver.findComponent(ON.id('ArcListScrollTest'));
      done();
    });

    beforeEach(async (done: Function) => {
      console.info('[ArcListEventCallbackTest] beforeEach');
      nativeRender.resetEventFlags();
      await Utils.sleep(100);
      done();
    });

    afterEach(() => {
      console.info('[ArcListEventCallbackTest] afterEach');
    });

    afterAll(async (done: Function) => {
      console.info('[ArcListEventCallbackTest] afterAll');
      done();
    });

    it('testOnScrollIndex', Level.LEVEL0, async (done: Function) => {
      console.info('[testOnScrollIndex] START');
      try {
        await driver.swipe(150, 400, 150, 100, 500);
        await Utils.sleep(1000);
        
        let called = nativeRender.getScrollIndexCalled();
        expect(called).assertTrue();
        console.info('[testOnScrollIndex] END');
        done();
      } catch (err) {
        console.error('[testOnScrollIndex] ERROR: ' + err);
        expect(false).assertTrue();
        done();
      }
    });

    it('testOnReachStart', Level.LEVEL0, async (done: Function) => {
      console.info('[testOnReachStart] START');
      try {
        await driver.swipe(150, 400, 150, 100, 500);
        await Utils.sleep(500);
        await driver.swipe(150, 400, 150, 100, 500);
        await Utils.sleep(1000);
        
        let called = nativeRender.getReachStartCalled();
        expect(called).assertTrue();
        console.info('[testOnReachStart] END');
        done();
      } catch (err) {
        console.error('[testOnReachStart] ERROR: ' + err);
        expect(false).assertTrue();
        done();
      }
    });

    it('testOnReachEnd', Level.LEVEL0, async (done: Function) => {
      console.info('[testOnReachEnd] START');
      try {
        await driver.swipe(150, 100, 150, 400, 500);
        await Utils.sleep(500);
        await driver.swipe(150, 100, 150, 400, 500);
        await Utils.sleep(1000);
        
        let called = nativeRender.getReachEndCalled();
        expect(called).assertTrue();
        console.info('[testOnReachEnd] END');
        done();
      } catch (err) {
        console.error('[testOnReachEnd] ERROR: ' + err);
        expect(false).assertTrue();
        done();
      }
    });

    it('testOnScrollStart', Level.LEVEL0, async (done: Function) => {
      console.info('[testOnScrollStart] START');
      try {
        await driver.swipe(150, 400, 150, 100, 500);
        await Utils.sleep(1000);
        
        let called = nativeRender.getScrollStartCalled();
        expect(called).assertTrue();
        console.info('[testOnScrollStart] END');
        done();
      } catch (err) {
        console.error('[testOnScrollStart] ERROR: ' + err);
        expect(false).assertTrue();
        done();
      }
    });

    it('testOnScrollStop', Level.LEVEL0, async (done: Function) => {
      console.info('[testOnScrollStop] START');
      try {
        await driver.swipe(150, 400, 150, 100, 500);
        await Utils.sleep(2000);
        
        let called = nativeRender.getScrollStopCalled();
        expect(called).assertTrue();
        console.info('[testOnScrollStop] END');
        done();
      } catch (err) {
        console.error('[testOnScrollStop] ERROR: ' + err);
        expect(false).assertTrue();
        done();
      }
    });

    it('testOnWillScroll', Level.LEVEL0, async (done: Function) => {
      console.info('[testOnWillScroll] START');
      try {
        await driver.swipe(150, 400, 150, 100, 500);
        await Utils.sleep(1000);
        
        let called = nativeRender.getWillScrollCalled();
        expect(called).assertTrue();
        console.info('[testOnWillScroll] END');
        done();
      } catch (err) {
        console.error('[testOnWillScroll] ERROR: ' + err);
        expect(false).assertTrue();
        done();
      }
    });

    it('testOnDidScroll', Level.LEVEL0, async (done: Function) => {
      console.info('[testOnDidScroll] START');
      try {
        await driver.swipe(150, 400, 150, 100, 500);
        await Utils.sleep(1000);
        
        let called = nativeRender.getDidScrollCalled();
        expect(called).assertTrue();
        console.info('[testOnDidScroll] END');
        done();
      } catch (err) {
        console.error('[testOnDidScroll] ERROR: ' + err);
        expect(false).assertTrue();
        done();
      }
    });
  });
}