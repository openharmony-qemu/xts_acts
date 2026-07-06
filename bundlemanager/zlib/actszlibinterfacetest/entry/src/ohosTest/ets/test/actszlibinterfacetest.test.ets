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
import zlib from '@ohos.zlib'
import fs, { ReadOptions } from '@ohos.file.fs';
import { describe, it, expect, beforeAll, afterEach, TestType, Size, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base'

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
 describe('ActsZlibInterfaceTest', () => {

    let filesDir = "/data/storage/el2/base/files";
    afterEach(() => {
        cleanUpKeepTopLevelFolderTestData();
    });

    beforeAll(() => {
        // 创建一个文件
        let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let writeLen = fs.writeSync(file.fd, "test: Try to write str.");
        console.info(`test.txt: wirteLen ${writeLen}`);
        fs.closeSync(file);
        // 创建一个文件
        let file2 = fs.openSync(filesDir + '/test2.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        writeLen = fs.writeSync(file2.fd, "test2: Try to write str.");
        console.info(`test2.txt: wirteLen ${writeLen}`);
        fs.closeSync(file2);
        //创建一个文件夹
        let dirPath = filesDir + "/testDir";
        fs.mkdir(dirPath).then(() => {
            console.info("mkdir succeed");
            let file3 = fs.openSync(filesDir + '/test3.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            writeLen = fs.writeSync(file3.fd, "test3: Try to write str.");
            console.info(`test3.txt: wirteLen ${writeLen}`);
            fs.closeSync(file3);
        }).catch((err: BusinessError) => {
            console.error("mkdir failed with error message: " + err.message + ", error code: " + err.code);
        });
    })

    /**
     * @tc.name   ActsZlibInterfaceTest01
     * @tc.number ACTS_ZlibInterfaceTest_01
     * @tc.desc   test getOriginalSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibInterfaceTest01', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_01 start==================");
        let inFile = filesDir + '/test.txt';
        let outFile = filesDir + '/test.zip';
        let options: zlib.Options = {
            level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
            memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
            strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
        };
        try {
            zlib.compressFile(inFile, outFile, options).then((data: void) => {
                console.info('getOriginalSize prepare test.zip success. data: ' + JSON.stringify(data));
                try {
                    zlib.getOriginalSize(outFile).then((data: number) => {
                        console.info(`getOriginalSize success. getOriginalSize: ${data}`);
                        expect(data).assertLarger(0);
                        done();
                    }).catch((errData: BusinessError) => {
                        console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                        expect(errData).assertFail();
                        done();
                    })
                } catch(errData) {
                    console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                    expect(errData).assertFail();
                    done();
                }
            }).catch((errData: BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
                done();
            })
        } catch(errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        }
        console.info("==================ACTS_ZlibInterfaceTest_01 end==================");
    })

     /**
      * @tc.name   ActsZlibInterfaceTest02
      * @tc.number ACTS_ZlibInterfaceTest_02
      * @tc.desc   test getOriginalSize 401
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('ActsZlibInterfaceTest02', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
         console.info("==================ACTS_ZlibInterfaceTest_02 start==================");
         try {
             zlib.getOriginalSize(null).then((data: number) => {
                 console.info(`getOriginalSize success. getOriginalSize: ${data}`);
                 expect().assertFail();
             }).catch((errData: BusinessError) => {
                 console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                 expect().assertFail();
             })
         } catch(errData) {
             console.error(`ActsZlibInterfaceTest02 is errCode:${errData.code}  message:${errData.message}`);
             expect(errData.code).assertEqual(401);
         }
        try {
             zlib.getOriginalSize(undefined).then((data: number) => {
                 console.info(`getOriginalSize success. getOriginalSize: ${data}`);
                 expect().assertFail();
                 done();
             }).catch((errData: BusinessError) => {
                 console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                 expect().assertFail();
                 done();
             })
         } catch(errData) {
             console.error(`ActsZlibInterfaceTest02 is errCode:${errData.code}  message:${errData.message}`);
             expect(errData.code).assertEqual(401);
             done();
         }
         console.info("==================ACTS_ZlibInterfaceTest_02 end==================");
     })

    /**
     * @tc.name   ActsZlibInterfaceTest02_1
     * @tc.number ACTS_ZlibInterfaceTest_02_1
     * @tc.desc   test getOriginalSize empty string 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsZlibInterfaceTest02_1', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_02_1 start==================");
        try {
            zlib.getOriginalSize("").then((data: number) => {
                console.info(`getOriginalSize success. getOriginalSize: ${data}`);
                expect().assertFail();
                done();
            }).catch((errData: BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(900001);
                expect(errData.message).assertEqual("BusinessError 900001: The Input source file is invalid.");
                done();
            })
        } catch(errData) {
            console.error(`ActsZlibInterfaceTest02_1 is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ActsZlibInterfaceTest03
     * @tc.number ACTS_ZlibInterfaceTest_03
     * @tc.desc   test getOriginalSize 900001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsZlibInterfaceTest03', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_03 start==================");
        let compressedFile = filesDir + '/not_found.zip';
        try {
            zlib.getOriginalSize(compressedFile).then((data: number) => {
                console.info(`getOriginalSize success. getOriginalSize: ${data}`);
                expect(data).assertLarger(0);
                done();
            }).catch((errData: BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(900001);
                done();
            })
        } catch(errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        }
        console.info("==================ACTS_ZlibInterfaceTest_03 end==================");
    })

    /**
     * @tc.name   ActsZlibInterfaceTest04
     * @tc.number ACTS_ZlibInterfaceTest_04
     * @tc.desc   test getOriginalSize 900003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsZlibInterfaceTest04', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_04 start==================");
        let compressedFile = filesDir + '/test.txt';
        try {
            zlib.getOriginalSize(compressedFile).then((data: number) => {
                console.info(`getOriginalSize success. getOriginalSize: ${data}`);
                expect(data).assertLarger(0);
                done();
            }).catch((errData: BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(900003);
                done();
            })
        } catch(errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        }
        console.info("==================ACTS_ZlibInterfaceTest_04 end==================");
    })

    /**
     * @tc.name   ActsZlibInterfaceTest05
     * @tc.number ACTS_ZlibInterfaceTest_05
     * @tc.desc   test compressFiles
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibInterfaceTest05', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_05 start==================");
        let inFile = filesDir + '/test.txt';
        let inFile2 = filesDir + '/test2.txt';
        let inFile3 = filesDir + '/testDir';
        let outFile = filesDir + '/test05.zip';
        let options: zlib.Options = {
            level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
            memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
            strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
        };
        try {
            zlib.compressFiles([inFile, inFile2, inFile3], outFile, options).then((data: void) => {
                console.info('compressFiles success. data: ' + JSON.stringify(data));
                expect(data).assertEqual(null);
                done();
            }).catch((errData: BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
                done();
            })
        } catch(errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        }
        console.info("==================ACTS_ZlibInterfaceTest_05 end==================");
    })

    /**
     * @tc.name   ActsZlibInterfaceTest06
     * @tc.number ACTS_ZlibInterfaceTest_06
     * @tc.desc   test compressFiles 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('ActsZlibInterfaceTest06', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
    //     console.info("==================ACTS_ZlibInterfaceTest_06 start==================");
    //     let options: zlib.Options = {
    //         level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
    //         memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
    //         strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
    //     };
    //     try {
    //         zlib.compressFiles(1, 2, options).then((data: void) => {
    //             console.info('compressFiles success. data: ' + JSON.stringify(data));
    //             expect(data).assertEqual(null);
    //             done();
    //         }).catch((errData: BusinessError) => {
    //             console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
    //             expect(errData.code).assertFail();
    //             done();
    //         })
    //     } catch(errData) {
    //         console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
    //         expect(errData.code).assertEqual(401);
    //         done();
    //     }
    //     console.info("==================ACTS_ZlibInterfaceTest_06 end==================");
    // })

    /**
     * @tc.name   ActsZlibInterfaceTest07
     * @tc.number ACTS_ZlibInterfaceTest_07
     * @tc.desc   test compressFiles 900001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsZlibInterfaceTest07', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_07 start==================");
        let inFile = filesDir + '/not_found.txt';
        let inFile2 = filesDir + '/not_found2.txt';
        let inFile3 = filesDir + '/not_found';
        let outFile = filesDir + '/test07.zip';
        let options: zlib.Options = {
            level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
            memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
            strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
        };
        try {
            zlib.compressFiles([inFile, inFile2, inFile3], outFile, options).then((data: void) => {
                console.info('compressFiles success. data: ' + JSON.stringify(data));
                expect(data).assertEqual(null);
                done();
            }).catch((errData: BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(900001);
                done();
            })
        } catch(errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
        }
        console.info("==================ACTS_ZlibInterfaceTest_07 end==================");
    })

    /**
     * @tc.name   ActsZlibInterfaceTest08
     * @tc.number ACTS_ZlibInterfaceTest_08
     * @tc.desc   test compressFiles 900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsZlibInterfaceTest08', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_08 start==================");
        let inFile = filesDir + '/test.txt';
        let inFile2 = filesDir + '/test2.txt';
        let inFile3 = filesDir + '/testDir';
        let outFile = filesDir + '/notfound/test05.zip';
        let options: zlib.Options = {
            level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
            memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
            strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
        };
        console.info(`outFile: ${outFile}`);
        try {
            zlib.compressFiles([inFile, inFile2, inFile3], outFile, options).then((data: void) => {
                console.info('compressFiles success. data: ' + JSON.stringify(data));
                expect(data).assertFail();
                done();
            }).catch((errData: BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData.code).assertEqual(900002);
                done();
            })
        } catch(errData) {
            let code = (errData as BusinessError).code;
            let message = (errData as BusinessError).message;
            console.error(`errData is errCode:${code}  message:${message}`);
            expect(errData).assertFail();
            done();
        }
        console.info("==================ACTS_ZlibInterfaceTest_08 end==================");
    })

    /**
     * @tc.name   ActsZlibInterfaceTest09
     * @tc.number ACTS_ZlibInterfaceTest_09
     * @tc.desc   test compressFile with keepTopLevelFolder option set to true,
     *            verify that the top-level directory is preserved in the zip file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibInterfaceTest09', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_09 start==================");
        let sourceName = 'keepTopLevelFolderSource' + Date.now();
        let sourceDir = filesDir + '/' + sourceName;
        let sourceFile = sourceDir + '/test.txt';
        let zipFile = filesDir + '/' + sourceName + '.zip';
        let outputDir = filesDir + '/' + sourceName + 'Output';
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
        } catch (errData) {
            console.error(`ActsZlibInterfaceTest09 failed, errCode:${errData.code} message:${errData.message}`);
            expect(errData).assertFail();
        }
        console.info("==================ACTS_ZlibInterfaceTest_09 end==================");
        done();
    })

    /**
     * @tc.name   ActsZlibInterfaceTest10
     * @tc.number ACTS_ZlibInterfaceTest_10
     * @tc.desc   test compressFile with keepTopLevelFolder option set to false,
     *            verify that the top-level directory is NOT preserved in the zip file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibInterfaceTest10', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_10 start==================");
        let sourceName = 'keepTopLevelFolderSourceFalse' + Date.now();
        let sourceDir = filesDir + '/' + sourceName;
        let sourceFile = sourceDir + '/test.txt';
        let zipFile = filesDir + '/' + sourceName + '.zip';
        let outputDir = filesDir + '/' + sourceName + 'Output';
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
        } catch (errData) {
            console.error(`ActsZlibInterfaceTest10 failed, errCode:${errData.code} message:${errData.message}`);
            expect(errData).assertFail();
        }
        console.info("==================ACTS_ZlibInterfaceTest_10 end==================");
        done();
    })

    /**
     * @tc.name   ActsZlibInterfaceTest11
     * @tc.number ACTS_ZlibInterfaceTest_11
     * @tc.desc   test compressFile without keepTopLevelFolder parameter (default behavior),
     *            verify the default behavior when keepTopLevelFolder is not specified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibInterfaceTest11', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_11 start==================");
        let sourceName = 'defaultBehavior' + Date.now();
        let sourceDir = filesDir + '/' + sourceName;
        let sourceFile = sourceDir + '/test.txt';
        let zipFile = filesDir + '/' + sourceName + '.zip';
        let outputDir = filesDir + '/' + sourceName + 'Output';
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
        } catch (errData) {
            console.error(`ActsZlibInterfaceTest11 failed, errCode:${errData.code} message:${errData.message}`);
            expect(errData).assertFail();
        }
        console.info("==================ACTS_ZlibInterfaceTest_11 end==================");
        done();
    })

    /**
     * @tc.name   ActsZlibInterfaceTest12
     * @tc.number ACTS_ZlibInterfaceTest_12
     * @tc.desc   test compressFile with keepTopLevelFolder true and multiple files,
     *            verify that all files are correctly preserved with top-level directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsZlibInterfaceTest12', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_12 start==================");
        let sourceName = 'multiFileTest' + Date.now();
        let sourceDir = filesDir + '/' + sourceName;
        let zipFile = filesDir + '/' + sourceName + '.zip';
        let outputDir = filesDir + '/' + sourceName + 'Output';
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
        } catch (errData) {
            console.error(`ActsZlibInterfaceTest12 failed, errCode:${errData.code} message:${errData.message}`);
            expect(errData).assertFail();
        }
        console.info("==================ACTS_ZlibInterfaceTest_12 end==================");
        done();
    })

    /**
     * @tc.name   ActsZlibInterfaceTest13
     * @tc.number ACTS_ZlibInterfaceTest_13
     * @tc.desc   test compressFile with keepTopLevelFolder true and nested directories,
     *            verify that nested directory structure is correctly preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsZlibInterfaceTest13', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_13 start==================");
        let sourceName = 'nestedDirTest' + Date.now();
        let sourceDir = filesDir + '/' + sourceName;
        let subDir = sourceDir + '/subdir';
        let zipFile = filesDir + '/' + sourceName + '.zip';
        let outputDir = filesDir + '/' + sourceName + 'Output';
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
        } catch (errData) {
            console.error(`ActsZlibInterfaceTest13 failed, errCode:${errData.code} message:${errData.message}`);
            expect(errData).assertFail();
        }
        console.info("==================ACTS_ZlibInterfaceTest_13 end==================");
        done();
    })

    /**
     * @tc.name   ActsZlibInterfaceTest14
     * @tc.number ACTS_ZlibInterfaceTest_14
     * @tc.desc   test compressFiles with keepTopLevelFolder true and preserve every source directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsZlibInterfaceTest14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: Function) => {
        console.info("==================ACTS_ZlibInterfaceTest_14 start==================");
        let testName = 'compressFilesKeepTopLevel' + Date.now();
        let firstName = testName + 'First';
        let secondName = testName + 'Second';
        let firstDir = filesDir + '/' + firstName;
        let secondDir = filesDir + '/' + secondName;
        let zipFile = filesDir + '/' + testName + '.zip';
        let outputDir = filesDir + '/' + testName + 'Output';
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
        } catch (errData) {
            console.error(`ActsZlibInterfaceTest14 failed, errCode:${errData.code} message:${errData.message}`);
            expect(errData).assertFail();
        }
        console.info("==================ACTS_ZlibInterfaceTest_14 end==================");
        done();
    })
 })
}
