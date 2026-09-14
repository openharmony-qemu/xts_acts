/**
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import {
  fileIO, FILE_CONTENT, prepareFile, nextFileName, 
  describe, it, expect,
} from '../Common';
import { TestType, Size, Level } from '@ohos/hypium';

export default function fileIOLseek1() {
describe('fileIO_fs_lseek1', function () {

  /**
   * @tc.name   fileIO_test_lseek_020
   * @tc.number SUB_DF_FILEIO_LSEEK_SYNC_2000
   * @tc.desc   Test lseek() interface. Whence is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_lseek_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      fileIO.lseek(0, 5, null);
      console.log('fileIO_test_lseek_020 success');
    } catch (e) {
      console.log('fileIO_test_lseek_020 has failed for ' + e.message + ', code: ' + e.code);
      expect().assertFail();
    }
    done();
  });
})
}