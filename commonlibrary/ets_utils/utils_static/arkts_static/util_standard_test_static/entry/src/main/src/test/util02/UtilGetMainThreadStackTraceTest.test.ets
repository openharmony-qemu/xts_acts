'use static';

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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from "@ohos/hypium-static/src/main/indexStatic";
import util from "@ohos.util";
import Utils from "../Util.test";

class StackHolder {
  count: int = 0;
  sample(): string {
    this.count++;
    return util.getMainThreadStackTrace();
  }
}

export default function utilGetMainThreadStackTraceTest(): void {
  describe("UtilGetMainThreadStackTraceTest", (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_MAIN_THREAD_STACK_TRACE_0100
     * @tc.name testUtilGetMainThreadStackTraceTest001
     * @tc.desc Verify getMainThreadStackTrace returns a string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetMainThreadStackTraceTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stack: string = util.getMainThreadStackTrace();
      let actualValue: string = typeof stack;
      let expectedValue: string = "string";
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_MAIN_THREAD_STACK_TRACE_0200
     * @tc.name testUtilGetMainThreadStackTraceTest002
     * @tc.desc Verify frame count is within [1, 64]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetMainThreadStackTraceTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stack: string = util.getMainThreadStackTrace();
      let frames: string[] = stack.split("\n");
      expect(frames.length).assertLargerOrEqual(1);
      expect(frames.length).assertLessOrEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_MAIN_THREAD_STACK_TRACE_0300
     * @tc.name testUtilGetMainThreadStackTraceTest003
     * @tc.desc Verify each frame line is a string and split/join round-trip preserves the stack
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetMainThreadStackTraceTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stack: string = util.getMainThreadStackTrace();
      let frames: string[] = stack.split("\n");
      for (let i = 0; i < frames.length; i++) {
        let actualValue: string = typeof frames[i];
        let expectedValue: string = "string";
        expect(actualValue).assertEqual(expectedValue);
      }
      let rebuilt: string = frames.join("\n");
      expect(rebuilt).assertEqual(stack);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_MAIN_THREAD_STACK_TRACE_0400
     * @tc.name testUtilGetMainThreadStackTraceTest004
     * @tc.desc Verify prefix concatenation keeps the prefix at index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetMainThreadStackTraceTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stack: string = util.getMainThreadStackTrace();
      let prefixes: string[] = ["prefix-", "stack="];
      for (let i = 0; i < prefixes.length; i++) {
        let joined: string = prefixes[i] + stack;
        let actualValue: int = joined.indexOf(prefixes[i]);
        let expectedValue: int = 0;
        expect(actualValue).assertEqual(expectedValue);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_MAIN_THREAD_STACK_TRACE_0500
     * @tc.name testUtilGetMainThreadStackTraceTest005
     * @tc.desc Verify the stack string is usable as a Map key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetMainThreadStackTraceTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, string> = new Map<string, string>();
      let stack: string = util.getMainThreadStackTrace();
      map.set(stack, "meta");
      let actualValue: boolean = map.has(stack);
      expect(actualValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_MAIN_THREAD_STACK_TRACE_0600
     * @tc.name testUtilGetMainThreadStackTraceTest006
     * @tc.desc Verify deeper call stack yields no fewer frames than shallow and StackHolder.sample increments count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetMainThreadStackTraceTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const traceShallow = (): string => {
        return util.getMainThreadStackTrace();
      };
      const traceDeep = (): string => {
        return traceShallow();
      };
      let shallowFrames: string[] = traceShallow().split("\n");
      let deepFrames: string[] = traceDeep().split("\n");
      expect(deepFrames.length).assertLargerOrEqual(shallowFrames.length);

      let holder: StackHolder = new StackHolder();
      let holderStack: string = holder.sample();
      let actualCount: number = holder.count;
      let expectedCount: int = 1;
      expect(actualCount).assertEqual(expectedCount);
      let actualType: string = typeof holderStack;
      let expectedType: string = "string";
      expect(actualType).assertEqual(expectedType);
    });

  });
}
