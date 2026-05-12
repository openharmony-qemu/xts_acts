/*
* Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

const coroutine0 = (): Promise<number> => {
  return new Promise<number>((resolve: (p: number) => void) => {
    setTimeout(() => {
      resolve(10);
    }, 100);
  });
};

const coroutineOther0 = (): Promise<number> => {
  return new Promise<number>((resolve: (p: number) => void) => {
    setTimeout(() => {
      resolve(20);
    }, 100);
  });
};

export default function ProgramEntryPointTest(): void {
  describe('ProgramEntryPointTest', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await sleep(30);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })

    /**
     * @tc.number    SUB_PROGRAM_ENTRY_POINT_0100
     * @tc.name      testProgramEntryPoint0001
     * @tc.desc      The program terminated due to the normal termination of the coroutine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProgramEntryPoint0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let result1 = await coroutine0();
      expect(result1).assertEqual(10);
    });

    /**
     * @tc.number    SUB_PROGRAM_ENTRY_POINT_0200
     * @tc.name      testProgramEntryPoint0002
     * @tc.desc      The program terminated due to the normal termination of multiple coroutines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProgramEntryPoint0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let result1 = await coroutine0();
      let result2 = await coroutineOther0();
      expect(result1).assertEqual(10);
      expect(result2).assertEqual(20);
    });

  })
}
