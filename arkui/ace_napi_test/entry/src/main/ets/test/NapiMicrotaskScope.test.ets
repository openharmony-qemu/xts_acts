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

import { describe, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import napitest from 'libnapitest.so'

export default function napiMicrotaskScopeTest() {

  describe('napiMicrotaskScopeTest', () => {
    afterEach(async () => {
      console.info('[napiMicrotaskScopeTest] after each called')
    });

    /**
     * @tc.name   napiMicrotaskScopeTest001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_MICROTASKSCOPE_0100
     * @tc.desc   Test napi_open_microtask_scope and napi_close_microtask_scope basic behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiMicrotaskScopeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiMicrotaskScopeTest001";
      console.info(`${TAG} START`);
      try {
        let value = napitest.NapiMicrotaskScopeOpenBasic();
        console.info(`${TAG} result is: ` + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err}`);
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.name   napiMicrotaskScopeTest002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_MICROTASKSCOPE_0200
     * @tc.desc   Test napi_open/close_microtask_scope with null arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiMicrotaskScopeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiMicrotaskScopeTest002";
      console.info(`${TAG} START`);
      try {
        let value = napitest.NapiMicrotaskScopeNullArg();
        console.info(`${TAG} result is: ` + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err}`);
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.name   napiMicrotaskScopeTest003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_MICROTASKSCOPE_0300
     * @tc.desc   Test nested open of napi_open_microtask_scope is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiMicrotaskScopeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiMicrotaskScopeTest003";
      console.info(`${TAG} START`);
      try {
        let value = napitest.NapiMicrotaskScopeNestedOpen();
        console.info(`${TAG} result is: ` + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err}`);
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.name   napiMicrotaskScopeTest004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_MICROTASKSCOPE_0400
     * @tc.desc   Test napi_close_microtask_scope with mismatched handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiMicrotaskScopeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiMicrotaskScopeTest004";
      console.info(`${TAG} START`);
      try {
        let value = napitest.NapiMicrotaskScopeCloseMismatch();
        console.info(`${TAG} result is: ` + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err}`);
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.name   napiMicrotaskScopeTest005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_MICROTASKSCOPE_0500
     * @tc.desc   Test resolve with NULL deferred in scope, verify napi_invalid_arg and scope not broken
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiMicrotaskScopeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiMicrotaskScopeTest005";
      console.info(`${TAG} START`);
      try {
        let value = napitest.NapiMicrotaskScopeNullDeferred();
        console.info(`${TAG} result is: ` + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err}`);
        expect().assertFail();
      } finally {
        done();
      }
    });
  })
}
