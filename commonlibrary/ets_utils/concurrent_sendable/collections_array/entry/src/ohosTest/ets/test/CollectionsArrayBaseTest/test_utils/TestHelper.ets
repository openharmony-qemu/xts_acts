export class TestHelper {
  static log(testName: string, message: string): void {
    console.info('[ArrayTest][' + testName + '] ' + message);
  }

  static assertEquals(actual: Object | undefined | null, expected: Object | undefined | null, message: string): void {
    if (actual === undefined && expected === undefined) {
      return;
    }
    if (actual === null && expected === null) {
      return;
    }
    if (typeof actual === 'number' && typeof expected === 'number' && isNaN(actual) && isNaN(expected)) {
      return;
    }
    if (actual !== expected) {
      throw new Error('Assertion failed: ' + message + '. Expected: ' + expected + ', Actual: ' + actual);
    }
  }

  static assertTrue(condition: boolean, message: string): void {
    if (!condition) {
      throw new Error('Assertion failed: ' + message);
    }
  }

  static assertNotNull(value: Object | undefined | null, message: string): void {
    if (value === null || value === undefined) {
      throw new Error('Assertion failed: ' + message + '. Value should not be null/undefined');
    }
  }

  static assertNull(value: Object | undefined | null, message: string): void {
    if (value !== null && value !== undefined) {
      throw new Error('Assertion failed: ' + message + '. Value should be null/undefined');
    }
  }
}
