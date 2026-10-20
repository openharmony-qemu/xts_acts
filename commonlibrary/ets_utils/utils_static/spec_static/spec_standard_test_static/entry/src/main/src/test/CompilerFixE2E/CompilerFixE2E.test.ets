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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index';
import hilog from '@ohos.hilog';

async function sleep(time: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
        setTimeout(() => {
            resolve(0);
        }, time);
    });
}

enum FetchType {
    NORMAL,
    THUMBNAIL,
}

interface QueryCountParam {
    start: number;
    count: number;
}

interface QueryParam extends QueryCountParam {
    fetchType: FetchType;
    startTime: number;
    id: string;
    albumUri: string;
    filterMediaType: string;
    needThumbnailReady: boolean;
}

interface AlbumQuery {
    albumUri: string;
    count: number;
    displayName: string;
}

interface BaseAlbumInfo {
    id: string;
    name: string;
}

interface ExtendedAlbumInfo extends BaseAlbumInfo {
    count: number;
    coverUri: string;
}

interface EmptyIface {
}

export default function CompilerFixE2ETest(): void {
    describe('CompilerFixE2ETest', (): void => {
        beforeAll((): void => {
        })

        beforeEach(async (): Promise<void> => {
            await sleep(30);
        })

        afterEach((): void => {
        })

        afterAll((): void => {
        })

        /**
         * @tc.number SUB_commonlibrary_ets_utils_compilerfixe2e_0001
         * @tc.name CompilerFixE2ETEST0001
         * @tc.desc test Partial<QueryParam> with 8 fields including inherited fields can read/write all fields
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('CompilerFixE2ETEST0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const param: Partial<QueryParam> = {
                start: 0,
                count: 10,
                fetchType: FetchType.NORMAL,
                startTime: 1000,
                id: 'test_album_001',
                albumUri: 'file://media/test',
                filterMediaType: 'image',
                needThumbnailReady: true,
            };
            expect(param.start).assertEqual(0);
            expect(param.count).assertEqual(10);
            expect(param.fetchType).assertEqual(FetchType.NORMAL);
            expect(param.startTime).assertEqual(1000);
            expect(param.id).assertEqual('test_album_001');
            expect(param.albumUri).assertEqual('file://media/test');
            expect(param.filterMediaType).assertEqual('image');
            expect(param.needThumbnailReady).assertEqual(true);
        })


        /**
         * @tc.number SUB_commonlibrary_ets_utils_compilerfixe2e_0002
         * @tc.name CompilerFixE2ETEST0002
         * @tc.desc test 3 parallel Partial<QueryParam> usages do not crash (prgMaps_ UAF regression)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('CompilerFixE2ETEST0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const param1: Partial<QueryParam> = { start: 0, count: 10 };
            const param2: Partial<QueryParam> = { start: 10, count: 20 };
            const param3: Partial<QueryParam> = { start: 20, count: 30 };
            const params: Array<Partial<QueryParam>> = [param1, param2, param3];
            const results: Array<Partial<QueryParam>> = [];
            try {
                const values: Array<Partial<QueryParam>> = await Promise.all([
                    Promise.resolve(param1),
                    Promise.resolve(param2),
                    Promise.resolve(param3),
                ]);
                results.push(...values);
                hilog.info(0x0000, 'CompilerFixE2E', 'MultiModuleParallel_NoCrash: 3 parallel calls completed without crash');
            } catch (e) {
                hilog.info(0x0000, 'CompilerFixE2E', `MultiModuleParallel_NoCrash: exception caught: ${(e as Error).message}`);
            }
            expect(results.length).assertEqual(3);
            expect(results[0].start).assertEqual(0);
            expect(results[0].count).assertEqual(10);
            expect(results[1].start).assertEqual(10);
            expect(results[1].count).assertEqual(20);
            expect(results[2].start).assertEqual(20);
            expect(results[2].count).assertEqual(30);
            expect(params[0].start).assertEqual(0);
            expect(params[0].count).assertEqual(10);
            expect(params[1].start).assertEqual(10);
            expect(params[1].count).assertEqual(20);
            expect(params[2].start).assertEqual(20);
            expect(params[2].count).assertEqual(30);
        })
        /**
         * @tc.number SUB_commonlibrary_ets_utils_compilerfixe2e_0003
         * @tc.name CompilerFixE2ETEST0003
         * @tc.desc test sequential reuse of Partial<QueryParam> does not trigger UAF on prgMaps_
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('CompilerFixE2ETEST0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const param: Partial<QueryParam> = { start: 0, count: 5 };
            const firstResult: Partial<QueryParam> = { start: param.start, count: param.count };
            hilog.info(0x0000, 'CompilerFixE2E', `SequentialReuse first call: start=${firstResult.start}, count=${firstResult.count}`);
            param.start = 100;
            const secondResult: Partial<QueryParam> = { start: param.start, count: param.count };
            hilog.info(0x0000, 'CompilerFixE2E', `SequentialReuse second call: start=${secondResult.start}, count=${secondResult.count}`);
            hilog.info(0x0000, 'CompilerFixE2E', `SequentialReuse: both calls completed`);
            expect(firstResult.start).assertEqual(0);
            expect(firstResult.count).assertEqual(5);
            expect(secondResult.start).assertEqual(100);
            expect(secondResult.count).assertEqual(5);
        })


        /**
         * @tc.number SUB_commonlibrary_ets_utils_compilerfixe2e_0004
         * @tc.name CompilerFixE2ETEST0004
         * @tc.desc test Partial<T> interface with extra data field compiles and all fields are accessible
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('CompilerFixE2ETEST0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const query: Partial<AlbumQuery> = {
                albumUri: 'file://media/test',
                count: 100,
                displayName: 'album',
            };
            expect(query.albumUri).assertEqual('file://media/test');
            expect(query.count).assertEqual(100);
            expect(query.displayName).assertEqual('album');
        })

        /**
         * @tc.number SUB_commonlibrary_ets_utils_compilerfixe2e_0005
         * @tc.name CompilerFixE2ETEST0005
         * @tc.desc test Partial<T> interface inheritance chain preserves parent and child field accessors
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('CompilerFixE2ETEST0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const partial: Partial<ExtendedAlbumInfo> = {
                id: 'album_001',
                name: 'Camera',
                count: 50,
                coverUri: 'file://media/cover.jpg',
            };
            expect(partial.id).assertEqual('album_001');
            expect(partial.name).assertEqual('Camera');
            expect(partial.count).assertEqual(50);
            expect(partial.coverUri).assertEqual('file://media/cover.jpg');
        })

        /**
         * @tc.number SUB_commonlibrary_ets_utils_compilerfixe2e_0006
         * @tc.name CompilerFixE2ETEST0006
         * @tc.desc test repeated create/destroy cycles with Partial<QueryParam> do not leak or double-free
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('CompilerFixE2ETEST0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const iterations: number = 20;
            const snapshots: Array<Partial<QueryParam>> = [];
            for (let i = 0; i < iterations; i++) {
                const param: Partial<QueryParam> = { start: i, count: 10 };
                snapshots.push({ start: param.start, count: param.count });
            }
            for (let i = 0; i < iterations; i++) {
                expect(snapshots[i].start).assertEqual(i);
                expect(snapshots[i].count).assertEqual(10);
            }
        })

        /**
         * @tc.number SUB_commonlibrary_ets_utils_compilerfixe2e_0007
         * @tc.name CompilerFixE2ETEST0007
         * @tc.desc test Partial<T> with no fields set returns undefined for all optional fields
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('CompilerFixE2ETEST0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const p: Partial<QueryParam> = {};
            expect(p.start).assertUndefined();
            expect(p.count).assertUndefined();
            expect(p.fetchType).assertUndefined();
            expect(p.startTime).assertUndefined();
            expect(p.id).assertUndefined();
            expect(p.albumUri).assertUndefined();
            expect(p.filterMediaType).assertUndefined();
            expect(p.needThumbnailReady).assertUndefined();
        })

        /**
         * @tc.number SUB_commonlibrary_ets_utils_compilerfixe2e_0008
         * @tc.name CompilerFixE2ETEST0008
         * @tc.desc test Partial<T> partially set fields: set fields keep values, unset fields are undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('CompilerFixE2ETEST0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const p: Partial<QueryParam> = { start: 1, id: 'partial_008' };
            expect(p.start).assertEqual(1);
            expect(p.id).assertEqual('partial_008');
            expect(p.count).assertUndefined();
            expect(p.fetchType).assertUndefined();
            expect(p.startTime).assertUndefined();
            expect(p.albumUri).assertUndefined();
            expect(p.filterMediaType).assertUndefined();
            expect(p.needThumbnailReady).assertUndefined();
        })

        /**
         * @tc.number SUB_commonlibrary_ets_utils_compilerfixe2e_0009
         * @tc.name CompilerFixE2ETEST0009
         * @tc.desc test Partial<T> on empty interface does not crash the compiler
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('CompilerFixE2ETEST0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const e: Partial<EmptyIface> = {};
            expect(e).assertDeepEquals({});
        })
    })
}
