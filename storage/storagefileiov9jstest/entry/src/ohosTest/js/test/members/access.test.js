/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum, describe, it, expect,
} from '../Common';
import { TestType, Size, Level } from '@ohos/hypium';

export default function fileIOAccess() {
describe('fileIO_fs_access', function () {

    /**
     * @tc.name   test_FileIO_Access_Sync_000
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0000
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_000', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        expect(fileIO.accessSync(fpath)).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_001
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0100
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_001', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_001');

      try {
        let ret = fileIO.accessSync(fpath);
        expect(ret === false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_002
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0200
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_002', Level.LEVEL0, async function () {

      try {
        expect(fileIO.accessSync(-1)).assertTrue();
        expect(false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
      * @tc.name   test_FileIO_Access_Sync_003
      * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0300
      * @tc.desc   Test accessSync() interface.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('test_FileIO_Access_Sync_003', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.EXIST);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_004
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0400
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_004', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_004');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.WRITE);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_004 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_005
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0500
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_005', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_005');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.READ);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_005 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_006
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0600
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_006', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_006');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.READ_WRITE);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_006 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_007
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0700
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_007', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_007');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.EXIST, fileIO.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_007 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_008
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0800
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_008', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_008');
      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.EXIST, fileIO.AccessFlagType.LOCAL);
        expect(ret === false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_008 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_009
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0900
     * @tc.desc   Test accessSync() interface. Path is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_009', Level.LEVEL0, async function () {

      try {
        fileIO.accessSync(undefined, fileIO.AccessModeType.WRITE);
        expect(false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_009 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_010
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1000
     * @tc.desc   Test accessSync() interface. Path is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_010', Level.LEVEL0, async function () {

      try {
        fileIO.accessSync(null, fileIO.AccessModeType.READ);
        expect(false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_010 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_014
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1400
     * @tc.desc   Test accessSync() interface. Path is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

      try {
        let res = fileIO.accessSync("");
        if (res) {
          console.log('test_FileIO_Access_Sync_014 file exists');
        } else {
          console.log('test_FileIO_Access_Sync_014 file not exists');
          expect(res === false).assertTrue();
        }
      } catch (e) {
        console.log('test_FileIO_Access_Sync_014 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_015
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1500
     * @tc.desc   Test accessSync() interface. Path is null without mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

      try {
        fileIO.accessSync(null);
        expect(false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_015 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code).assertEqual(13900020);
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_016
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1600
     * @tc.desc   Test accessSync() interface. Path is undefined without mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_016', TestType.FUNCTION | Size.MEDIUMTEST | TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

      try {
        fileIO.accessSync(undefined);
        expect(false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_016 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code).assertEqual(13900020);
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_011
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1100
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_011', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_011');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.READ, fileIO.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_011 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_012
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1200
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_012', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_012');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.WRITE, fileIO.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_012 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_013
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1300
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_013', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_013');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.READ_WRITE, fileIO.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_013 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_017
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1700
     * @tc.desc   Test accessSync() interface with 3 params. Path is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

      try {
        let res = fileIO.accessSync("", fileIO.AccessModeType.EXIST, fileIO.AccessFlagType.LOCAL);
        expect(res === false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_017 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_018
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1800
     * @tc.desc   Test accessSync() interface with 3 params. Path is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

      try {
        fileIO.accessSync(null, fileIO.AccessModeType.READ, fileIO.AccessFlagType.LOCAL);
        expect(false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_018 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code).assertEqual(13900020);
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_019
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1900
     * @tc.desc   Test accessSync() interface with 3 params. Path is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

      try {
        fileIO.accessSync(undefined, fileIO.AccessModeType.WRITE, fileIO.AccessFlagType.LOCAL);
        expect(false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_019 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code).assertEqual(13900020);
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_000
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0000
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_000', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = await fileIO.access(fpath);
        expect(ret === true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_001
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0100
     * @tc.desc   Test access() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_001', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.access(fpath, (err, ret) => {
          if (err) {
            console.log('test_FileIO_Access_Async_001 error package: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(ret === true).assertTrue();
          let file = fileIO.openSync(fpath);
          expect(isIntNum(file.fd)).assertTrue();
          let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
          expect(readlen == FILE_CONTENT.length).assertTrue();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
        });
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_002
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0200
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_002', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_002');

      try {
        let ret = await fileIO.access(fpath);
        expect(ret === false).assertTrue();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_003
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0300
     * @tc.desc   Test access() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_003', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_003');

      try {
        fileIO.access(fpath, (err, ret) => {
          if (err) {
            console.log('test_FileIO_Access_Async_003 error package: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(ret === false).assertTrue();
          done();
        });
      } catch (e) {
        console.log('test_FileIO_Access_Async_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_004
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0400
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_004', Level.LEVEL0, async function (done) {

      try {
        await fileIO.access(-1);
        expect(false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Async_004 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_005
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0500
     * @tc.desc   Test access() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_005', Level.LEVEL0, async function (done) {

      try {
        fileIO.access(-1, (err) => {
          expect(false).assertTrue();
        });
      } catch (e) {
        console.log('test_FileIO_Access_Async_005 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
  
    /**
      * @tc.name   test_FileIO_Access_Async_006
      * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0600
      * @tc.desc   Test access() interface. Promise.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('test_FileIO_Access_Async_006', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_006');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = await fileIO.access(fpath, fileIO.AccessModeType.EXIST);
        expect(ret === true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_006 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_007
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0700
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_007', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_007');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = await fileIO.access(fpath, fileIO.AccessModeType.WRITE);
        expect(ret === true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_007 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_008
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0800
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_008', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_008');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = await fileIO.access(fpath, fileIO.AccessModeType.READ);
        expect(ret === true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_008 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_009
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0900
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_009', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_009');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = await fileIO.access(fpath, fileIO.AccessModeType.READ_WRITE);
        expect(ret === true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_009 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_010
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1000
     * @tc.desc   Test access() interface. Promise. Path is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_010', Level.LEVEL0, async function (done) {

      try {
        await fileIO.access(null, fileIO.AccessModeType.EXIST);
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_010 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_011
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1100
     * @tc.desc   Test access() interface. Promise. Path is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_011', Level.LEVEL0, async function (done) {

      try {
        await fileIO.access(undefined, fileIO.AccessModeType.READ_WRITE);
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_011 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_012
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1200
     * @tc.desc   Test access() interface. Callback. Path is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_012', Level.LEVEL0, async function (done) {

      try {
        fileIO.access(null, (err) => {
          expect(false).assertTrue();
        });
      } catch (e) {
        console.log('test_FileIO_Access_Async_012 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_013
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1300
     * @tc.desc   Test access() interface. Callback. Path is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_013', Level.LEVEL0, async function (done) {

      try {
        fileIO.access(undefined, (err) => {
          expect(false).assertTrue();
        });
      } catch (e) {
        console.log('test_FileIO_Access_Async_013 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    /**
     * @tc.name   test_FileIO_Access_Async_014
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1400
     * @tc.desc   Test access() interface. Promise. Path is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

      try {
        let res = await fileIO.access("");
        expect(res === false).assertTrue();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_014 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_015
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1500
     * @tc.desc   Test access() interface. Promise. Path is null without mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

      try {
        await fileIO.access(null);
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_015 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_016
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1600
     * @tc.desc   Test access() interface. Promise. Path is undefined without mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

      try {
        await fileIO.access(undefined);
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_016 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_017
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1700
     * @tc.desc   Test access() interface. Callback. Path is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

      try {
        fileIO.access("", (err, res) => {
          if (err) {
            console.log('test_FileIO_Access_Async_017 error ' + err);
            done();
          }
          console.log('test_FileIO_Access_Async_017 res ' + res);
          expect(res === false).assertTrue();
          done();
        });
      } catch (e) {
        console.log('test_FileIO_Access_Async_017 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_018
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1800
     * @tc.desc   Test access() interface. Promise. mode is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>test_FileIO_Access_Async_018 start====");
      try {
        let res = await fileIO.access("", null);
        console.log('test_FileIO_Access_Async_018 access success: ' + res);
        expect().assertFail();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_018 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_019
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1900
     * @tc.desc   Test access() interface. Promise. mode is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let res = await fileIO.access("", undefined);
        console.log('test_FileIO_Access_Async_019 access success: ' + res);
        expect().assertFail();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_019 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_020
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_2000
     * @tc.desc   Test access() interface. Promise. mode=1 (out of AccessModeType range).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        await fileIO.access("", 1);
        expect().assertFail();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_020 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_021
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_2100
     * @tc.desc   Test access() interface. Promise. mode=3 (out of AccessModeType range).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        await fileIO.access("", 3);
        expect().assertFail();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_021 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_022
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_2200
     * @tc.desc   Test access() interface. Promise. mode=-1 (negative, out of AccessModeType range).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        await fileIO.access("", -1);
        expect().assertFail();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_022 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_020
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_2000
     * @tc.desc   Test accessSync() interface. mode is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let ret = fileIO.accessSync("", null);
        console.log('test_FileIO_Access_Sync_020 access success: ' + ret);
        expect(typeof ret == 'boolean').assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_020 has failed for ' + e.message + ', code: ' + e.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_021
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_2100
     * @tc.desc   Test accessSync() interface. mode is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let ret = fileIO.accessSync("", undefined);
        console.log('test_FileIO_Access_Sync_021 access success: ' + ret);
        expect(typeof ret == 'boolean').assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_021 has failed for ' + e.message + ', code: ' + e.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_022
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_2200
     * @tc.desc   Test accessSync() interface. mode=1 (out of AccessModeType range).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let ret = fileIO.accessSync("", 1);
        expect().assertFail();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_022 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_023
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_2300
     * @tc.desc   Test accessSync() interface. mode=5 (out of AccessModeType range).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let ret = fileIO.accessSync("", 5);
        expect().assertFail();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_023 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_024
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_2400
     * @tc.desc   Test accessSync() interface. mode=-1 (negative, out of AccessModeType range).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let ret = fileIO.accessSync("", -1);
        expect().assertFail();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_024 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_025
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_2500
     * @tc.desc   Test accessSync(path, mode, flag) interface. mode is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let ret = fileIO.accessSync("", null, fileIO.AccessFlagType.LOCAL);
        expect(ret).assertFalse();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_025 has failed for ' + e.message + ', code: ' + e.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_026
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_2600
     * @tc.desc   Test accessSync(path, mode, flag) interface. mode is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let ret = fileIO.accessSync("", undefined, fileIO.AccessFlagType.LOCAL);
        expect(ret).assertFalse();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_026 has failed for ' + e.message + ', code: ' + e.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_027
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_2700
     * @tc.desc   Test accessSync(path, mode, flag) interface. flag is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let ret = fileIO.accessSync("", fileIO.AccessModeType.EXIST, null);
        expect().assertFail();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_027 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_028
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_2800
     * @tc.desc   Test accessSync(path, mode, flag) interface. flag is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let ret = fileIO.accessSync("", fileIO.AccessModeType.EXIST, undefined);
        expect(ret).assertFalse();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_028 has failed for ' + e.message + ', code: ' + e.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_029
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_2900
     * @tc.desc   Test accessSync(path, mode, flag) interface. mode=1 (out of AccessModeType range).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let ret = fileIO.accessSync("", 1, fileIO.AccessFlagType.LOCAL);
        expect().assertFail();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_029 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_030
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_3000
     * @tc.desc   Test accessSync(path, mode, flag) interface. flag=1 (out of AccessFlagType range).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let ret = fileIO.accessSync("", fileIO.AccessModeType.EXIST, 30);
        expect(typeof ret == "boolean").assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_030 has failed for ' + e.message + ', code: ' + e.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_031
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_3100
     * @tc.desc   Test accessSync(path, mode, flag) interface. mode=-1 and flag=2 (both out of range).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let ret = fileIO.accessSync("", -1, 2);
        expect().assertFail();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_031 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
      done();
    });
  });
}