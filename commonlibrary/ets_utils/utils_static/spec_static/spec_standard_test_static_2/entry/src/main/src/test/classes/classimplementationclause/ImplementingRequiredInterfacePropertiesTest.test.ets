import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

interface I {
  get text(): string
  set text(s: string)
}

class B implements I {
  private _text : string = "";

  get text(): string {
    return this._text;
  }

  set text(s: string) {
    this._text = s;
  }
}


export default function ImplementingRequiredInterfacePropertiesTest():void {
  describe('ImplementingRequiredInterfacePropertiesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_IMPLEMENTING_REQUIRED_INTERFACE_PROPERTIESTEST_0100
     * @tc.name      testImplementingRequiredInterfaceProperties0001
     * @tc.desc      Implementing getter from interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplementingRequiredInterfaceProperties0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testImplementingRequiredInterfaceProperties0001';
      let instance: B = new B();
      instance.text = "text";
      expect(instance.text).assertEqual("text");
    });

  })
}