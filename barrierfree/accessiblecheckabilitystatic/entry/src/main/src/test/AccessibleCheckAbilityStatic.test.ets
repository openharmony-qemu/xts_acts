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
  describe("AccessibleCheckAbilityStaticTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');


    /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500
      * @tc.desc    The result of isOpenAccessibilitySync() should be boolean type.
      * @tc.size    MEDIUMTEST
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500');
      try {
        let status = accessibility.isOpenAccessibilitySync();
        hilog.info(domain, tag, `AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500 result: ${status}`);
        expect(typeof (status)).assertEqual('boolean');
        done();
      } catch (error) {
        hilog.error(domain, tag,'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500 failed to isOpenAccessibilitySync because ');
        expect(null).assertFail();
        done();
      }
    })

    /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600
      * @tc.desc    The result of isOpenTouchGuideSync() should be boolean type.
      * @tc.size    MEDIUMTEST
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600');
      try {
        let status = accessibility.isOpenTouchGuideSync();
        hilog.info(domain, tag, `AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600 result: ${status}`);
        expect(typeof (status)).assertEqual('boolean');
        done();
      } catch (error) {
        hilog.error(domain, tag,'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600 failed to isOpenTouchGuideSync because ');
        expect(null).assertFail();
        done();
      }
    })
  })
}