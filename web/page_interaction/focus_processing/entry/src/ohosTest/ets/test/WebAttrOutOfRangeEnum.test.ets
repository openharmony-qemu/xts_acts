/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

/**
 * Out-of-range enum coverage for WebAttribute APIs (BG blank: 未覆盖API定义之外的枚举).
 */
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@kit.TestKit';

export default function webAttrOutOfRangeEnum() {
  describe('webAttrOutOfRangeEnum', () => {
    /**
     * @tc.name   SUB_WEB_ATTR_OUT_OF_RANGE_ENUM_0100
     * @tc.number SUB_WEB_ATTR_OUT_OF_RANGE_ENUM_0100
     * @tc.desc   load page that applies invalid MixedMode/OverScroll/Layout/... enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_ATTR_OUT_OF_RANGE_ENUM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          await router.pushUrl({ url: 'testability/pages/WebAttrOutOfRangeEnum' });
        } catch (err) {
          console.error('push WebAttrOutOfRangeEnum err=' + JSON.stringify(err));
        }
        let driver = Driver.create();
        let btn = await driver.waitForComponent(ON.id('WebAttrOutOfRangeEnum_btn'), 10000);
        expect(btn !== undefined).assertTrue();
        done();
      })
  })
}
