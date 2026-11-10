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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import arkuiCapiTest from 'libarkuicapigen.so'


export default function arkuiNativeCapiNativeInterfaceA11yHover() {
  describe('NativeInterfaceA11yHover (native_interface_a11y_hover)', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(50);
      done();
    });

    /**
     * @tc.number  TestArkUICapi_513
     * @tc.name    TestArkUICapi_513
     * @tc.desc    Case: TestArkUICapi_513. C API: register hover event handler on a custom host node.
     *             Expect success code on registering callback with user data.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_513', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_513()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_514
     * @tc.name    TestArkUICapi_514
     * @tc.desc    Case: TestArkUICapi_514. C API: register hover event handler with null host node.
     *             Expect param invalid error code 401.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL2
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_514', Level.LEVEL2, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_514()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_515
     * @tc.name    TestArkUICapi_515
     * @tc.desc    Case: TestArkUICapi_515. C API: register hover event handler with null callback.
     *             Expect param error code 100023.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL2
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_515', Level.LEVEL2, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_515()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_516
     * @tc.name    TestArkUICapi_516
     * @tc.desc    Case: TestArkUICapi_516. C API: register hover event handler on an unsupported
     *             column node. Expect type not supported error code 106102.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL2
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_516', Level.LEVEL2, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_516()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_517
     * @tc.name    TestArkUICapi_517
     * @tc.desc    Case: TestArkUICapi_517. C API: register hover event handler twice on the same
     *             custom host node. The second register overrides the first one and both return success.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_517', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_517()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_518
     * @tc.name    TestArkUICapi_518
     * @tc.desc    Case: TestArkUICapi_518. C API: register hover event handler on an
     *             xcomponent host node. Expect success code.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_518', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_518()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_519
     * @tc.name    TestArkUICapi_519
     * @tc.desc    Case: TestArkUICapi_519. C API: register hover event handler on an
     *             xcomponent texture host node. Expect success code.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_519', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_519()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_520
     * @tc.name    TestArkUICapi_520
     * @tc.desc    Case: TestArkUICapi_520. C API: unregister hover event handler after
     *             registering on a custom host node. Expect success code.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_520', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_520()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_521
     * @tc.name    TestArkUICapi_521
     * @tc.desc    Case: TestArkUICapi_521. C API: unregister hover event handler on a supported
     *             host node without previous registration. Expect success code.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_521', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_521()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_522
     * @tc.name    TestArkUICapi_522
     * @tc.desc    Case: TestArkUICapi_522. C API: unregister hover event handler with null host
     *             node. Expect param invalid error code 401.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL2
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_522', Level.LEVEL2, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_522()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_523
     * @tc.name    TestArkUICapi_523
     * @tc.desc    Case: TestArkUICapi_523. C API: unregister hover event handler on an unsupported
     *             column node. Expect type not supported error code 106102.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL2
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_523', Level.LEVEL2, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_523()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_524
     * @tc.name    TestArkUICapi_524
     * @tc.desc    Case: TestArkUICapi_524. C API: unregister hover event handler twice on the same
     *             custom host node. Repeat unregister is idempotent and both return success.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_524', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_524()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_525
     * @tc.name    TestArkUICapi_525
     * @tc.desc    Case: TestArkUICapi_525. C API: register, unregister and register again the hover
     *             event handler on the same custom host node. All steps return success.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_525', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_525()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_526
     * @tc.name    TestArkUICapi_526
     * @tc.desc    Case: TestArkUICapi_526. C API: register hover event handler with null user data.
     *             User data has no non-null constraint, expect success code.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_526', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_526()).assertEqual(0)
      done()
    })

  });
}
