'use static';
/*
* Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach} from "../../../hypium/index";
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import zlib from '@ohos.zlib'
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext;
let dir: string = "";

let testPathsToClean: string[] = [];

function removeTestPath(path: string): void {
  if (!fs.accessSync(path)) {
    return;
  }
  if (fs.statSync(path).isDirectory()) {
    let names: string[] = fs.listFileSync(path);
    names.forEach((name: string) => removeTestPath(path + '/' + name));
    fs.rmdirSync(path);
    return;
  }
  fs.unlinkSync(path);
}

function cleanUpKeepTopLevelFolderTestData(): void {
  for (let i = testPathsToClean.length - 1; i >= 0; i--) {
    removeTestPath(testPathsToClean[i]);
  }
  testPathsToClean = [];
}

export default function ActsZlibInterfaceTest() {
  describe('ActsZlibInterfaceTest', ():void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, tag, 'ActsZlibTest abilityDelegator success');
      let cmd = "aa start -a EntryAbility -b com.actszlibinterfacetest.test.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd);
      await Utils.msSleep(3000);
      let dirAll = AppStorage.get<string>("dir");
      if(dirAll) {
        dir = dirAll!;
      }
      hilog.info(domain, tag, 'ActsZlibTest dir: ' + dir);
      hilog.info(domain, tag, 'beforeAll end');
    });
    afterEach((): void => {
      cleanUpKeepTopLevelFolderTestData();
    });

    /**
     * @tc.name   ActsZlibInterfaceTest_static_01
     * @tc.number ACTS_ZlibInterfaceTest_static_01
     * @tc.desc   test getOriginalSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibInterfaceTest_static_01', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = 'ActsZlibInterfaceTest01';
      hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_01 start==================");
      let inFile33: string = dir;
      let outFile35: string = dir + '/test35.zip';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      };
      try {
        zlib.compressFile(inFile33, outFile35, options).then((): void => {
          hilog.info(domain, tag, 'getOriginalSize prepare test.zip success');
          try {
            zlib.getOriginalSize(outFile35).then((data: long): void => {
              hilog.info(domain, tag, `ActsZlibInterfaceTest_static_01 getOriginalSize success. getOriginalSize: ${data}`);
              expect(data >= 0).assertEqual(true);
              done();
              }).catch((errData: Error): void => {
                hilog.error(domain, tag,
                  `ACTS_ZlibInterfaceTest_static_01 getOriginalSize failed errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
              done();
            });
          } catch(errData) {
            hilog.error(domain, tag, `011 errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
          }
        }, (errData: Error): void => {
          hilog.error(domain, tag, `012 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
          done();
        })
      } catch(errData) {
        hilog.error(domain, tag, `013 errData is errCode:${errData.code}  message:${errData.message}`);
        expect(errData).assertFail();
        done();
      }
      hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_01 end==================");
    })

    /**
     * @tc.name   ACTS_ZlibInterfaceTest_static_03
     * @tc.number ACTS_ZlibInterfaceTest_static_03
     * @tc.desc   test getOriginalSize 900001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ACTS_ZlibInterfaceTest_static_03', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_03 start==================");
      let compressedFile: string = dir + '/not_found.zip';
      try {
        zlib.getOriginalSize(compressedFile).then((data: long): void => {
          hilog.info(domain, tag, `ACTS_ZlibInterfaceTest_static_03 getOriginalSize success. getOriginalSize: ${data}`);
          expect(data).assertFail();
          done();
        }).catch((errData: Error): void=> {
          hilog.info(domain, 'bmsTestTag',`015 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(900001);
          done();
        })
      } catch(errData) {
        hilog.error(domain, tag, `ACTS_ZlibInterfaceTest_static_03 errData is errCode:${errData.code}  message:${errData.message}`);
        expect(errData).assertFail();
        done();
      }
      hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_03 end==================");
    })

    /**
     * @tc.name   ACTS_ZlibInterfaceTest_static_04
     * @tc.number ACTS_ZlibInterfaceTest_static_04
     * @tc.desc   test getOriginalSize 900003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ACTS_ZlibInterfaceTest_static_04', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_04 start==================");
      let file = fs.openSync(dir + '/test33.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "test: Try to write str.");
      hilog.info(domain, tag, `test.txt: wirteLen ${writeLen}`);
      fs.closeSync(file);
      let compressedFile30: string = dir + '/test33.txt';
      try {
        zlib.getOriginalSize(compressedFile30).then((data: long): void => {
          hilog.info(domain, tag, `ACTS_ZlibInterfaceTest_static_04 getOriginalSize success. getOriginalSize: ${data}`);
          expect(data).assertFail();
          done();
        }).catch((errData: Error): void=> {
          hilog.info(domain, 'bmsTestTag', `016 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(900003);
          done();
        })
      } catch(errData) {
        hilog.error(domain, tag, `ACTS_ZlibInterfaceTest_static_04 errData is errCode:${errData.code}  message:${errData.message}`);
        expect(errData).assertFail();
        done();
      }
      hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_04 end==================");
    })

    /**
     * @tc.name   ActsZlibInterfaceTest_static_05
     * @tc.number ACTS_ZlibInterfaceTest_static_05
     * @tc.desc   test getOriginalSize compressFile empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsZlibInterfaceTest_static_05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_05 start==================");
        try {
          zlib.getOriginalSize("").then(() => {
            hilog.info(domain, tag, 'ActsZlibInterfaceTest_static_05 getOriginalSize success');
            expect().assertFail();
            done();
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `ACTS_ZlibInterfaceTest_static_05 getOriginalSize failed errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(900001);
            expect(errData.message).assertEqual("BusinessError 900001: The Input source file is invalid.");
            done();
          });
        } catch (err) {
          let errData = err as BusinessError;
          hilog.error(domain, tag,
            `ACTS_ZlibInterfaceTest_static_05 getOriginalSize failed errData is  errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
          done();
        }
        hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_05 end==================");
      })

    /**
     * @tc.name   ActsZlibInterfaceTest_static_06
     * @tc.number ACTS_ZlibInterfaceTest_static_06
     * @tc.desc   test compressFile with keepTopLevelFolder option set to true,
     *            verify that the top-level directory is preserved in the zip file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibInterfaceTest_static_06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        tag = 'ActsZlibInterfaceTest_static_06';
        hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_06 start==================");
        let sourceName: string = 'keepTopLevelFolderSource' + Date.now();
        let sourceDir: string = dir + '/' + sourceName;
        let sourceFile: string = sourceDir + '/test.txt';
        let zipFile: string = dir + '/' + sourceName + '.zip';
        let outputDir: string = dir + '/' + sourceName + 'Output';
        testPathsToClean.push(sourceDir, zipFile, outputDir);
        try {
          if (!fs.accessSync(sourceDir)) {
            fs.mkdirSync(sourceDir);
          }
          let file = fs.openSync(sourceFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'keep top-level folder');
          fs.closeSync(file);
          await zlib.compressFile(sourceDir, zipFile, { keepTopLevelFolder: true });
          fs.mkdirSync(outputDir);
          await zlib.decompressFile(zipFile, outputDir);
          expect(fs.accessSync(outputDir + '/' + sourceName + '/test.txt')).assertTrue();
        } catch (err) {
          let errData = err as BusinessError;
          hilog.error(domain, tag,
            `ActsZlibInterfaceTest_static_06 failed, errCode:${errData.code} message:${errData.message}`);
          expect(errData).assertFail();
        }
        hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_06 end==================");
        done();
      })

    /**
     * @tc.name   ActsZlibInterfaceTest_static_07
     * @tc.number ACTS_ZlibInterfaceTest_static_07
     * @tc.desc   test compressFile with keepTopLevelFolder option set to false,
     *            verify that the top-level directory is NOT preserved in the zip file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibInterfaceTest_static_07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        tag = 'ActsZlibInterfaceTest_static_07';
        hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_07 start==================");
        let sourceName: string = 'keepTopLevelFolderSourceFalse' + Date.now();
        let sourceDir: string = dir + '/' + sourceName;
        let sourceFile: string = sourceDir + '/test.txt';
        let zipFile: string = dir + '/' + sourceName + '.zip';
        let outputDir: string = dir + '/' + sourceName + 'Output';
        testPathsToClean.push(sourceDir, zipFile, outputDir);
        try {
          if (!fs.accessSync(sourceDir)) {
            fs.mkdirSync(sourceDir);
          }
          let file = fs.openSync(sourceFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'do not keep top-level folder');
          fs.closeSync(file);
          await zlib.compressFile(sourceDir, zipFile, { keepTopLevelFolder: false });
          fs.mkdirSync(outputDir);
          await zlib.decompressFile(zipFile, outputDir);
          // Verify that files are extracted directly under outputDir.
          expect(fs.accessSync(outputDir + '/test.txt')).assertTrue();
          // Verify that the top-level source directory is absent.
          expect(fs.accessSync(outputDir + '/' + sourceName)).assertFalse();
        } catch (err) {
          let errData = err as BusinessError;
          hilog.error(domain, tag,
            `ActsZlibInterfaceTest_static_07 failed, errCode:${errData.code} message:${errData.message}`);
          expect(errData).assertFail();
        }
        hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_07 end==================");
        done();
      })

    /**
     * @tc.name   ActsZlibInterfaceTest_static_08
     * @tc.number ACTS_ZlibInterfaceTest_static_08
     * @tc.desc   test compressFile without keepTopLevelFolder parameter (default behavior),
     *            verify the default behavior when keepTopLevelFolder is not specified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibInterfaceTest_static_08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        tag = 'ActsZlibInterfaceTest_static_08';
        hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_08 start==================");
        let sourceName: string = 'defaultBehavior' + Date.now();
        let sourceDir: string = dir + '/' + sourceName;
        let sourceFile: string = sourceDir + '/test.txt';
        let zipFile: string = dir + '/' + sourceName + '.zip';
        let outputDir: string = dir + '/' + sourceName + 'Output';
        testPathsToClean.push(sourceDir, zipFile, outputDir);
        try {
          if (!fs.accessSync(sourceDir)) {
            fs.mkdirSync(sourceDir);
          }
          let file = fs.openSync(sourceFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file.fd, 'default behavior test');
          fs.closeSync(file);
          // Do not specify keepTopLevelFolder; use its default value.
          let options: zlib.Options = {
            level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
            memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
            strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
          };
          await zlib.compressFile(sourceDir, zipFile, options);
          fs.mkdirSync(outputDir);
          await zlib.decompressFile(zipFile, outputDir);
          // The default value is false, so the top-level directory is not preserved.
          expect(fs.accessSync(outputDir + '/test.txt')).assertTrue();
          expect(fs.accessSync(outputDir + '/' + sourceName)).assertFalse();
        } catch (err) {
          let errData = err as BusinessError;
          hilog.error(domain, tag,
            `ActsZlibInterfaceTest_static_08 failed, errCode:${errData.code} message:${errData.message}`);
          expect(errData).assertFail();
        }
        hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_08 end==================");
        done();
      })

    /**
     * @tc.name   ActsZlibInterfaceTest_static_09
     * @tc.number ACTS_ZlibInterfaceTest_static_09
     * @tc.desc   test compressFile with keepTopLevelFolder true and multiple files,
     *            verify that all files are correctly preserved with top-level directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsZlibInterfaceTest_static_09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        tag = 'ActsZlibInterfaceTest_static_09';
        hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_09 start==================");
        let sourceName: string = 'multiFileTest' + Date.now();
        let sourceDir: string = dir + '/' + sourceName;
        let zipFile: string = dir + '/' + sourceName + '.zip';
        let outputDir: string = dir + '/' + sourceName + 'Output';
        testPathsToClean.push(sourceDir, zipFile, outputDir);
        try {
          if (!fs.accessSync(sourceDir)) {
            fs.mkdirSync(sourceDir);
          }
          // Create multiple files.
          for (let i = 1; i <= 3; i++) {
            let file = fs.openSync(sourceDir + '/test' + i + '.txt',
              fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
            fs.writeSync(file.fd, 'test file ' + i);
            fs.closeSync(file);
          }
          await zlib.compressFile(sourceDir, zipFile, { keepTopLevelFolder: true });
          fs.mkdirSync(outputDir);
          await zlib.decompressFile(zipFile, outputDir);
          // Verify that all files are preserved under the top-level directory.
          expect(fs.accessSync(outputDir + '/' + sourceName + '/test1.txt')).assertTrue();
          expect(fs.accessSync(outputDir + '/' + sourceName + '/test2.txt')).assertTrue();
          expect(fs.accessSync(outputDir + '/' + sourceName + '/test3.txt')).assertTrue();
        } catch (err) {
          let errData = err as BusinessError;
          hilog.error(domain, tag,
            `ActsZlibInterfaceTest_static_09 failed, errCode:${errData.code} message:${errData.message}`);
          expect(errData).assertFail();
        }
        hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_09 end==================");
        done();
      })

    /**
     * @tc.name   ActsZlibInterfaceTest_static_10
     * @tc.number ACTS_ZlibInterfaceTest_static_10
     * @tc.desc   test compressFile with keepTopLevelFolder true and nested directories,
     *            verify that nested directory structure is correctly preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsZlibInterfaceTest_static_10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        tag = 'ActsZlibInterfaceTest_static_10';
        hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_10 start==================");
        let sourceName: string = 'nestedDirTest' + Date.now();
        let sourceDir: string = dir + '/' + sourceName;
        let subDir: string = sourceDir + '/subdir';
        let zipFile: string = dir + '/' + sourceName + '.zip';
        let outputDir: string = dir + '/' + sourceName + 'Output';
        testPathsToClean.push(sourceDir, zipFile, outputDir);
        try {
          if (!fs.accessSync(sourceDir)) {
            fs.mkdirSync(sourceDir);
          }
          if (!fs.accessSync(subDir)) {
            fs.mkdirSync(subDir);
          }
          // Create files at different directory levels.
          let file1 = fs.openSync(sourceDir + '/root.txt',
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file1.fd, 'root file');
          fs.closeSync(file1);

          let file2 = fs.openSync(subDir + '/sub.txt',
            fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(file2.fd, 'sub file');
          fs.closeSync(file2);

          await zlib.compressFile(sourceDir, zipFile, { keepTopLevelFolder: true });
          fs.mkdirSync(outputDir);
          await zlib.decompressFile(zipFile, outputDir);
          // Verify that the nested directory structure is preserved.
          expect(fs.accessSync(outputDir + '/' + sourceName + '/root.txt')).assertTrue();
          expect(fs.accessSync(outputDir + '/' + sourceName + '/subdir/sub.txt')).assertTrue();
        } catch (err) {
          let errData = err as BusinessError;
          hilog.error(domain, tag,
            `ActsZlibInterfaceTest_static_10 failed, errCode:${errData.code} message:${errData.message}`);
          expect(errData).assertFail();
        }
        hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_10 end==================");
        done();
      })

    /**
     * @tc.name   ActsZlibInterfaceTest_static_11
     * @tc.number ACTS_ZlibInterfaceTest_static_11
     * @tc.desc   test compressFiles with keepTopLevelFolder true and preserve every source directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsZlibInterfaceTest_static_11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        tag = 'ActsZlibInterfaceTest_static_11';
        hilog.info(domain, tag,
          "==================ACTS_ZlibInterfaceTest_static_11 start==================");
        let testName: string = 'compressFilesKeepTopLevel' + Date.now();
        let firstName: string = testName + 'First';
        let secondName: string = testName + 'Second';
        let firstDir: string = dir + '/' + firstName;
        let secondDir: string = dir + '/' + secondName;
        let zipFile: string = dir + '/' + testName + '.zip';
        let outputDir: string = dir + '/' + testName + 'Output';
        testPathsToClean.push(firstDir, secondDir, zipFile, outputDir);
        try {
          fs.mkdirSync(firstDir);
          fs.mkdirSync(secondDir);
          let firstFile = fs.openSync(firstDir + '/first.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(firstFile.fd, 'first source directory');
          fs.closeSync(firstFile);
          let secondFile = fs.openSync(secondDir + '/second.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
          fs.writeSync(secondFile.fd, 'second source directory');
          fs.closeSync(secondFile);
          await zlib.compressFiles([firstDir, secondDir], zipFile, { keepTopLevelFolder: true });
          fs.mkdirSync(outputDir);
          await zlib.decompressFile(zipFile, outputDir);
          expect(fs.accessSync(outputDir + '/' + firstName + '/first.txt')).assertTrue();
          expect(fs.accessSync(outputDir + '/' + secondName + '/second.txt')).assertTrue();
          expect(fs.accessSync(outputDir + '/first.txt')).assertFalse();
          expect(fs.accessSync(outputDir + '/second.txt')).assertFalse();
        } catch (err) {
          let errData = err as BusinessError;
          hilog.error(domain, tag,
            `ActsZlibInterfaceTest_static_11 failed, errCode:${errData.code} message:${errData.message}`);
          expect(errData).assertFail();
        }
        hilog.info(domain, tag,
          "==================ACTS_ZlibInterfaceTest_static_11 end==================");
        done();
      })
  })
}
