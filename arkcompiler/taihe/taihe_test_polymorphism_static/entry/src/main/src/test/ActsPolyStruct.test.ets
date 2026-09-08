'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import {BusinessError} from '@ohos.base';
import * as poly from '../ets/poly';

export default function polyStructTest(): void {
  describe("ActsPolyStructTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Poly_StructPerson_STATIC_0100
     * @tc.name      test_introduce_person
     * @tc.desc      Test introduceYourself with PersonType variants
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_introduce_person", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_introduce_person start');
      let unknownPer = poly.getPerson(poly.PersonTag.PERSON, "Mike", 18);
      let workerPer = poly.getPerson(poly.PersonTag.WORKER, "Tom", 30);
      let studentPer = poly.getPerson(poly.PersonTag.STUDENT, "jimmy", 20);
      expect(poly.introduceYourself(unknownPer)).assertEqual("Unknown Person");
      expect(poly.introduceYourself(workerPer)).assertEqual("Worker");
      expect(poly.introduceYourself(studentPer)).assertEqual("Student");
      console.log('test_introduce_person done');
      done();
      console.log('test_introduce_person end');

    });
  });
}