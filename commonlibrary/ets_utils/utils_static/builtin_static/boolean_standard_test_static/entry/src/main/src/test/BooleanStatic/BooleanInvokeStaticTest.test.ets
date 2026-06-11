/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

interface BooleanInvokeAppConfig {
  debugMode: boolean;
  enableCache: boolean;
  logErrors: boolean;
}

interface BooleanInvokeStatus {
  initialized: boolean;
  loaded: boolean;
  error: boolean;
}

class BooleanInvokeConfig {
  enabled: boolean = Boolean.$_invoke();
  debugMode: boolean = Boolean.$_invoke();

  enable(): void {
    this.enabled = true;
  }

  isEnabled(): boolean {
    return this.enabled;
  }
}

class BooleanInvokeFactory {
  static createDefaultBoolean(): boolean {
    return Boolean.$_invoke();
  }
}

class BooleanInvokeFeature {
  enabled: boolean;

  constructor(enabled: boolean = Boolean.$_invoke()) {
    this.enabled = enabled;
  }

  toggle(): void {
    this.enabled = !this.enabled;
  }
}

class BooleanInvokeStateManager {
  private initialized: boolean = Boolean.$_invoke();
  private loaded: boolean = Boolean.$_invoke();
  private error: boolean = Boolean.$_invoke();

  initialize(): void {
    this.initialized = true;
    this.loaded = true;
  }

  setError(): void {
    this.error = true;
  }

  getStatus(): BooleanInvokeStatus {
    return {
      initialized: this.initialized,
      loaded: this.loaded,
      error: this.error
    };
  }
}

function processBooleanInvoke(enabled: boolean = Boolean.$_invoke()): string {
  return enabled ? "enabled" : "disabled";
}

function mapBooleanInvoke(fn: () => boolean): boolean {
  return fn();
}

function createBooleanInvokeConfig(): BooleanInvokeAppConfig {
  return {
    debugMode: Boolean.$_invoke(),
    enableCache: Boolean.$_invoke(),
    logErrors: Boolean.$_invoke()
  };
}

export default function BooleanInvokeTest(): void {
  describe("BooleanInvokeTest", (): void => {
    beforeAll((): void => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_0100
     * @tc.name      testBooleanInvokeNoParameter
     * @tc.desc      Boolean.$_invoke() creates the default primitive boolean value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeNoParameter", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Boolean.$_invoke();
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_0200
     * @tc.name      testBooleanInvokeReturnType
     * @tc.desc      Boolean.$_invoke() returns a primitive boolean rather than Boolean object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeReturnType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Boolean.$_invoke();
      expect(typeof result).assertEqual("boolean");
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_0300
     * @tc.name      testBooleanInvokeDefaultValue
     * @tc.desc      Boolean.$_invoke() returns false by default.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeDefaultValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const defaultBool: boolean = Boolean.$_invoke();
      expect(defaultBool).assertEqual(false);
      expect(defaultBool === false).assertEqual(true);
      expect(defaultBool !== true).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_0400
     * @tc.name      testBooleanInvokeMultipleCalls
     * @tc.desc      Boolean.$_invoke() returns consistent results across calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeMultipleCalls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: boolean = Boolean.$_invoke();
      const bool2: boolean = Boolean.$_invoke();
      const bool3: boolean = Boolean.$_invoke();

      expect(bool1).assertEqual(false);
      expect(bool2).assertEqual(false);
      expect(bool3).assertEqual(false);
      expect(bool1).assertEqual(bool2);
      expect(bool2).assertEqual(bool3);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_0500
     * @tc.name      testBooleanInvokeBooleanFeatures
     * @tc.desc      Boolean.$_invoke() result can be used in boolean expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeBooleanFeatures", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Boolean.$_invoke();
      let branch: string = "true";

      if (result) {
        expect().assertFail();
      } else {
        branch = "false";
      }

      expect(branch).assertEqual("false");
      expect(result && true).assertEqual(false);
      expect(result || true).assertEqual(true);
      expect(!result).assertEqual(true);
      expect(result ? "yes" : "no").assertEqual("no");
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_0600
     * @tc.name      testBooleanInvokeCompareWithNewBoolean
     * @tc.desc      Boolean.$_invoke() returns primitive value while new Boolean() returns an object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeCompareWithNewBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const primitive: boolean = Boolean.$_invoke();
      const obj: Boolean = new Boolean();

      expect(typeof primitive).assertEqual("boolean");
      expect(obj instanceof Boolean).assertEqual(true);
      expect(primitive).assertEqual(obj.toBoolean());
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_0700
     * @tc.name      testBooleanInvokeCompareWithFalse
     * @tc.desc      Boolean.$_invoke() is equivalent to the false literal by value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeCompareWithFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: boolean = Boolean.$_invoke();
      const bool2: boolean = false;

      expect(bool1).assertEqual(false);
      expect(bool2).assertEqual(false);
      expect(bool1 === bool2).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_0800
     * @tc.name      testBooleanInvokeStaticCall
     * @tc.desc      Boolean.$_invoke() can be called as a Boolean static method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeStaticCall", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Boolean.$_invoke();
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_0900
     * @tc.name      testBooleanInvokeVariableInitialization
     * @tc.desc      Boolean.$_invoke() initializes boolean variables.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeVariableInitialization", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean = Boolean.$_invoke();
      expect(flag).assertEqual(false);

      flag = true;
      expect(flag).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_1000
     * @tc.name      testBooleanInvokeDefaultParameter
     * @tc.desc      Boolean.$_invoke() can be used as a function default parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeDefaultParameter", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(processBooleanInvoke()).assertEqual("disabled");
      expect(processBooleanInvoke(true)).assertEqual("enabled");
      expect(processBooleanInvoke(false)).assertEqual("disabled");
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_1100
     * @tc.name      testBooleanInvokeObjectPropertyInitialization
     * @tc.desc      Boolean.$_invoke() initializes object properties.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeObjectPropertyInitialization", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const config: BooleanInvokeConfig = new BooleanInvokeConfig();
      expect(config.enabled).assertEqual(false);
      expect(config.debugMode).assertEqual(false);

      config.enable();
      expect(config.isEnabled()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_1200
     * @tc.name      testBooleanInvokeConditionalUse
     * @tc.desc      Boolean.$_invoke() result can be used in conditional logic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeConditionalUse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const flag: boolean = Boolean.$_invoke();
      let status: string = "ON";

      if (flag) {
        status = "ON";
      } else {
        status = "OFF";
      }

      expect(status).assertEqual("OFF");
      expect(flag ? "ON" : "OFF").assertEqual("OFF");
      expect(flag || true).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_1300
     * @tc.name      testBooleanInvokeContinuousCalls
     * @tc.desc      Boolean.$_invoke() remains false during continuous calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeContinuousCalls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: boolean[] = [];
      for (let i: int = 0; i < 100; i++) {
        results.push(Boolean.$_invoke());
      }

      expect(results.length).assertEqual(100);
      for (let index: int = 0; index < results.length; index++) {
        expect(results[index]).assertEqual(false);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_1400
     * @tc.name      testBooleanInvokeNestedExpression
     * @tc.desc      Boolean.$_invoke() works inside expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeNestedExpression", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Boolean.$_invoke();
      const value: int = Boolean.$_invoke() ? 1 : 0;

      expect(result).assertEqual(false);
      expect(value).assertEqual(0);
      expect(!Boolean.$_invoke()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_1500
     * @tc.name      testBooleanInvokeFactoryMethod
     * @tc.desc      Boolean.$_invoke() can be used as a default value factory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeFactoryMethod", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool: boolean = BooleanInvokeFactory.createDefaultBoolean();
      expect(bool).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_1600
     * @tc.name      testBooleanInvokeFunctionalUsage
     * @tc.desc      Boolean.$_invoke() can be passed as a function returning boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeFunctionalUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = mapBooleanInvoke((): boolean => {
        return Boolean.$_invoke();
      });
      let values: boolean[] = [1, 2, 3].map((value: int): boolean => {
        return Boolean.$_invoke();
      });

      expect(result).assertEqual(false);
      expect(values.length).assertEqual(3);
      for (let index: int = 0; index < values.length; index++) {
        expect(values[index]).assertEqual(false);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_1700
     * @tc.name      testBooleanInvokeChainUsage
     * @tc.desc      Boolean.$_invoke() can be used by logic and ternary expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeChainUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool: boolean = Boolean.$_invoke();
      const result: boolean = !bool;
      const value: string = bool ? "yes" : "no";

      expect(result).assertEqual(true);
      expect(value).assertEqual("no");
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_1800
     * @tc.name      testBooleanInvokeFeatureDefault
     * @tc.desc      Boolean.$_invoke() expresses an explicit default feature state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeFeatureDefault", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const feature: BooleanInvokeFeature = new BooleanInvokeFeature();

      expect(feature.enabled).assertEqual(false);
      feature.toggle();
      expect(feature.enabled).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_1900
     * @tc.name      testBooleanInvokeConfigObject
     * @tc.desc      Boolean.$_invoke() initializes configuration objects.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeConfigObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const config: BooleanInvokeAppConfig = createBooleanInvokeConfig();

      expect(config.debugMode).assertEqual(false);
      expect(config.enableCache).assertEqual(false);
      expect(config.logErrors).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_TEST_2000
     * @tc.name      testBooleanInvokeStateInitialization
     * @tc.desc      Boolean.$_invoke() initializes state manager flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeStateInitialization", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const manager: BooleanInvokeStateManager = new BooleanInvokeStateManager();
      const status: BooleanInvokeStatus = manager.getStatus();

      expect(status.initialized).assertEqual(false);
      expect(status.loaded).assertEqual(false);
      expect(status.error).assertEqual(false);

      manager.initialize();
      const status2: BooleanInvokeStatus = manager.getStatus();
      expect(status2.initialized).assertEqual(true);
      expect(status2.loaded).assertEqual(true);

      manager.setError();
      const status3: BooleanInvokeStatus = manager.getStatus();
      expect(status3.error).assertEqual(true);
    })
  })
}
