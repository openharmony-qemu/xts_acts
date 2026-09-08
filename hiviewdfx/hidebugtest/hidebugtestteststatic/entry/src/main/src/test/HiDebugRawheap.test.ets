'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll,TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hidebug from '@ohos.hidebug'
import Utils from './Util.test';

export default function HidebugRawheapTest() {
    describe("HidebugRawheapTest", (): void => {

        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(async () => {
            await Utils.msSleep(2000);
            console.info("beforeEach case");
        });
        afterEach(async () => {
            console.info("afterEach case");
        });
        afterAll(() => {
            console.info("afterAll case");
        });

        // ============================================
        // 一、dumpJsRawHeapData(needGC?: boolean) 单参数重载 - 5个
        // ============================================

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0100
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0100
         * @tc.desc   dumpJsRawHeapData() - no parameter, generate static and dynamic rawheap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0100 Test start***********');
            try {
                hidebug.dumpJsRawHeapData().then((filePath: string) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0100 success, filePath: %{public}s', filePath);
                    expect(filePath.length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0100 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0100 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0100 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0100 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0200
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0200
         * @tc.desc   dumpJsRawHeapData(false) - needGC=false, generate static and dynamic rawheap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0200 Test start***********');
            try {
                hidebug.dumpJsRawHeapData(false).then((filePath: string) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0200 success, filePath: %{public}s', filePath);
                    expect(filePath.length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0200 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0200 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0200 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0200 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0300
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0300
         * @tc.desc   dumpJsRawHeapData(true) - needGC=true, generate static and dynamic rawheap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0300 Test start***********');
            try {
                hidebug.dumpJsRawHeapData(true).then((filePath: string) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0300 success, filePath: %{public}s', filePath);
                    expect(filePath.length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0300 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0200 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0300 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0300 Test end***********');
        });


        // ============================================
        // 二、dumpJsRawHeapData(needGC, needClean) 双参数重载 - 6个
        // ============================================

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0400
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0400
         * @tc.desc   dumpJsRawHeapData(false, false) - no GC, no clean, generate static and dynamic rawheap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0400 Test start***********');
            try {
                hidebug.dumpJsRawHeapData(false, false).then((filePath: string) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0400 success, filePath: %{public}s', filePath);
                    expect(filePath.length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0400 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0400 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0400 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0400 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500
         * @tc.desc   dumpJsRawHeapData(true, false) - GC, no clean, generate static and dynamic rawheap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 Test start***********');
            try {
                hidebug.dumpJsRawHeapData(true, false).then((filePath: string) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 success, filePath: %{public}s', filePath);
                    expect(filePath.length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0600
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0600
         * @tc.desc   dumpJsRawHeapData(false, true) - no GC, clean, generate static and dynamic rawheap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0600 Test start***********');
            try {
                await hidebug.dumpJsRawHeapData(false, true).then((filePath: string) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0600 success, filePath: %{public}s', filePath);
                    expect(filePath.length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0600 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0600 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0600 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0700
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0700
         * @tc.desc   dumpJsRawHeapData(true, true) - GC, clean, generate static and dynamic rawheap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0700 Test start***********');
            try {
                await hidebug.dumpJsRawHeapData(true, true).then((filePath: string) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0700 success, filePath: %{public}s', filePath);
                    expect(filePath.length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0700 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0700 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0700 Test end***********');
        });



       

        // ============================================
        // 三、dumpJsRawHeapData(needGC, needClean, processDump) 三参数重载 - 12个
        // ============================================

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0800
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0800
         * @tc.desc   dumpJsRawHeapData(false, false, false) - thread only, no GC, no clean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0800 Test start***********');
            try {
                await hidebug.dumpJsRawHeapData(false, false, false).then((filePathArray: Array<string>) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0800 success, filePathArray: %{public}s', JSON.stringify(filePathArray));
                    expect(filePathArray.length > 0).assertTrue();
                    expect(filePathArray[0].length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0800 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0800 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0800 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0900
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0900
         * @tc.desc   dumpJsRawHeapData(false, false, true) - process dump, no GC, no clean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0900 Test start***********');
            try {
                hidebug.dumpJsRawHeapData(false, false, true).then((filePathArray: Array<string>) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0900 success, filePathArray: %{public}s', JSON.stringify(filePathArray));
                    expect(filePathArray.length > 0).assertTrue();
                    expect(filePathArray[0].length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0900 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0900 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0900 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1000
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1000
         * @tc.desc   dumpJsRawHeapData(false, true, false) - thread only, no GC, clean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1000 Test start***********');
            try {
                hidebug.dumpJsRawHeapData(false, true, false).then((filePathArray: Array<string>) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1000 success, filePathArray: %{public}s', JSON.stringify(filePathArray));
                    expect(filePathArray.length > 0).assertTrue();
                    expect(filePathArray[0].length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1000 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1000 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1000 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1100
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1100
         * @tc.desc   dumpJsRawHeapData(false, true, true) - process dump, no GC, clean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1100 Test start***********');
            try {
                hidebug.dumpJsRawHeapData(false, true, true).then((filePathArray: Array<string>) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1100 success, filePathArray: %{public}s', JSON.stringify(filePathArray));
                    expect(filePathArray.length > 0).assertTrue();
                    expect(filePathArray[0].length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1100 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1100 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1100 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1200
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1200
         * @tc.desc   dumpJsRawHeapData(true, false, false) - thread only, GC, no clean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1200 Test start***********');
            try {
                hidebug.dumpJsRawHeapData(true, false, false).then((filePathArray: Array<string>) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1200 success, filePathArray: %{public}s', JSON.stringify(filePathArray));
                    expect(filePathArray.length > 0).assertTrue();
                    expect(filePathArray[0].length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1200 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1200 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1200 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1300
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1300
         * @tc.desc   dumpJsRawHeapData(true, false, true) - process dump, GC, no clean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1300 Test start***********');
            try {
                hidebug.dumpJsRawHeapData(true, false, true).then((filePathArray: Array<string>) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1300 success, filePathArray: %{public}s', JSON.stringify(filePathArray));
                    expect(filePathArray.length > 0).assertTrue();
                    expect(filePathArray[0].length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1300 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    expect().assertFail();
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1300 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1300 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1400
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1400
         * @tc.desc   dumpJsRawHeapData(true, true, false) - thread only, GC, clean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1400 Test start***********');
            try {
                hidebug.dumpJsRawHeapData(true, true, false).then((filePathArray: Array<string>) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1400 success, filePathArray: %{public}s', JSON.stringify(filePathArray));
                    expect(filePathArray.length > 0).assertTrue();
                    expect(filePathArray[0].length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1400 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1400 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1400 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1500
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1500
         * @tc.desc   dumpJsRawHeapData(true, true, true) - process dump, GC, clean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1500 Test start***********');
            try {
                hidebug.dumpJsRawHeapData(true, true, true).then((filePathArray: Array<string>) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1500 success, filePathArray: %{public}s', JSON.stringify(filePathArray));
                    expect(filePathArray.length > 0).assertTrue();
                    expect(filePathArray[0].length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1500 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1500 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1500 Test end***********');
        });

    

        

    
        

        // ============================================
        // 四、setJsRawHeapTrimLevel(level) - 8个
        // ============================================

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1600
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1600
         * @tc.desc   setJsRawHeapTrimLevel with TRIM_LEVEL_1 enum value
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1600 Test start***********');
            try {
                hidebug.setJsRawHeapTrimLevel(hidebug.JsRawHeapTrimLevel.TRIM_LEVEL_1);
                hidebug.dumpJsRawHeapData(false, false, false).then((filePathArray: Array<string>) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1600 success, filePathArray: %{public}s', JSON.stringify(filePathArray));
                    expect(filePathArray.length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1600 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1600 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1600 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1700
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1700
         * @tc.desc   setJsRawHeapTrimLevel and dumpJsRawHeapData - compare file size with different trim level
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1700 Test start***********');
            try {
                hidebug.setJsRawHeapTrimLevel(hidebug.JsRawHeapTrimLevel.TRIM_LEVEL_2);
                hidebug.dumpJsRawHeapData(false, false, false).then((filePathArray: Array<string>) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1700 TRIM_LEVEL_2 success, filePathArray: %{public}s', JSON.stringify(filePathArray));
                    expect(filePathArray.length > 0).assertTrue();
                    hidebug.setJsRawHeapTrimLevel(hidebug.JsRawHeapTrimLevel.TRIM_LEVEL_1);
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1700 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1700 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1700 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1800
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1800
         * @tc.desc   Test setJsRawHeapTrimLevel default behavior (TRIM_LEVEL_1)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1800 Test start***********');
            try {
                hidebug.setJsRawHeapTrimLevel(hidebug.JsRawHeapTrimLevel.TRIM_LEVEL_1);
                hidebug.dumpJsRawHeapData(false, false, false).then((filePathArray: Array<string>) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1800 success, filePathArray: %{public}s', JSON.stringify(filePathArray));
                    expect(filePathArray.length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1800 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1800 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1800 Test end***********');
        });

        // ============================================
        // 五、dumpJsHeapData(filename, needClean) 基本 - 3个
        // ============================================

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1900
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1900
         * @tc.desc   dumpJsHeapData with filename and needClean=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1900 Test start***********');
            try {
                hidebug.dumpJsHeapData("heapData_test", true);
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1900 success');
                done();
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1900 catch error: %{public}s', JSON.stringify(err));
                if (err.code === 11400110) {
                    console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_1900 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2000
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2000
         * @tc.desc   dumpJsHeapData with filename and needClean=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2000 Test start***********');
            try {
                hidebug.dumpJsHeapData("heapData_test", false);
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2000 success');
                done();
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2000 catch error: %{public}s', JSON.stringify(err));
                if (err.code === 11400110) {
                    console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2000 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2100
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2100
         * @tc.desc   dumpJsHeapData only with filename (deprecated API)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2100 Test start***********');
            try {
                hidebug.dumpJsHeapData("heapData_only_filename");
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2100 success');
                done();
            } catch (err) {
                if (err.code === 11400110) {
                    console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2100 Test end***********');
        });

        // ============================================
        // 六、dumpJsHeapData filename 长度边界值 - 9个
        // ============================================

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2200
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2200
         * @tc.desc   dumpJsHeapData with empty filename (0 characters) - error code 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2200 Test start***********');
            try {
                hidebug.dumpJsHeapData("", true);
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2200 unexpected success');
                expect().assertFail();
                done();
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2200 error: code=%{public}d, message=%{public}s', (err as BusinessError).code, (err as BusinessError).message);
                expect((err as BusinessError).code == 401).assertTrue();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2200 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2300
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2300
         * @tc.desc   dumpJsHeapData with filename length = 1 character (min valid length)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2300 Test start***********');
            try {
                hidebug.dumpJsHeapData("a", true);
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2300 success');
                done();
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2300 catch error: %{public}s', JSON.stringify(err));
                if (err.code === 11400110) {
                    console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2300 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2400
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2400
         * @tc.desc   dumpJsHeapData with filename length = 100 characters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2400 Test start***********');
            try {
                let filename100 = "a".repeat(100);
                hidebug.dumpJsHeapData(filename100, true);
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2400 success, filename length: %{public}d', filename100.length);
                expect(filename100.length == 100).assertTrue();
                done();
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2400 catch error: %{public}s', JSON.stringify(err));
                if (err.code === 11400110) {
                    console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2400 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2500
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2500
         * @tc.desc   dumpJsHeapData with filename length = 127 characters (max - 1)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2500 Test start***********');
            try {
                let filename127 = "a".repeat(127);
                hidebug.dumpJsHeapData(filename127, true);
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2500 success, filename length: %{public}d', filename127.length);
                expect(filename127.length == 127).assertTrue();
                done();
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2500 catch error: %{public}s', JSON.stringify(err));
                if (err.code === 11400110) {
                    console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2500 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2600
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2600
         * @tc.desc   dumpJsHeapData with filename length = 128 characters (max valid length)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2600 Test start***********');
            try {
                let filename128 = "a".repeat(128);
                hidebug.dumpJsHeapData(filename128, true);
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2600 success, filename length: %{public}d', filename128.length);
                expect(filename128.length == 128).assertTrue();
                done();
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2600 catch error: %{public}s', JSON.stringify(err));
                if (err.code === 11400110) {
                    console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2600 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2700
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2700
         * @tc.desc   dumpJsHeapData with filename length = 129 characters (exceeds max) - error code 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2700 Test start***********');
            try {
                let filename129 = "a".repeat(129);
                hidebug.dumpJsHeapData(filename129, true);
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2700 unexpected success');
                expect().assertFail();
                done();
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2700 error: code=%{public}d, message=%{public}s', (err as BusinessError).code, (err as BusinessError).message);
                expect((err as BusinessError).code == 401).assertTrue();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2700 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2800
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2800
         * @tc.desc   dumpJsHeapData with filename length = 200 characters (far exceeds max) - error code 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2800 Test start***********');
            try {
                let filename200 = "a".repeat(200);
                hidebug.dumpJsHeapData(filename200, true);
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2800 unexpected success');
                expect().assertFail();
                done();
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2800 error: code=%{public}d, message=%{public}s', (err as BusinessError).code, (err as BusinessError).message);
                expect((err as BusinessError).code == 401).assertTrue();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2800 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2900
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2900
         * @tc.desc   dumpJsHeapData with filename length = 127 and needClean=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2900 Test start***********');
            try {
                let filename127 = "a".repeat(127);
                hidebug.dumpJsHeapData(filename127, false);
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2900 success, filename length: %{public}d', filename127.length);
                expect(filename127.length == 127).assertTrue();
                done();
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2900 catch error: %{public}s', JSON.stringify(err));
                if (err.code === 11400110) {
                    console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_2900 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3000
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3000
         * @tc.desc   dumpJsHeapData with filename length = 128 and needClean=false (boundary test)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3000 Test start***********');
            try {
                let filename128 = "a".repeat(128);
                hidebug.dumpJsHeapData(filename128, false);
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3000 success, filename length: %{public}d', filename128.length);
                expect(filename128.length == 128).assertTrue();
                done();
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3000 catch error: %{public}s', JSON.stringify(err));
                if (err.code === 11400110) {
                    console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3000 Test end***********');
        });

        
        // ============================================
        // 八、异常场景测试 - 2个
        // ============================================

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3100
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3100
         * @tc.desc   Repeated dumpJsRawHeapData call - error code 11400112
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3100 Test start***********');
            try {
                hidebug.dumpJsRawHeapData(false, false, false).then((filePathArray: Array<string>) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3100 first call success');
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3100 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    expect().assertFail();
                    done();
                })
                let filename =  await hidebug.dumpJsRawHeapData(false, false, false)
                console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3100 success  second Path: ${filename}`)
                expect().assertFail();
            } catch (err) {
                console.error(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3100 > err code: ${err.code}, err msg: ${err.message}`)
                if (err.code === 11400110) {
                    console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                    done();
                } else {
                    expect(err.code === 11400112).assertTrue();
                    done();
                }
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3100 Test end***********');
        });

        /**
         * @tc.name   SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3200
         * @tc.number SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3200
         * @tc.desc   dumpJsRawHeapData with different parameter combinations - comprehensive test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3200 Test start***********');
            try {
                hidebug.dumpJsRawHeapData(true, false, true).then((filePathArray: Array<string>) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3200 success, filePathArray: %{public}s', JSON.stringify(filePathArray));
                    expect(filePathArray.length > 0).assertTrue();
                    done();
                }).catch((error: Error) => {
                    console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3200 error: code=%{public}d, message=%{public}s', error.code, error.message);
                    if (error.code === 11400110) {
                        console.info(`SUB_DFX_DFR_Hiprofiler_Rawheap_Static_0500 > 11400110 (Disk remaining space too low), skip.`);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            } catch (err) {
                console.info('SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3200 catch error: %{public}s', JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('*********** SUB_DFX_DFR_Hiprofiler_Rawheap_Static_3200 Test end***********');
        });
    })
}
