'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

/**
 * define the testcase type : TestType, Size , Level
 */
export const TAG: string = '[Hypium]';

export const DEFAULT: int = 0B0000;

export class PrintTag {
    static readonly OHOS_REPORT_WORKER_STATUS: string = 'OHOS_REPORT_WORKER_STATUS';
    static readonly OHOS_REPORT_ALL_RESULT: string = 'OHOS_REPORT_ALL_RESULT';
    static readonly OHOS_REPORT_ALL_CODE: string = 'OHOS_REPORT_ALL_CODE';
    static readonly OHOS_REPORT_ALL_STATUS: string = 'OHOS_REPORT_ALL_STATUS';
    static readonly OHOS_REPORT_RESULT: string = 'OHOS_REPORT_RESULT';
    static readonly OHOS_REPORT_CODE: string = 'OHOS_REPORT_CODE';
    static readonly OHOS_REPORT_STATUS: string = 'OHOS_REPORT_STATUS';
    static readonly OHOS_REPORT_SUM: string = 'OHOS_REPORT_SUM';
    static readonly OHOS_REPORT_STATUS_CODE: string = 'OHOS_REPORT_STATUS_CODE';
};

export class TestType {
    static readonly FUNCTION: int = 0B1;
    static readonly PERFORMANCE: int = 0B1 << 1;
    static readonly POWER: int = 0B1 << 2;
    static readonly RELIABILITY: int = 0B1 << 3;
    static readonly SECURITY: int = 0B1 << 4;
    static readonly GLOBAL: int = 0B1 << 5;
    static readonly COMPATIBILITY: int = 0B1 << 6;
    static readonly USER: int = 0B1 << 7;
    static readonly STANDARD: int = 0B1 << 8;
    static readonly SAFETY: int = 0B1 << 9;
    static readonly RESILIENCE: int = 0B1 << 10;
};

export class Size {
    static readonly SMALLTEST: int = 0B1 << 16;
    static readonly MEDIUMTEST: int = 0B1 << 17;
    static readonly LARGETEST: int = 0B1 << 18;
};

export class Level {
    static readonly LEVEL0: int = 0B1 << 24;
    static readonly LEVEL1: int = 0B1 << 25;
    static readonly LEVEL2: int = 0B1 << 26;
    static readonly LEVEL3: int = 0B1 << 27;
    static readonly LEVEL4: int = 0B1 << 28;
};

const TESTTYPE: Map<string, int> = new Map<string, int>();
TESTTYPE.set('function', TestType.FUNCTION);
TESTTYPE.set('performance', TestType.PERFORMANCE);
TESTTYPE.set('power', TestType.POWER);
TESTTYPE.set('reliability', TestType.RELIABILITY);
TESTTYPE.set('security', TestType.SECURITY);
TESTTYPE.set('global', TestType.GLOBAL);
TESTTYPE.set('compatibility', TestType.COMPATIBILITY);
TESTTYPE.set('user', TestType.USER);
TESTTYPE.set('standard', TestType.STANDARD);
TESTTYPE.set('safety', TestType.SAFETY);
TESTTYPE.set('resilience', TestType.RESILIENCE);
export { TESTTYPE };


export const LEVEL: int[] = [
  Level.LEVEL0,
  Level.LEVEL1,
  Level.LEVEL2,
  Level.LEVEL3,
  Level.LEVEL4
];

const SIZE: Map<string, int> = new Map<string, int>();
SIZE.set('small', Size.SMALLTEST);
SIZE.set('medium', Size.MEDIUMTEST);
SIZE.set('large', Size.LARGETEST);
export { SIZE };

export const KEYSET: string[] = [
    '-s class', '-s notClass', '-s suite', '-s itName',
    '-s level', '-s testType', '-s size', '-s timeout',
    '-s dryRun', '-s random', '-s breakOnError', '-s stress',
    '-s coverage', '-s skipMessage', '-s runSkipped',
    'class', 'notClass', 'suite', 'itName',
    'level', 'testType', 'size', 'timeout', 'dryRun', 'random',
    'breakOnError', 'stress', 'coverage', 'skipMessage', 'runSkipped',
    '-s tag', 'tag'
];
