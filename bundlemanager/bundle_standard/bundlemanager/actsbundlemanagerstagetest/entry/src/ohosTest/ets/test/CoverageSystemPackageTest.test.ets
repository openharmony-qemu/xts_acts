/**
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

import pkg from '@system.package';
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium";

const BUNDLE_NAME = "ohos.acts.bundle.stage.test";
const NOT_INSTALLED_BUNDLE_NAME = "com.example.not.installed.bundle";

interface CheckPackageHasInstalledResponse {
  result: boolean;
}

export default function coverageSystemPackageTest() {
  describe('CoverageSystemPackageTest', () => {
    it('SUB_BMS_COVERAGE_systemPackage_hasInstalled_self', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let flag = 0;
        pkg.hasInstalled({
          bundleName: BUNDLE_NAME,
          success: (data: CheckPackageHasInstalledResponse) => {
            console.info('SUB_BMS_COVERAGE_systemPackage_hasInstalled_self success: result=' + data.result);
            expect(typeof data.result).assertEqual('boolean');
            expect(data.result).assertTrue();
            flag += 1;
          },
          fail: (data: string, code: number) => {
            console.info('SUB_BMS_COVERAGE_systemPackage_hasInstalled_self fail: ' + data + ' code=' + code);
            expect().assertFail();
          },
          complete: () => {
            expect(flag).assertEqual(1);
            done();
          }
        });
      });

    it('SUB_BMS_COVERAGE_systemPackage_hasInstalled_other', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let flag = 0;
        pkg.hasInstalled({
          bundleName: NOT_INSTALLED_BUNDLE_NAME,
          success: (data: CheckPackageHasInstalledResponse) => {
            console.info('SUB_BMS_COVERAGE_systemPackage_hasInstalled_other success: result=' + data.result);
            expect(typeof data.result).assertEqual('boolean');
            expect(data.result).assertFalse();
            flag += 1;
          },
          fail: (data: string, code: number) => {
            console.info('SUB_BMS_COVERAGE_systemPackage_hasInstalled_other fail: ' + data + ' code=' + code);
            expect().assertFail();
          },
          complete: () => {
            expect(flag).assertEqual(1);
            done();
          }
        });
      });
  });
}
