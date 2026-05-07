import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';

export default function Fdsan01Test() {
  describe('Fdsan01Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_0100
     * @tc.name testFdsan01Chapter0001
     * @tc.desc Set level to WARN_ALWAYS, verify old level and get level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanSetErrorLevelWarnAlways();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_0200
     * @tc.name testFdsan01Chapter0002
     * @tc.desc Set level to WARN_ONCE, verify old level and get level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanSetErrorLevelWarnOnce();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_0300
     * @tc.name testFdsan01Chapter0003
     * @tc.desc Set level to FATAL, verify old level and get level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanSetErrorLevelFatal();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_0400
     * @tc.name testFdsan01Chapter0004
     * @tc.desc Set level to DISABLED, verify old level and get level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanSetErrorLevelDisabled();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_0500
     * @tc.name testFdsan01Chapter0005
     * @tc.desc Set level with invalid enum value 100, verify system not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanSetErrorLevelInvalidEnum();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_0600
     * @tc.name testFdsan01Chapter0006
     * @tc.desc Create owner tag with type FILE and tag 0x12345678, verify return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanCreateOwnerTagNormal();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_0700
     * @tc.name testFdsan01Chapter0007
     * @tc.desc Create owner tag with type DIRECTORY and tag 0, verify high 8 bits are type and low 56 bits are 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanCreateOwnerTagZero();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_0800
     * @tc.name testFdsan01Chapter0008
     * @tc.desc Create owner tag with invalid type 99, verify system not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanCreateOwnerTagInvalidType();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_0900
     * @tc.name testFdsan01Chapter0009
     * @tc.desc Open fd, set tag via exchange, then get owner tag, verify returns set tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanGetOwnerTagWithTagSet();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_1000
     * @tc.name testFdsan01Chapter0010
     * @tc.desc Open fd without setting tag, call get, verify returns 0 or default tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanGetOwnerTagNoTagSet();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_1100
     * @tc.name testFdsan01Chapter0011
     * @tc.desc Pass invalid fd -1 to get owner tag, verify returns 0 or error without crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanGetOwnerTagInvalidFd();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_1200
     * @tc.name testFdsan01Chapter0012
     * @tc.desc Call get_tag_type and get_tag_value with known tag, verify type and value correctly separated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanGetTagTypeAndValue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_1300
     * @tc.name testFdsan01Chapter0013
     * @tc.desc Exchange owner tag from 0 to new, verify success without warning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanExchangeOwnerTagZeroToNew();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_1400
     * @tc.name testFdsan01Chapter0014
     * @tc.desc Exchange owner tag from old to new, verify successful exchange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanExchangeOwnerTagOldToNew();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_1500
     * @tc.name testFdsan01Chapter0015
     * @tc.desc Exchange with mismatched expected tag, verify fdsan error triggered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanExchangeOwnerTagMismatch();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_1600
     * @tc.name testFdsan01Chapter0016
     * @tc.desc Exchange with invalid fd -1, verify no operation or silent failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanExchangeOwnerTagInvalidFd();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_1700
     * @tc.name testFdsan01Chapter0017
     * @tc.desc Close fd with matching tag, verify returns 0 and fd closed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanCloseWithTagMatch();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_1800
     * @tc.name testFdsan01Chapter0018
     * @tc.desc Close fd with mismatched tag, verify fdsan error triggered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanCloseWithTagMismatch();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_1900
     * @tc.name testFdsan01Chapter0019
     * @tc.desc Close fd that already closed, verify error triggered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanCloseWithTagFdAlreadyClosed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_2000
     * @tc.name testFdsan01Chapter0020
     * @tc.desc Close with invalid fd -1, verify returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanCloseWithTagInvalidFd();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_2100
     * @tc.name testFdsan01Chapter0021
     * @tc.desc Set error level with negative or over range enum, verify global state not corrupted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanSetErrorLevelNegativeOrOverRange();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_2200
     * @tc.name testFdsan01Chapter0022
     * @tc.desc Create owner tag with type out of range, verify returns undefined value without crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanCreateOwnerTagTypeOutOfRange();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_2300
     * @tc.name testFdsan01Chapter0023
     * @tc.desc Exchange owner tag with fd -1, verify no side effect and no crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanExchangeOwnerTagFdMinusOne();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_2400
     * @tc.name testFdsan01Chapter0024
     * @tc.desc Close with fd -1, verify returns -1 and errno is EBADF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanCloseWithTagFdMinusOne();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_2500
     * @tc.name testFdsan01Chapter0025
     * @tc.desc Get owner tag with fd -1, verify returns 0 or special value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanGetOwnerTagFdMinusOne();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_2600
     * @tc.name testFdsan01Chapter0026
     * @tc.desc Get tag type with tag 0, verify returns unknown or empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanGetTagTypeTagZero();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_2700
     * @tc.name testFdsan01Chapter0027
     * @tc.desc Get tag value with tag all ones, verify returns lower 56 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanGetTagValueTagAllOne();
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_2800
     * @tc.name testFdsan01Chapter0028
     * @tc.desc Transfer fd ownership: open -> exchange(tagA) -> exchange(tagA, tagB) -> close_with_tag(tagB), verify normal close without warning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanComTransferFdOwnership();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_2900
     * @tc.name testFdsan01Chapter0029
     * @tc.desc Move semantics RAII: use custom fdsan_fd class move constructor, verify old releases ownership, new obtains it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanComMoveSemanticsRaii();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_3000
     * @tc.name testFdsan01Chapter0030
     * @tc.desc Nested error level FATAL: trigger double close, verify program abort and generate crash dump file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanComNestedErrorLevelFatal();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_3100
     * @tc.name testFdsan01Chapter0031
     * @tc.desc Multi-thread mixed operation: two threads exchange and close same fd, verify fdsan detects illegal access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanComMultiThreadMixedOperation();
      expect(result).assertTrue();
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_3200
     * @tc.name testFdsan01Chapter0032
     * @tc.desc Same thread double close: open -> close -> close, verify fdsan reports error depending on level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanDoubleCloseSameThread();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_3300
     * @tc.name testFdsan01Chapter0033
     * @tc.desc Cross thread double close: thread A closes fd that thread B is using, verify owner mismatch detected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanDoubleCloseCrossThread();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_3400
     * @tc.name testFdsan01Chapter0034
     * @tc.desc Use after close: open -> close -> read(fd), verify read returns EBADF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanUseAfterClose();
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_3500
     * @tc.name testFdsan01Chapter0035
     * @tc.desc Set level to WARN_ONCE, trigger double close, verify first time prints warning, second time no warning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanLevelWarnOnce();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_3600
     * @tc.name testFdsan01Chapter0036
     * @tc.desc Set level to WARN_ALWAYS, trigger double close, verify every double close prints warning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanLevelWarnAlways();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_3700
     * @tc.name testFdsan01Chapter0037
     * @tc.desc Set level to FATAL, trigger double close, verify process abort and crash dump generated.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanLevelFatal();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_3800
     * @tc.name testFdsan01Chapter0038
     * @tc.desc Set level to DISABLED, trigger double close, verify no warning at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanLevelDisabled();
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_3900
     * @tc.name testFdsan01Chapter0039
     * @tc.desc Open with fopen, close with close(fileno(f)) in another thread, verify fdsan detects owner mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanStdlibFopenFclose();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_4000
     * @tc.name testFdsan01Chapter0040
     * @tc.desc Open with fdopen, then close fd incorrectly, verify FILE* tag detected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanStdlibFdopen();
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FDSANTESTONE_4100
     * @tc.name testFdsan01Chapter0041
     * @tc.desc Signal safety: install signal handler, call close(fd) in handler, trigger signal, verify no crash or undefined behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFdsan01Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = testNapi.testFdsanSignalSafety();
      expect(result).assertTrue();
    });
  })
}