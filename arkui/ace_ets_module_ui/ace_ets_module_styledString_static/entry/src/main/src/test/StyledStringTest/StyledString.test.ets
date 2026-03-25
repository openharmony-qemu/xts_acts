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
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import {
  StyledString,
  ParagraphStyle,
  ParagraphStyleInterface,
  ImageAttachment,
  ResourceImageAttachmentOptions,
  TextDirection
} from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function StyledStringTest() {
  describe('StyledStringTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("StyledStringTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.styledString.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("StyledStringTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/StyledStringIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("StyledStringTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "StyledStringIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("StyledStringTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("StyledStringTest after each called");
    });

    /**
     * @tc.number StyledStringTest_001
     * @tc.name styledStringLengthBasic
     * @tc.desc Test StyledString.length with "Hello World" (11 chars)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('styledStringLengthBasic', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest execute: styledStringLengthBasic START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let str = new StyledString("Hello World");
        let len = str.length;
        console.info('StyledStringTest: styledStringLengthBasic length = ' + len);
        expect(len).assertEqual(11);
        console.info('StyledStringTest execute: styledStringLengthBasic END');
        done();
      } catch (error) {
        console.error('StyledStringTest execute: styledStringLengthBasic error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number StyledStringTest_002
     * @tc.name styledStringLengthEmpty
     * @tc.desc Test StyledString.length with empty string (0 chars)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('styledStringLengthEmpty', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest execute: styledStringLengthEmpty START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let str = new StyledString("");
        let len = str.length;
        console.info('StyledStringTest: styledStringLengthEmpty length = ' + len);
        expect(len).assertEqual(0);
        console.info('StyledStringTest execute: styledStringLengthEmpty END');
        done();
      } catch (error) {
        console.error('StyledStringTest execute: styledStringLengthEmpty error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number StyledStringTest_003
     * @tc.name styledStringLengthChinese
     * @tc.desc Test StyledString.length with Chinese characters "你好" (2 chars)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('styledStringLengthChinese', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest execute: styledStringLengthChinese START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let str = new StyledString("你好");
        let len = str.length;
        console.info('StyledStringTest: styledStringLengthChinese length = ' + len);
        expect(len).assertEqual(2);
        console.info('StyledStringTest execute: styledStringLengthChinese END');
        done();
      } catch (error) {
        console.error('StyledStringTest execute: styledStringLengthChinese error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number StyledStringTest_004
     * @tc.name paragraphStyleTextDirectionLTR
     * @tc.desc Test ParagraphStyle.textDirection (new readonly property) with TextDirection.LTR
     *          Also validates ParagraphStyleInterface.textDirection input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('paragraphStyleTextDirectionLTR', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest execute: paragraphStyleTextDirectionLTR START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        // ParagraphStyleInterface.textDirection used as constructor param
        let options: ParagraphStyleInterface = { textDirection: TextDirection.LTR };
        let paraStyle = new ParagraphStyle(options);
        let dir = paraStyle.textDirection;
        console.info('StyledStringTest: paragraphStyleTextDirectionLTR textDirection = ' + dir);
        expect(dir).assertEqual(TextDirection.LTR);
        console.info('StyledStringTest execute: paragraphStyleTextDirectionLTR END');
        done();
      } catch (error) {
        console.error('StyledStringTest execute: paragraphStyleTextDirectionLTR error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number StyledStringTest_005
     * @tc.name paragraphStyleTextDirectionRTL
     * @tc.desc Test ParagraphStyle.textDirection with TextDirection.RTL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('paragraphStyleTextDirectionRTL', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest execute: paragraphStyleTextDirectionRTL START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let paraStyle = new ParagraphStyle({
          textDirection: TextDirection.RTL
        } as ParagraphStyleInterface);
        let dir = paraStyle.textDirection;
        console.info('StyledStringTest: paragraphStyleTextDirectionRTL textDirection = ' + dir);
        expect(dir).assertEqual(TextDirection.RTL);
        console.info('StyledStringTest execute: paragraphStyleTextDirectionRTL END');
        done();
      } catch (error) {
        console.error('StyledStringTest execute: paragraphStyleTextDirectionRTL error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number StyledStringTest_006
     * @tc.name paragraphStyleTextDirectionDefault
     * @tc.desc Test ParagraphStyle.textDirection with TextDirection.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('paragraphStyleTextDirectionDefault', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest execute: paragraphStyleTextDirectionDefault START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let paraStyle = new ParagraphStyle({
          textDirection: TextDirection.DEFAULT
        } as ParagraphStyleInterface);
        let dir = paraStyle.textDirection;
        console.info('StyledStringTest: paragraphStyleTextDirectionDefault textDirection = ' + dir);
        expect(dir).assertEqual(TextDirection.DEFAULT);
        console.info('StyledStringTest execute: paragraphStyleTextDirectionDefault END');
        done();
      } catch (error) {
        console.error('StyledStringTest execute: paragraphStyleTextDirectionDefault error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number StyledStringTest_007
     * @tc.name paragraphStyleTextDirectionUndefined
     * @tc.desc Test ParagraphStyle.textDirection when not set (should be undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('paragraphStyleTextDirectionUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest execute: paragraphStyleTextDirectionUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        // Not setting textDirection - should be undefined
        let paraStyle = new ParagraphStyle({} as ParagraphStyleInterface);
        let dir = paraStyle.textDirection;
        console.info('StyledStringTest: paragraphStyleTextDirectionUndefined textDirection = ' + dir);
        expect(dir === undefined).assertTrue();
        console.info('StyledStringTest execute: paragraphStyleTextDirectionUndefined END');
        done();
      } catch (error) {
        console.error('StyledStringTest execute: paragraphStyleTextDirectionUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number StyledStringTest_008
     * @tc.name paragraphStyleTextDirectionAuto
     * @tc.desc Test ParagraphStyle.textDirection with TextDirection.AUTO (covers all 4 enum values)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('paragraphStyleTextDirectionAuto', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest execute: paragraphStyleTextDirectionAuto START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let paraStyle = new ParagraphStyle({
          textDirection: TextDirection.AUTO
        } as ParagraphStyleInterface);
        let dir = paraStyle.textDirection;
        console.info('StyledStringTest: paragraphStyleTextDirectionAuto textDirection = ' + dir);
        expect(dir).assertEqual(TextDirection.AUTO);
        console.info('StyledStringTest execute: paragraphStyleTextDirectionAuto END');
        done();
      } catch (error) {
        console.error('StyledStringTest execute: paragraphStyleTextDirectionAuto error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number StyledStringTest_009
     * @tc.name imageAttachmentResourceValue
     * @tc.desc Test ImageAttachment.resourceValue (new readonly property) from ResourceImageAttachmentOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageAttachmentResourceValue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest execute: imageAttachmentResourceValue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        // Use plain string as ResourceStr (ResourceStr = string | Resource)
        let attachment = new ImageAttachment({
          resourceValue: 'app.media.icon'
        } as ResourceImageAttachmentOptions);
        let resVal = attachment.resourceValue;
        console.info('StyledStringTest: imageAttachmentResourceValue resourceValue = ' + resVal);
        expect(resVal).assertEqual('app.media.icon');
        console.info('StyledStringTest execute: imageAttachmentResourceValue END');
        done();
      } catch (error) {
        console.error('StyledStringTest execute: imageAttachmentResourceValue error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
