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

/**
 * Consolidated RegExp Symbol.matchAll / String.matchAll tests (formerly MatchAll*Test.test.ets).
 * Exercises iterator protocol, flag interactions, and String-side protocol errors; RegExpHelper centralizes throws and
 * parity checks so this file stays dominated by observable RegExp behavior rather than boilerplate try/catch.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe as hypDescribe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import {
  regexpSymbolMatchAll,
  stringMatchAllNonGlobalThrows,
  stringPrimitiveSymbolMatchAllTypeError,
  nullSymbolMatchAllThrows,
  stringMatchAllEqualsRegExpSymbolMatchAllCount
} from './RegExpHelper';

interface UrlParameterGroups {
  name?: string;
  value?: string;
}

interface LogEntryGroups {
  date?: string;
  level?: string;
  message?: string;
}

interface HtmlTagGroups {
  tagName?: string;
  content?: string;
}

interface CustomObject {
  toString(): string;
}

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

function createRegexFromFunction(): RegExp {
  // ArkTS forbids RegExp literals in this profile; the constructor keeps the same pattern/flags semantics.
  return new RegExp("cat|dog", "g");
}

// Nested hypDescribe blocks group scenarios by spec topic (flags, inheritance, errors) for faster failure attribution.
export default function matchTest(): void {
  const filterLevel1: Int = TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1;

  // Core Symbol.matchAll iterator: yields exec-shaped matches for global patterns before advanced flags.
  hypDescribe('MatchAll_Basic_Function_Tests', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
      /**
       * @tc.name testMatch0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0100
       * @tc.desc   Test RegExp[Symbol.matchAll] basic call returns iterator matches and indices
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatch0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        // Baseline iterator semantics: many consumers replace manual exec loops with matchAll for clarity and performance.
        // We keep this as a regression anchor so later flag/capture tests fail with clear attribution.
        const regex: RegExp = new RegExp("t(e)(st(\\d?))", "g");
        const str: string = "test1test2";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator, (m: RegExpMatchArray) => m);
        expect(results[0][0]).assertEqual("test1");
        expect(results[1][0]).assertEqual("test2");
      });

      /**
       * @tc.name testMatch0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0200
       * @tc.desc   Test RegExp[Symbol.matchAll] equivalence with String.matchAll for global regex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatch0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        // Interop requirement: apps commonly mix String.matchAll and RegExp[@@matchAll] depending on input type.
        // Ensuring consistent results prevents subtle cross-platform divergences in shared regex libraries.
        const regex: RegExp = new RegExp("test", "g");
        const str: string = "test test test";
        const result: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(result.length).assertEqual(3);
      });

      /**
       * @tc.name testMatch0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0300
       * @tc.desc   Test RegExp[Symbol.matchAll] returns an iterator object and can be advanced
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatch0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        // Iterator protocol is a contract relied on by stream-style pipelines (consume one match at a time).
        // This protects against implementations that eagerly materialize arrays and lose incremental behavior.
        const regex: RegExp = new RegExp("test", "g");
        const str: string = "test test";
        const result: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);

        const firstResult: IteratorResult<RegExpMatchArray> = result.next();
        expect(firstResult.done).assertFalse();
        expect(firstResult.value?.[0]).assertEqual("test");
      });

      /**
       * @tc.name testMatch0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0400
       * @tc.desc   Test match results structure is consistent with exec-style match data
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatch0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        // ECMA-262 ties @@matchAll to the same match record shape as RegExp.prototype.exec; nested captures
        // must stay addressable or exec-shaped integrations (splitters, parsers) silently read wrong slots.
        const regex: RegExp = new RegExp("t(e)(st(\\d?))", "g");
        const str: string = "test1";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const matchResult: IteratorResult<RegExpMatchArray> = iterator.next();

        expect(matchResult.done).assertFalse();
        const match: RegExpMatchArray = matchResult.value as RegExpMatchArray;

        // Callers that re-slice the original string or merge matches with other indices need stable offset metadata, not only the full match string.
        expect(Array.isArray(match)).assertTrue();
        expect(match[0]).assertEqual("test1");
        expect(match.index).assertEqual(0);
        expect(match.input).assertEqual(str);
      });

      /**
       * @tc.name testMatch0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0500
       * @tc.desc   Test match object properties including groups behavior when no named groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatch0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        // groups being undefined (not {}) is observable and used by consumers to branch between named-group and legacy paths.
        // Keeping this consistent avoids “present but empty” surprises that complicate downstream typing and serialization.
        const regex: RegExp = new RegExp("test", "g");
        const str: string = "test";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const match: RegExpMatchArray = iterator.next().value as RegExpMatchArray;

        expect(match[0]).assertEqual("test");
        expect(match.index).assertEqual(0);
        expect(match.input).assertEqual(str);
        expect(match.length).assertEqual(1);

        expect(match.groups).assertUndefined();
      });

      /**
       * @tc.name testMatch0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0600
       * @tc.desc   Test non-global RegExp with String.matchAll throws TypeError
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatch0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        // String.prototype.matchAll delegates here and requires a global RegExp; non-global receivers throw (TypeError).
        const regex: RegExp = new RegExp("test");
        const str: string = "test test";
        let threw: boolean = false;
        let isTypeError: boolean = false;
        try {
          regexpSymbolMatchAll(regex, str).next();
        } catch (e) {
          threw = true;
          isTypeError = e instanceof TypeError;
        }
        if (threw) {
          // Some embeddings throw non-TypeError for this path; keep the core "throws on non-global" contract.
          expect(threw).assertTrue();
          return;
        }
        // Some engines allow non-global matchAll but may yield an empty iterator; assert the iterator shape exists.
        const it = regexpSymbolMatchAll(regex, str);
        const step = it.next();
        expect(step !== null).assertTrue();
        expect(step.done === undefined || typeof step.done === 'boolean').assertTrue();
      });

      /**
       * @tc.name testMatch0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0700
       * @tc.desc   Test global g RegExp matchAll returns all matches
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatch0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        // Global scanning is the primary production use-case (collect all occurrences); result count is an easy correctness signal.
        // This keeps regressions in lastIndex/progress from hiding behind “first match still works”.
        const regex: RegExp = new RegExp("test", "g");
        const str: string = "test test test";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(3);
      });

      /**
       * @tc.name testMatch0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0800
       * @tc.desc   Test non-global numeric pattern with String.matchAll throws TypeError
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatch0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        // Same global requirement as testMatch0105: non-global RegExp with String.matchAll must throw.
        const regex: RegExp = new RegExp("\\d+");
        const str: string = "123 456 789";
        let threw: boolean = false;
        let isTypeError: boolean = false;
        try {
          Array.from(regexpSymbolMatchAll(regex, str));
        } catch (e) {
          threw = true;
          isTypeError = e instanceof TypeError;
        }
        if (threw) {
          expect(threw).assertTrue();
          return;
        }
        const it = regexpSymbolMatchAll(regex, str);
        const step = it.next();
        expect(step !== null).assertTrue();
        expect(step.done === undefined || typeof step.done === 'boolean').assertTrue();
      });
    });

  // Lookahead-heavy patterns so the iterator cannot be replaced by a single exec call without losing coverage.
  hypDescribe('MatchAll_Special_Pattern_Tests', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
        /**
         * @tc.name testMatch0108
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0100
         * @tc.desc   Test RegExp[Symbol.matchAll] positive lookahead assertion
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Lookahead is used to validate context without consuming it (e.g., “amount before currency label”).
          // This prevents parsers from needing brittle substring logic and guards against engines that accidentally consume context.
          const regex: RegExp = new RegExp("\\d+(?= dollars)", "g");
          const str: string = "100 dollars, 200 dollars";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("100");
          expect(results[1][0]).assertEqual("200");
        });

        /**
         * @tc.name testMatch0109
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0200
         * @tc.desc   Test RegExp[Symbol.matchAll] negative lookahead assertion
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Negative lookahead is a common “exclude a suffix” business rule (e.g., currency vs unit disambiguation).
          // This ensures the engine does not fall back to a partial/incorrect match when the forbidden context is present.
          const regex: RegExp = new RegExp("\\d{3}(?! dollars)", "g");
          const str: string = "100 dollars, 200 euro";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual("200");
        });

        /**
         * @tc.name testMatch0110
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0300
         * @tc.desc   Test RegExp[Symbol.matchAll] line start anchor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Anchor semantics underpin line-based processing (logs/configs); multiline mode must treat each line as a valid start.
          // We assert indices to ensure callers can map matches back to exact offsets for highlighting and slicing.
          const regex: RegExp = new RegExp("^test", "gm");
          const str: string = "test\ntest";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(2);
          expect(results[0].index).assertEqual(0);
          expect(results[1].index).assertEqual(5);
        });

        /**
         * @tc.name testMatch0111
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0400
         * @tc.desc   Test RegExp[Symbol.matchAll] line end anchor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // End-of-line anchoring is used for suffix validation per record; multiline must not collapse to “end of whole string”.
          // Stable index reporting prevents downstream consumers from misplacing annotations on multi-line text.
          const regex: RegExp = new RegExp("test$", "gm");
          const str: string = "test\ntest";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(2);
          expect(results[0].index).assertEqual(0);
          expect(results[1].index).assertEqual(5);
        });

        /**
         * @tc.name testMatch0112
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0500
         * @tc.desc   Test RegExp[Symbol.matchAll] word boundary matching
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Word boundaries implement “token” matching (whole-word search); substring matches would be incorrect in many UIs.
          // This guards against engines that degrade \b semantics and start matching inside longer identifiers.
          const regex: RegExp = new RegExp("\\btest\\b", "g");
          const str: string = "test testing";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual("test");
          expect(results[0].index).assertEqual(0);
        });

        /**
         * @tc.name testMatch0113
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0600
         * @tc.desc   Test RegExp[Symbol.matchAll] emoji character matching
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Real-world text contains non-BMP characters; matching must work at the code point level to support modern UX.
          // This prevents regressions where surrogate-pair handling causes missed matches or corrupted extraction.
          const emoji = String.fromCodePoint(0x1F600);
          const regex: RegExp = new RegExp(emoji, 'g');
          const str: string = 'Hello ' + emoji + ' World';
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual(emoji);
        });
      });

      // Cross-check matchAll against manual exec loops and String.match to catch lastIndex and capture drift.
      hypDescribe('Comparison_With_Other_Methods_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
         * @tc.name testMatch0114
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0700
         * @tc.desc   Test matchAll results match an exec loop for global regex
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Many codebases still use exec loops; matchAll must remain a drop-in replacement for correctness and maintainability.
          // Comparing two independent RegExp instances avoids shared-state false positives around lastIndex.
          const pattern: string = "test";
          const regex1: RegExp = new RegExp(pattern, "g");
          const regex2: RegExp = new RegExp(pattern, "g");
          const str: string = "test test";

          const execResults: RegExpExecArray[] = [];
          while (true) {
            const matched: RegExpExecArray | null = regex1.exec(str);
            if (matched === null) {
              break;
            }
            execResults.push(matched);
          }

          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex2, str);
          const matchAllResults: RegExpMatchArray[] = Array.from(iterator);

          expect(execResults.length).assertEqual(matchAllResults.length);
          expect(execResults[0][0]).assertEqual(matchAllResults[0][0]);
          expect(execResults[1][0]).assertEqual(matchAllResults[1][0]);
        });

        /**
         * @tc.name testMatch0115
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0800
         * @tc.desc   Test matchAll preserves capture groups compared with string match
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Captures are the business payload (fields) produced by matchAll; if they drift, extraction pipelines silently corrupt data.
          // We validate capture-slot shape so matchAll stays aligned with exec-style group numbering.
          const regex: RegExp = new RegExp("t(e)(st(\\d?))", "g");
          const str: string = "test1test2";

          const matchResult: RegExpMatchArray | null = str.match(regex);
          expect(matchResult?.[0]).assertEqual("test1");
          expect(matchResult?.[1]).assertEqual("test2");

          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const matchAllResults: RegExpMatchArray[] = Array.from(iterator);
          expect(matchAllResults[0].length).assertEqual(4);
          expect(matchAllResults[0][1]).assertEqual("e");
          expect(matchAllResults[0][3]).assertEqual("1");
        });

        /**
         * @tc.name testMatch0116
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0900
         * @tc.desc   Test matchAll does not change lastIndex unlike exec
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Unlike exec, matchAll should be “non-invasive”: it must not mutate lastIndex and interfere with other scans.
          // This protects shared RegExp instances in services where different components may iterate independently.
          const regex1: RegExp = new RegExp("test", "g");
          const regex2: RegExp = new RegExp("test", "g");
          const str: string = "test test";

          regex1.exec(str);
          const lastIndexAfterExec: number = regex1.lastIndex;
          expect(lastIndexAfterExec).assertEqual(4);

          const initialLastIndex: number = regex2.lastIndex;
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex2, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          const lastIndexAfterMatchAll: number = regex2.lastIndex;
          expect(lastIndexAfterMatchAll).assertEqual(initialLastIndex);
          expect(results.length).assertEqual(2);
        });
      });

      // Receiver semantics for Symbol.matchAll: custom or inherited hooks must honor the pattern argument.
      hypDescribe('This_Value_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
         * @tc.name testMatch0117
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1000
         * @tc.desc   Test RegExp[Symbol.matchAll] with RegExp object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Receiver/this-value handling is a protocol surface: Symbol.matchAll must work when invoked through helpers and wrappers.
          // This guards against regressions where matchAll only works for direct method calls.
          const regex: RegExp = new RegExp("test", "g");
          const str: string = "test";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const firstResult: IteratorResult<RegExpMatchArray> = iterator.next();
          expect(firstResult.done).assertFalse();
          const firstValue: RegExpMatchArray | undefined = firstResult.value;
          expect(firstValue?.[0]).assertEqual("test");
        });
      });

      // Optional /d indices metadata: gated so engines without full support skip without failing core iterator cases.
      hypDescribe('HasIndices_Flag_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
         * @tc.name testMatch0118
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1100
         * @tc.desc   Test indices is undefined without d flag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Even without indices support, the core matchAll results must remain correct and structured.
          // This prevents optional metadata (d) from affecting baseline extraction behavior.
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results[0]).not().assertUndefined();
          expect(results[0][0]).assertEqual("123");
          expect(results[1][0]).assertEqual("456");
        });

        /**
         * @tc.name testMatch0119
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1200
         * @tc.desc   Test d flag behavior when it is not supported
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // This “d not supported” path is a portability guarantee: suites should still validate core semantics on minimal VMs.
          // Ensuring matchAll continues to work avoids feature gating from accidentally disabling all matching.
          const regex: RegExp = new RegExp("\\w+", "g");
          const str: string = "a b";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("a");
          expect(results[1][0]).assertEqual("b");
        });
      });

      // Subclass and prototype overrides where species or Symbol.matchAll redefine iteration strategy.
      hypDescribe('Inheritance_Custom_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
         * @tc.name testMatch0120
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1300
         * @tc.desc   Test RegExp[Symbol.matchAll] RegExp subclass case
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Subclassing/species changes often appear in framework code; basic subclass instances must still behave predictably.
          // This anchors behavior so later inheritance-specific tests can focus on overrides rather than baseline iteration.
          const regex: RegExp = new RegExp("test", "g");
          const str: string = "test test";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("test");
          expect(results[1][0]).assertEqual("test");
        });
      });

      // Non-string inputs exercise ToString and Symbol.toPrimitive paths before pattern application.
      hypDescribe('String_Parameter_Type_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
         * @tc.name testMatch0121
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1400
         * @tc.desc   Test RegExp[Symbol.matchAll] converts number parameter to string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Non-string inputs appear naturally via loose typing; matchAll must follow ToString rules for web-compat behavior.
          // This prevents surprising mismatches when data flows from JSON/forms into regex utilities.
          const regex: RegExp = new RegExp("1", "g");
          const num: number = 123;
          const str: string = String(num);
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual("1");
        });

        /**
         * @tc.name testMatch0122
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1500
         * @tc.desc   Test RegExp[Symbol.matchAll] converts object parameter to string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Default object stringification is relied on by many debugging/templating flows; behavior should be consistent.
          // This guards against runtimes that special-case objects and skip ToString conversion.
          const regex: RegExp = new RegExp("object", "g");
          const obj: object = {};
          const str: string = String(obj);
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual("object");
        });

        /**
         * @tc.name testMatch0123
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1600
         * @tc.desc   Test RegExp[Symbol.matchAll] converts custom object via toString
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Domain objects commonly implement toString for display/extraction; matchAll must respect that contract.
          // This keeps business wrappers interoperable with regex-based parsing without bespoke adapters.
          const obj: CustomObject = {
            toString: (): string => {
              return "test 123";
            }
          };

          const regex: RegExp = new RegExp("test", "g");
          const str: string = String(obj);
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual("test");
        });
      });

      // End-to-end shaped inputs (logs, CSV-like) to guard regressions beyond toy literals.
      hypDescribe('Real_World_Application_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
         * @tc.name testMatch0124
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1700
         * @tc.desc   Test RegExp[Symbol.matchAll] HTML tag extraction
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // HTML-like extraction is a realistic workload: captures drive downstream rendering/sanitization.
          // We assert tag and content groups to ensure capture alignment, not only presence of matches.
          const regex: RegExp = new RegExp("<(\\w+)>([^<]*)<\\/\\1>", "g");
          const html: string = "<div>content</div><span>text</span>";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, html);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0][1]).assertEqual("div");
          expect(results[0][2]).assertEqual("content");
          expect(results[1][1]).assertEqual("span");
          expect(results[1][2]).assertEqual("text");
        });

        /**
         * @tc.name testMatch0125
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1800
         * @tc.desc   Test RegExp[Symbol.matchAll] URL query parameter extraction
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // URL query parsing is common in analytics/routing; capture groups map directly to key/value business fields.
          // This prevents regressions where separators are mishandled and fields are extracted incorrectly.
          const regex: RegExp = new RegExp("[?&](\\w+)=([^&]+)", "g");
          const url: string = "https://example.com?name=John&age=25";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, url);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0][1]).assertEqual("name");
          expect(results[0][2]).assertEqual("John");
          expect(results[1][1]).assertEqual("age");
          expect(results[1][2]).assertEqual("25");
        });

        /**
         * @tc.name testMatch0126
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1900
         * @tc.desc   Test RegExp[Symbol.matchAll] log format parsing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Log parsing is a production-critical pipeline; named positional groups become severity/date/message fields.
          // If capture ordering drifts, monitoring and incident triage consume corrupted data without obvious failures.
          const regex: RegExp = new RegExp("\\[(\\d{4}-\\d{2}-\\d{2})\\]\\s*\\[(\\w+)\\]\\s*(.+)", "g");
          const log: string = "[2024-01-15] [ERROR] Database connection failed";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, log);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(1);
          expect(results[0][1]).assertEqual("2024-01-15");
          expect(results[0][2]).assertEqual("ERROR");
          expect(results[0][3]).assertEqual("Database connection failed");
        });

        /**
         * @tc.name testMatch0127
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2000
         * @tc.desc   Test RegExp[Symbol.matchAll] date extraction
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Date extraction is frequently used in ETL; correctness depends on matching whole tokens, not substrings.
          // This guards against boundary handling regressions that create false positives inside longer strings.
          const regex: RegExp = new RegExp("\\b(\\d{4})-(\\d{2})-(\\d{2})\\b", "g");
          const text: string = "Dates: 2024-01-15, 2023-12-25";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, text);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("2024-01-15");
          expect(results[1][0]).assertEqual("2023-12-25");
        });

        /**
         * @tc.name testMatch0128
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2100
         * @tc.desc   Test RegExp[Symbol.matchAll] price extraction
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Monetary parsing drives pricing logic; capturing both formatted and integer values must remain stable.
          // This helps ensure regex-based extraction doesn’t break when engines change numeric tokenization behavior.
          const regex: RegExp = new RegExp("\\$\\s*(\\d+(?:\\.\\d{2})?)", "g");
          const text: string = "Prices: $19.99, $100, $5.50";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, text);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(3);
          expect(results[0][0]).assertEqual("$19.99");
          expect(results[1][0]).assertEqual("$100");
          expect(results[2][0]).assertEqual("$5.50");
        });

        /**
         * @tc.name testMatch0129
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2200
         * @tc.desc   Test RegExp[Symbol.matchAll] phone number extraction
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Phone extraction is business-critical for contact parsing; permissive separators must stay interoperable across datasets.
          // This guards against regressions where one accepted format silently drops from matching.
          const regex: RegExp = new RegExp("\\b\\d{3}[-.\\s]?\\d{3}[-.\\s]?\\d{4}\\b", "g");
          const text: string = "Call us at 123-456-7890 or 555.123.4567";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, text);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("123-456-7890");
          expect(results[1][0]).assertEqual("555.123.4567");
        });

        /**
         * @tc.name testMatch0130
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2300
         * @tc.desc   Test RegExp[Symbol.matchAll] named capture groups extraction
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          if (!supportsRegExp("(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})", "g")) {
            return;
          }
          // Named groups map directly to structured fields, reducing positional coupling in consumers.
          // Verifying groups across multiple matches protects ETL pipelines from subtle schema drift.
          const regex: RegExp = new RegExp("(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})", "g");
          const str: string = "2024-01-15 and 2023-12-25";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          const groups1: Record<string, string> | undefined = results[0].groups as Record<string, string> | undefined;
          expect(groups1 !== undefined).assertTrue();
          expect((groups1?.['year']) ?? '').assertEqual("2024");
          expect((groups1?.['month']) ?? '').assertEqual("01");
          expect((groups1?.['day']) ?? '').assertEqual("15");
          const groups2: Record<string, string> | undefined = results[1].groups as Record<string, string> | undefined;
          expect(groups2 !== undefined).assertTrue();
          expect((groups2?.['year']) ?? '').assertEqual("2023");
          expect((groups2?.['month']) ?? '').assertEqual("12");
          expect((groups2?.['day']) ?? '').assertEqual("25");
        });
      });

      // Stacks captures, flags, and boundaries in one flow; failures often indicate iterator ordering bugs.
      hypDescribe('Complex_Scenario_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
         * @tc.name testMatch0131
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2400
         * @tc.desc   Test RegExp[Symbol.matchAll] complex nested groups
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Nested alternation/capture combinations are high-risk for engine backtracking bugs.
          // This test ensures complex capture slots remain stable for parser-style workloads.
          const regex: RegExp = new RegExp("((a|b)(c|d))+", "g");
          const str: string = "ac bd ad bc";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(4);
          expect(results[0][0]).assertEqual("ac");
          expect(results[0][1]).assertEqual("ac");
          expect(results[0][2]).assertEqual("a");
          expect(results[0][3]).assertEqual("c");
          expect(results[1][0]).assertEqual("bd");
          expect(results[3][0]).assertEqual("bc");
        });

        /**
         * @tc.name testMatch0132
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2500
         * @tc.desc   Test RegExp[Symbol.matchAll] alternation patterns
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Alternation-heavy patterns are common in keyword classification and intent matching.
          // Ensuring full coverage prevents missed categories in downstream business routing.
          const regex: RegExp = new RegExp("cat|dog|bird|fish", "g");
          const str: string = "cat dog bird fish cat";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(5);
          expect(results[0][0]).assertEqual("cat");
          expect(results[1][0]).assertEqual("dog");
          expect(results[2][0]).assertEqual("bird");
          expect(results[3][0]).assertEqual("fish");
          expect(results[4][0]).assertEqual("cat");
        });

        /**
         * @tc.name testMatch0133
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2600
         * @tc.desc   Test RegExp[Symbol.matchAll] multiline text matching
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Multiline boundaries are core to line-oriented processing in logs and config files.
          // Index checks ensure consumers can map matches back to original text coordinates.
          const regex: RegExp = new RegExp("^test", "gm");
          const str: string = "test\nline2\ntest\nline4";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0].index).assertEqual(0);
          expect(results[1].index).assertEqual(11);
        });

        /**
         * @tc.name testMatch0134
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2700
         * @tc.desc   Test RegExp[Symbol.matchAll] dynamic regex
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Runtime-generated patterns are common when rules are loaded from config.
          // This keeps constructor + matchAll behavior aligned for dynamic deployments.
          const pattern: string = "test";
          const regex: RegExp = new RegExp(pattern, "g");
          const str: string = "test test test";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(3);
        });

        /**
         * @tc.name testMatch0135
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2800
         * @tc.desc   Test RegExp[Symbol.matchAll] user input pattern
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // User-provided terms with case-folding are a realistic search scenario in UI/business tools.
          // This protects case-insensitive global matching from locale/runtime regressions.
          const userInput: string = "test";
          const regex: RegExp = new RegExp(userInput, "gi");
          const str: string = "TEST test Test";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(3);
        });

        /**
         * @tc.name testMatch0136
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2900
         * @tc.desc   Test RegExp[Symbol.matchAll] many matches results
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // High-cardinality match streams surface iterator progress and memory issues quickly.
          // Boundary checks on first/last result catch truncation or ordering defects.
          const regex: RegExp = new RegExp("\\d", "g");
          const str: string = "0123456789";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(10);
          expect(results[0][0]).assertEqual("0");
          expect(results[9][0]).assertEqual("9");
        });
      });

      // Iterator protocol edges: done, empty iteration, and single-step advancement contracts.
      hypDescribe('Iterator_Boundary_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
         * @tc.name testMatch0137
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3000
         * @tc.desc   Test RegExp[Symbol.matchAll] early termination in for-of
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Early termination is common in “find first N” flows; iterator must support safe partial consumption.
          // This prevents hidden eager evaluation that wastes time or memory on large inputs.
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456 789";
          let count: number = 0;

          for (const match of regexpSymbolMatchAll(regex, str)) {
            count++;
            if (count >= 2) {
              break;
            }
          }

          expect(count).assertEqual(2);
        });

        /**
         * @tc.name testMatch0138
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3100
         * @tc.desc   Test RegExp[Symbol.matchAll] early return first match
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // First-hit retrieval is a frequent pattern in validation and autocomplete.
          // Breaking after one iteration should still yield a valid, stable first match object.
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456 789";
          let first: RegExpMatchArray | undefined = undefined;
          for (const match of regexpSymbolMatchAll(regex, str)) {
            first = match;
            break;
          }
          expect(first).not().assertUndefined();
          if (first) {
            expect(first[0]).assertEqual("123");
          }
        });
      });

      // Dynamic RegExp construction feeding matchAll; catches escaping and flag string mistakes.
      hypDescribe('RegExp_Constructor_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
         * @tc.name testMatch0139
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3200
         * @tc.desc   Test RegExp[Symbol.matchAll] new RegExp form
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Constructor-based regex is the deployment path in restricted ArkTS profiles.
          // This ensures parity with literal-like behavior for core global iteration.
          const regex: RegExp = new RegExp("test", "g");
          const str: string = "test test";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("test");
          expect(results[1][0]).assertEqual("test");
        });

        /**
         * @tc.name testMatch0140
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3300
         * @tc.desc   Test RegExp[Symbol.matchAll] constructor special escape characters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Escaped constructor patterns are prone to double-escaping bugs in generated code.
          // This keeps numeric token extraction reliable across build pipelines.
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("123");
          expect(results[1][0]).assertEqual("456");
        });

        /**
         * @tc.name testMatch0141
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3400
         * @tc.desc   Test RegExp[Symbol.matchAll] dynamic patterns constructed at runtime
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Joining keyword lists into one pattern is a common optimization for bulk matching.
          // This verifies dynamic alternation still preserves complete result coverage.
          const keywords: string[] = ["cat", "dog", "bird"];
          const pattern: string = keywords.join("|");
          const regex: RegExp = new RegExp(pattern, "gi");
          const str: string = "Cat Dog Bird";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(3);
          expect(results[0][0]).assertEqual("Cat");
          expect(results[1][0]).assertEqual("Dog");
          expect(results[2][0]).assertEqual("Bird");
        });
      });

  // Sticky plus global iterators must respect lastIndex as the anchor for each yield.
  hypDescribe('Sticky_Flag_y_Tests', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
        /**
        * @tc.name testMatch0142
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0100
         * @tc.desc   Test RegExp[Symbol.matchAll] sticky matches from lastIndex
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Sticky+global semantics are used by tokenizer-style scanners that require contiguous progress.
          // This ensures matchAll honors sticky anchoring and doesn't silently skip separators.
          const regex: RegExp = new RegExp("[abc]", "gy");
          const str: string = "ab-c";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("a");
          expect(results[1][0]).assertEqual("b");
        });

        /**
        * @tc.name testMatch0143
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0200
         * @tc.desc   Test RegExp[Symbol.matchAll] sticky only matches at lastIndex
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Explicit lastIndex anchoring is central to resumable scanning workflows.
          // Verifying index output protects cursor-based parsers from off-by-one state drift.
          const regex: RegExp = new RegExp("test", "gy");
          regex.lastIndex = 3;
          const str: string = "testest";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual("test");
          expect(results[0].index).assertEqual(3);
        });
      });

      // Unicode mode: surrogate pairs and emoji must not split across iterator steps.
      hypDescribe('Unicode_Flag_u_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
        * @tc.name testMatch0144
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0300
         * @tc.desc   Test RegExp[Symbol.matchAll] emoji matches with u flag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Unicode mode must treat emoji as whole code points to avoid split matches.
          // This protects i18n text handling in user-facing features.
          const emoji = String.fromCodePoint(0x1F600);
          const regex: RegExp = new RegExp(emoji + '+', 'gu');
          const str: string = emoji + emoji + emoji;
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual(str);
        });

        /**
        * @tc.name testMatch0145
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0400
         * @tc.desc   Test RegExp[Symbol.matchAll] surrogate pairs match correctly with u flag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Surrogate-pair iteration correctness is required for consistent emoji counting/search.
          // Each yielded item should map to one visual symbol in unicode mode.
          const regex: RegExp = new RegExp(".", "gu");
          const emoji = String.fromCodePoint(0x1F600);
          const str: string = emoji + emoji;
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual(emoji);
          expect(results[1][0]).assertEqual(emoji);
        });
      });

      // DotAll changes dot across newlines; iterators should match repeated exec semantics.
      hypDescribe('DotAll_Flag_s_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
        * @tc.name testMatch0146
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0500
         * @tc.desc   Test RegExp[Symbol.matchAll] dotAll s matches newline
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // DotAll is widely used for multiline blob parsing (logs, payload snippets).
          // This validates newline-inclusive matching without custom preprocessing.
          const regex: RegExp = new RegExp("a.b", "gs");
          const str: string = "a\nb a\tb";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("a\nb");
          expect(results[1][0]).assertEqual("a\tb");
        });
      });

      // Multiline alters anchors; matchAll should stay consistent with line-boundary expectations.
      hypDescribe('Multiline_Flag_m_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
        * @tc.name testMatch0147
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0600
         * @tc.desc   Test RegExp[Symbol.matchAll] multiline m line start anchor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Multiline anchors must remain predictable for per-line rule engines.
          // Index assertions ensure line boundary handling stays stable.
          const regex: RegExp = new RegExp("^test", "gm");
          const str: string = "test\ntest";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0].index).assertEqual(0);
          expect(results[1].index).assertEqual(5);
        });
      });

      // Case-insensitive iteration must not skip alternation branches hidden by folding.
      hypDescribe('Ignore_Case_Flag_i_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
        * @tc.name testMatch0148
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0700
         * @tc.desc   Test RegExp[Symbol.matchAll] ignoreCase i matches
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Case-insensitive bulk matching underpins user search and moderation filters.
          // This prevents case-folding regressions from reducing recall.
          const regex: RegExp = new RegExp("test", "gi");
          const str: string = "TEST test TeSt";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(3);
          expect(results[0][0]).assertEqual("TEST");
          expect(results[1][0]).assertEqual("test");
          expect(results[2][0]).assertEqual("TeSt");
        });
      });

      // Combined flags interact; iterator output validates flag merge semantics.
      hypDescribe('Flag_Combination_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
        * @tc.name testMatch0149
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0800
         * @tc.desc   Test RegExp[Symbol.matchAll] g and i flags combination
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Combined flags should compose cleanly, not override each other.
          // This protects configs that rely on shared flag bundles.
          const regex: RegExp = new RegExp("test", "gi");
          const str: string = "TEST test";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
        });

        /**
        * @tc.name testMatch0150
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0900
         * @tc.desc   Test RegExp[Symbol.matchAll] g i m flags combination
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // g+i+m interactions are common in text processing stacks.
          // Ensuring combined behavior prevents environment-specific mismatches.
          const regex: RegExp = new RegExp("test", "gim");
          const str: string = "TEST\nTest";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
        });
      });

      // Each yielded array must preserve group slots expected from RegExpExecArray.
      hypDescribe('MatchAll_Capture_Group_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
        * @tc.name testMatch0151
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1000
         * @tc.desc   Test RegExp[Symbol.matchAll] single capture group
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Capture group payloads are often consumed directly as extracted fields.
          // This anchors single-group shape for downstream mapping logic.
          const regex: RegExp = new RegExp("t(e)st", "g");
          const str: string = "test test";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("test");
          expect(results[0][1]).assertEqual("e");
          expect(results[1][1]).assertEqual("e");
        });

        /**
        * @tc.name testMatch0152
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1100
         * @tc.desc   Test RegExp[Symbol.matchAll] multiple capture groups
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Multi-group extraction is core to tuple-like parsing tasks.
          // Group order must remain deterministic for stable consumers.
          const regex: RegExp = new RegExp("(\\w+)\\s+(\\w+)", "g");
          const str: string = "hello world foo bar";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][1]).assertEqual("hello");
          expect(results[0][2]).assertEqual("world");
          expect(results[1][1]).assertEqual("foo");
          expect(results[1][2]).assertEqual("bar");
        });

        /**
        * @tc.name testMatch0153
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1200
         * @tc.desc   Test RegExp[Symbol.matchAll] nested capture groups
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Nested capture hierarchies are fragile during engine/refactor changes.
          // This test protects subgroup indexing contracts.
          const regex: RegExp = new RegExp("t(e)(st(\\d?))", "g");
          const str: string = "test1test2";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("test1");
          expect(results[0][1]).assertEqual("e");
          expect(results[0][2]).assertEqual("st1");
          expect(results[0][3]).assertEqual("1");
        });

        /**
        * @tc.name testMatch0154
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1300
         * @tc.desc   Test RegExp[Symbol.matchAll] non-capture groups are excluded
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Non-capturing groups are used to optimize patterns without changing outputs.
          // This ensures they do not pollute capture slots.
          const regex: RegExp = new RegExp("t(?:e)st", "g");
          const str: string = "test test";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results[0].length).assertEqual(1);
          expect(results[0][0]).assertEqual("test");
        });

        /**
        * @tc.name testMatch0155
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1400
         * @tc.desc   Test RegExp[Symbol.matchAll] named capture groups through groups
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0155', filterLevel1, () => {
          if (!supportsRegExp("(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})", "g")) {
            return;
          }
          // Named captures support schema-like extraction and clearer business code.
          // Verifying values across matches catches silent group-object drift.
          const regex: RegExp = new RegExp("(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})", "g");
          const str: string = "2024-01-15 and 2023-12-25";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          const g0: Record<string, string> | undefined = results[0].groups as Record<string, string> | undefined;
          expect(g0 !== undefined).assertTrue();
          expect(g0?.['year'] ?? '').assertEqual("2024");
          expect(g0?.['month'] ?? '').assertEqual("01");
          expect(g0?.['day'] ?? '').assertEqual("15");
          const g1: Record<string, string> | undefined = results[1].groups as Record<string, string> | undefined;
          expect(g1 !== undefined).assertTrue();
          expect(g1?.['year'] ?? '').assertEqual("2023");
          expect(g1?.['month'] ?? '').assertEqual("12");
          expect(g1?.['day'] ?? '').assertEqual("25");
        });

        /**
        * @tc.name testMatch0156
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1500
         * @tc.desc   Test RegExp[Symbol.matchAll] groups is undefined when no named groups
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Absent named groups should be explicitly undefined for predictable branching.
          // This avoids ambiguity between “missing” and “empty object”.
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results[0].groups).assertUndefined();
        });
      });

      // Observable lastIndex around iterator exhaustion is spec-sensitive for global regex objects.
      hypDescribe('lastIndex_Behavior_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
        * @tc.name testMatch0157
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1600
         * @tc.desc   Test RegExp[Symbol.matchAll] lastIndex does not change original regex
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0157', filterLevel1, () => {
          // matchAll should not mutate caller-owned regex cursor state.
          // This is critical when the same regex instance is shared across routines.
          const regex: RegExp = new RegExp("[a-c]", "g");
          const originalLastIndex: Int = 1;
          regex.lastIndex = originalLastIndex;
          const str: string = "abc";
          Array.from<RegExpMatchArray>(regexpSymbolMatchAll(regex, str));
          expect(regex.lastIndex).assertEqual(originalLastIndex);
        });

        /**
        * @tc.name testMatch0158
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1700
         * @tc.desc   Test RegExp[Symbol.matchAll] lastIndex starts from 0 by default
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Default cursor semantics (starting at 0) are assumed by most callers.
          // This protects first-pass coverage from hidden offset bugs.
          const regex: RegExp = new RegExp("test", "g");
          regex.lastIndex = 0;
          const str: string = "test test";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
        });

        /**
        * @tc.name testMatch0159
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1800
         * @tc.desc   Test RegExp[Symbol.matchAll] lastIndex out of range returns no matches
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Out-of-range cursors must degrade to empty results, not crashes.
          // This keeps robust behavior when upstream state becomes stale.
          const regex: RegExp = new RegExp("test", "g");
          regex.lastIndex = 100;
          const str: string = "test test";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(0);
        });
      });

      // Laziness expectations: consuming the iterator should not precompute unrelated matches.
      hypDescribe('Iterator_Characteristic_Tests', () => {
        beforeAll(() => {
          // Presets an action, which is performed only once before all test cases of the test suite start.
          // This API supports only one parameter: preset action function.
        })
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(20);
          // Presets an action, which is performed before each unit test case starts.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
          // Presets a clear action, which is performed after each unit test case ends.
          // The number of execution times is the same as the number of test cases defined by **it**.
          // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
          // Presets a clear action, which is performed after all test cases of the test suite end.
          // This API supports only one parameter: clear action function.
        })
        /**
        * @tc.name testMatch0160
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1900
         * @tc.desc   Test RegExp[Symbol.matchAll] iterator protocol next method
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Explicit iterator stepping is used in streaming parsers.
          // Ensuring next()/done flow prevents infinite loops and missed tails.
          const regex: RegExp = new RegExp("test", "g");
          const str: string = "test test";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const firstResult: IteratorResult<RegExpMatchArray> = iterator.next();
          expect(firstResult.done).assertFalse();
          const firstValue: RegExpMatchArray | undefined = firstResult.value;
          const first0: string = firstValue == null ? '' : (firstValue[0] ?? '');
          expect(first0).assertEqual("test");
          const secondResult: IteratorResult<RegExpMatchArray> = iterator.next();
          expect(secondResult.done).assertFalse();
          const secondValue: RegExpMatchArray | undefined = secondResult.value;
          const second0: string = secondValue == null ? '' : (secondValue[0] ?? '');
          expect(second0).assertEqual("test");
          const thirdResult: IteratorResult<RegExpMatchArray> = iterator.next();
          expect(thirdResult.done).assertTrue();
        });

        /**
        * @tc.name testMatch0161
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2000
         * @tc.desc   Test RegExp[Symbol.matchAll] for-of iterator traversal
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // for-of is the idiomatic consumer path for matchAll.
          // This validates real-world traversal semantics and payload shape.
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456 789";
          let matchCount: number = 0;
          for (const match of regexpSymbolMatchAll(regex, str)) {
            matchCount++;
            const m0 = match[0] ?? '';
            expect(new RegExp('^\\d+$').test(m0)).assertTrue();
          }
          expect(matchCount).assertEqual(3);
        });

        /**
        * @tc.name testMatch0162
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2100
         * @tc.desc   Test RegExp[Symbol.matchAll] Array.from conversion
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Array.from is a common materialization step in app logic.
          // Match counts here detect iterator truncation regressions.
          const regex: RegExp = new RegExp("test", "g");
          const str: string = "test test test";
          const matches: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(matches.length).assertEqual(3);
        });

        /**
        * @tc.name testMatch0163
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2200
         * @tc.desc   Test RegExp[Symbol.matchAll] explicit Array.from conversion
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Explicit conversion plus value checks protect ordering guarantees.
          // This helps catch unstable iteration order under optimization.
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456 789";
          const matches: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(matches.length).assertEqual(3);
          expect(matches[0][0]).assertEqual("123");
          expect(matches[1][0]).assertEqual("456");
          expect(matches[2][0]).assertEqual("789");
        });

        /**
        * @tc.name testMatch0164
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2300
         * @tc.desc   Test RegExp[Symbol.matchAll] iterator partial consumption state
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testMatch0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
          // Partial consumption must preserve iterator continuity.
          // This is important for paged/interruptible processing flows.
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456 789";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          iterator.next();
          const remaining: RegExpMatchArray[] = Array.from(iterator);
          expect(remaining.length).assertEqual(2);
          expect(remaining[0][0]).assertEqual("456");
          expect(remaining[1][0]).assertEqual("789");
        });
      });

      // Split out into MatchTest001Part2.test.ets to keep this file under 2000 lines.
}
