/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import accessibility from '@ohos.accessibility'
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() {
  describe("AccessibleRegisterStateStatic", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100
    * @tc.desc    onAccessibilityStateChange
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.onAccessibilityStateChange(callbackdata);
        accessibility.offAccessibilityStateChange(callbackdata);
        accessibility.offAccessibilityStateChange();
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100 failed');
        expect(null).assertFail();
        done();
      }
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200
    * @tc.desc    onTouchGuideStateChange
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.onTouchGuideStateChange(callbackdata);
        accessibility.offTouchGuideStateChange(callbackdata);
        accessibility.offTouchGuideStateChange();
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200 failed');
        expect(null).assertFail();
        done();
      }
    })

    /*
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300
     * @tc.desc    onScreenReaderStateChange
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */

    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.onScreenReaderStateChange(callbackdata);
        accessibility.offScreenReaderStateChange(callbackdata);
        accessibility.offScreenReaderStateChange();
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300 failed');
        expect(null).assertFail();
        done();
      }
    })

    /*
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0400
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0400
     * @tc.desc    getCaptionsManager
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0400');
      let captionsStyle: accessibility.CaptionsStyle = {
        fontFamily: "default",
        fontScale: 75,
        fontColor: "#FF000000",
        fontEdgeType: "raised",
        backgroundColor: "#FF000000",
        windowColor: "#FF000000",
      }
      try {
        let captionsManager = accessibility.getCaptionsManager();
        captionsManager.enabled = true;
        captionsManager.style = captionsStyle;
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0400 failed');
        expect(null).assertFail();
        done();
      }
    })

    /*
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0500
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0500
     * @tc.desc    onEnableChange
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0500');
      let callbackdata = (data: boolean) => {
        hilog.info(domain, tag, 'on captions state changed');
      }
      try {
        let captionsManager = accessibility.getCaptionsManager();
        captionsManager.onEnableChange(callbackdata)
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0500 failed');
        expect(null).assertFail();
        done();
      }
    })

    /*
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0600
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0600
     * @tc.desc    onStyleChange
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0600');
      let callbackdata = (data: accessibility.CaptionsStyle) => {
        hilog.info(domain, tag, 'on captions style changed');
      }
      try {
        let captionsManager = accessibility.getCaptionsManager();
        captionsManager.onStyleChange(callbackdata)
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0600 failed');
        expect(null).assertFail();
        done();
      }
    })

    /*
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0700
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0700
     * @tc.desc    offEnableChange
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0700');
      let callbackdata = (data: boolean) => {
        hilog.info(domain, tag, 'on captions state changed');
      }
      try {
        let captionsManager = accessibility.getCaptionsManager();
        captionsManager.offEnableChange(callbackdata);
        captionsManager.offEnableChange();
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0700 failed');
        expect(null).assertFail();
        done();
      }
    })

    /*
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0800
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0800
     * @tc.desc    offStyleChange
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0800');
      let callbackdata = (data: accessibility.CaptionsStyle) => {
        hilog.info(domain, tag, 'on captions style changed');
      }
      try {
        let captionsManager = accessibility.getCaptionsManager();
        captionsManager.offStyleChange(callbackdata);
        captionsManager.offStyleChange();
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0800 failed');
        expect(null).assertFail();
        done();
      }
    })
  })
}