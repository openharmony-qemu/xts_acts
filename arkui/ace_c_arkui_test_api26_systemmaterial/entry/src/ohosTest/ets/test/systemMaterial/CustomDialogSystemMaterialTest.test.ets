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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so';

function runCase(name: string, done: Function): void {
  expect(nativeFunc[name]()).assertEqual(0);
  done();
}

export default function customDialogSystemMaterialTest() {
  describe('CustomDialogSystemMaterialTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    const dialogCases = [
      'testCustomDialogSetSystemMaterial001',
      'testCustomDialogSetSystemMaterial002',
      'testCustomDialogSetSystemMaterial003',
      'testCustomDialogSetSystemMaterial004',
      'testCustomDialogSetSystemMaterial005',
      'testCustomDialogSetSystemMaterial006',
      'testCustomDialogSetSystemMaterial007',
    ];

    const optionsCases = [
      'testCustomDialogSetSystemMaterialInOptions001',
      'testCustomDialogSetSystemMaterialInOptions002',
      'testCustomDialogSetSystemMaterialInOptions003',
      'testCustomDialogSetSystemMaterialInOptions004',
      'testCustomDialogSetSystemMaterialInOptions005',
      'testCustomDialogSetSystemMaterialInOptions006',
      'testCustomDialogSetSystemMaterialInOptions007',
    ];

    dialogCases.forEach((caseName: string) => {
      it(caseName, Level.LEVEL1, async (done: Function) => {
        runCase(caseName, done);
      });
    });

    optionsCases.forEach((caseName: string) => {
      it(caseName, Level.LEVEL1, async (done: Function) => {
        runCase(caseName, done);
      });
    });
  });
}
