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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve(undefined);
    }, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}


export default function ratingJsunit() {


  describe('ratingTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rating/Rating'
      };
      try {
        const rating = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        rating.clear();
        await sleep(1);
        let pages:router.RouterState = rating.getState();
        console.info("get Rating state success " + JSON.stringify(pages));
        if (!("Rating" == pages.name)) {
          console.info("get Rating state success " + JSON.stringify(pages.name));
          // let result = await rating.pushUrl(options);
          rating.pushUrl(options);
          // console.info("push Rating page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Rating page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    afterEach(async (): Promise<void> => {
      await sleep(1);
      console.info("Rating after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0990
     * @tc.name testGetRatingAttr010
     * @tc.desc aceEtsTest
     */
    it('testGetRatingAttr010_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetRatingAttr1 START');
      let strJson = inspector.getInspectorByKey('rating1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.info("rating1 rating" + JSON.stringify(obj.getElement('$attrs').getString('rating')));
      console.info("rating1 indicator" + JSON.stringify(obj.getElement('$attrs').getString('indicator')));
      console.info("rating1 stepSize" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
      console.info("rating1 stars" + JSON.stringify(obj.getElement('$attrs').getString('stars')));
      console.info("rating1 starStyle" + JSON.stringify(obj.getElement('$attrs').getString('starStyle')));
      expect(obj.getElement('$attrs').getString('rating')).assertEqual("2.000000");
      expect(obj.getElement('$attrs').getString('indicator')).assertEqual("false");
      expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("0.500000");
      expect(obj.getElement('$attrs').getString('stars')).assertEqual("5");
      expect(obj.getElement('$attrs').getString('starStyle'))
        .assertEqual('{"backgroundUri":"/resources/rawfile/star-1-1.png","foregroundUri":"/resources/rawfile/star-1-3.png","secondaryUri":"/resources/rawfile/star-1-2.png"}');
      console.info('testGetRatingAttr1 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1000
     * @tc.name testGetRatingAttr020
     * @tc.desc aceEtsTest
     */
    it('testGetRatingAttr020_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetRatingAttr2 START');
      let strJson = inspector.getInspectorByKey('rating2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.info("rating2 indicator" + JSON.stringify(obj.getElement('$attrs').getString('indicator')));
      expect(obj.getElement('$attrs').getString('indicator')).assertEqual("true");
      console.info('testGetRatingAttr2 END');
      done();
    });
  })
}
