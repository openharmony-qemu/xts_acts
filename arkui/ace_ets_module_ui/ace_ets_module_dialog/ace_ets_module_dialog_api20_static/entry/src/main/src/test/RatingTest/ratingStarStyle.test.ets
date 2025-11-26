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

import events_emitter from '@ohos.events.emitter';
import { Color,$r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function ratingStarStyle() {
  describe('ratingStarStyle', () => {
    beforeAll(() => {
      console.info("ratingStarStyle beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rating/ratingStarStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState();
        console.info('get rating state success ' + JSON.stringify(pages));
        if (!('ratingStarStyle' == pages.name)) {
          console.info('get rating state success ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error('push rating page error ' + JSON.stringify(err));
      }
    });

    
    /*
     * @tc.number   RatingStarStyle_static_0100
     * @tc.name     RatingStarStyle_static_0100
     * @tc.desc     RatingStarStyle_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('RatingStarStyle_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'RatingStarStyle_0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('rating_001');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RatingStarStyle_0100] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('starStyle')));
      expect(obj.getElement('$attrs').getElement('starStyle').getString('backgroundUri')).assertEqual('resource://RAWFILE/image1.png');
      expect(obj.getElement('$attrs').getElement('starStyle').getString('foregroundUri')).assertEqual('resource://RAWFILE/image2.png');
      expect(obj.getElement('$attrs').getElement('starStyle').getString('secondaryUri')).assertEqual('resource://RAWFILE/image3.png');
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(1000);
      done();
    });

    
    /*
     * @tc.number   RatingStarStyle_static_0200
     * @tc.name     RatingStarStyle_static_0200
     * @tc.desc     RatingStarStyle_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('RatingStarStyle_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'RatingStarStyle_0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('rating_002');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RatingStarStyle_0200] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('starStyle')));
      expect(obj.getElement('$attrs').getElement('starStyle').getString('backgroundUri')).assertEqual("resources/rawfile/image1.png");
      expect(obj.getElement('$attrs').getElement('starStyle').getString('foregroundUri')).assertEqual("resources/rawfile/image2.png");
      expect(obj.getElement('$attrs').getElement('starStyle').getString('secondaryUri')).assertEqual("resources/rawfile/image3.png");
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(1000);
      done();
    });

    
    /*
     * @tc.number   RatingStarStyle_static_0300
     * @tc.name     RatingStarStyle_static_0300
     * @tc.desc     RatingStarStyle_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('RatingStarStyle_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'RatingStarStyle_0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('rating_003');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RatingStarStyle_0300] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('starStyle')));
      expect(obj.getElement('$attrs').getElement('starStyle').getString('backgroundUri')).assertEqual("");
      expect(obj.getElement('$attrs').getElement('starStyle').getString('foregroundUri')).assertEqual("");
      expect(obj.getElement('$attrs').getElement('starStyle').getString('secondaryUri')).assertEqual("");
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(1000);
      done();
    });

    
    /*
     * @tc.number   RatingStarStyle_static_0400
     * @tc.name     RatingStarStyle_static_0400
     * @tc.desc     RatingStarStyle_static_0400
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('RatingStarStyle_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'RatingStarStyle_0400';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('rating_004');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('starStyle').getString('backgroundUri')).assertEqual("");
      expect(obj.getElement('$attrs').getElement('starStyle').getString('foregroundUri')).assertEqual("");
      expect(obj.getElement('$attrs').getElement('starStyle').getString('secondaryUri')).assertEqual("");
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(1000);
      done();
    });
  })
}
