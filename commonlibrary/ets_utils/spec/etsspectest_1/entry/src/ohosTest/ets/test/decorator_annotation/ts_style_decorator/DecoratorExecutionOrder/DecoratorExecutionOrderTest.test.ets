/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
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
} from '@ohos/hypium';
import {
  resetAll,
  getExecutionLog,
  identifierDecorator,
  decoratorFunction,
  decoratorFactory,
  createDecorator,
  paramEvaluatedFirst,
  sideEffectParam,
  onceDecorator,
  repeatDecorator,
  verifyDecorator,
  classDeco1,
  classDeco2,
  classDeco3,
  propDeco1,
  propDeco2,
  propDeco3,
  methodDeco1,
  methodDeco2,
  methodDeco3,
  identifierDeco,
  factoryDeco,
  factoryDeco2,
  identifierDeco2,
  multiParamFactory,
  callDeco1,
  callDeco2,
  commentDeco1,
  commentDeco2,
  leftToRightEval,
  leftToRightDeco,
  firstParamEval,
  secondParamEval,
  multiParamDeco,
  paramIIFE,
  IIFEDeco,
  outerCall,
  nestedCallDeco,
  arrowNotExecuted,
  normalFuncNotExecuted,
  normalFuncForDecorator,
  normalFuncSideEffect,
  factoryBodyDeco,
  returnedSideEffectDeco,
  factoryOrderDeco,
  factoryA,
  factoryB,
  outerFactory,
  returnInner,
  classNoCtorDeco,
  propNoInitDeco,
  methodNoBodyDeco,
  paramCounter,
  onceCounter,
  repeatCounter,
  factoryParamCounter,
  paramEvalCounter,
  factoryBodyCounter,
  returnedCounter,
  factoryOrderBodyCounter,
  factoryOrderReturnedCounter
} from './DecoratorExecutionOrderHelper';

export default function DecoratorExecutionOrderTest() {
  describe('DecoratorExecutionOrderTest', () => {
    beforeAll(() => {})
    beforeEach(async () => {
      resetAll()
    })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_0100
     * @tc.name      testClassIdentifierDecoratorEvaluation0001
     * @tc.desc      Verify identifier decorator expression evaluates correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassIdentifierDecoratorEvaluation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @identifierDecorator
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(1)
      expect(log[0]).assertEqual('identifierDecorator')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_0200
     * @tc.name      testClassDecoratorFunctionCall0001
     * @tc.desc      Verify decorator function is called when applied to target.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFunctionCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFunction
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(1)
      expect(log[0]).assertEqual('decoratorFunction')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_0300
     * @tc.name      testClassFactoryCallEvaluation0001
     * @tc.desc      Verify factory call evaluates and returns decorator function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassFactoryCallEvaluation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactory()
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(2)
      expect(log[0]).assertEqual('factory')
      expect(log[1]).assertEqual('factoryReturnedDecorator')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_0400
     * @tc.name      testClassReturnedDecoratorInvocation0001
     * @tc.desc      Verify returned decorator function is invoked after factory evaluation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassReturnedDecoratorInvocation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @createDecorator('customDeco')
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(1)
      expect(log[0]).assertEqual('customDeco')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_0500
     * @tc.name      testClassFactoryParamEvaluatedFirst0001
     * @tc.desc      Verify factory parameter is evaluated before decorator invocation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassFactoryParamEvaluatedFirst0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @paramEvaluatedFirst()
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(2)
      expect(log[0]).assertEqual('paramEvaluatedFirst')
      expect(log[1]).assertEqual('paramDecorator')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_0600
     * @tc.name      testClassFactoryParamSideEffect0001
     * @tc.desc      Verify factory parameter side effect occurs during evaluation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassFactoryParamSideEffect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(paramCounter).assertEqual(0)
      @sideEffectParam()
      class TestClass {}
      void new TestClass()
      expect(paramCounter).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_0700
     * @tc.name      testClassDecoratorSideEffectOnce0001
     * @tc.desc      Verify decorator side effect executes exactly once.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorSideEffectOnce0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(onceCounter).assertEqual(0)
      @onceDecorator
      class TestClass {}
      void new TestClass()
      expect(onceCounter).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_0800
     * @tc.name      testClassDecoratorNotRepeated0001
     * @tc.desc      Verify decorator is not called repeatedly for same target.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorNotRepeated0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(repeatCounter).assertEqual(0)
      @repeatDecorator
      class TestClass {}
      void new TestClass()
      expect(repeatCounter).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_0900
     * @tc.name      testClassDecoratorNotOmitted0001
     * @tc.desc      Verify decorator is not omitted when multiple decorators exist.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorNotOmitted0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @verifyDecorator
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(1)
      expect(log[0]).assertEqual('verifyDecorator')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_1000
     * @tc.name      testClassTwoClassDecorators0001
     * @tc.desc      Verify two decorators on class are both applied in bottom-to-top order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassTwoClassDecorators0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDeco1
      @classDeco2
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(2)
      expect(log[0]).assertEqual('classDeco2')
      expect(log[1]).assertEqual('classDeco1')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_1100
     * @tc.name      testClassThreeClassDecorators0001
     * @tc.desc      Verify three decorators on class are all applied in bottom-to-top order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassThreeClassDecorators0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDeco1
      @classDeco2
      @classDeco3
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(3)
      expect(log[0]).assertEqual('classDeco3')
      expect(log[1]).assertEqual('classDeco2')
      expect(log[2]).assertEqual('classDeco1')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_1200
     * @tc.name      testClassTwoPropertyDecorators0001
     * @tc.desc      Verify two decorators on property are both applied in bottom-to-top order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassTwoPropertyDecorators0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      class TestClass {
        @propDeco1
        @propDeco2
        prop: string = ''
      }
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(2)
      expect(log[0]).assertEqual('propDeco2')
      expect(log[1]).assertEqual('propDeco1')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_1300
     * @tc.name      testClassThreePropertyDecorators0001
     * @tc.desc      Verify three decorators on property are all applied in bottom-to-top order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassThreePropertyDecorators0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      class TestClass {
        @propDeco1
        @propDeco2
        @propDeco3
        value: number = 0
      }
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(3)
      expect(log[0]).assertEqual('propDeco3')
      expect(log[1]).assertEqual('propDeco2')
      expect(log[2]).assertEqual('propDeco1')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_1400
     * @tc.name      testClassTwoMethodDecorators0001
     * @tc.desc      Verify two decorators on method are both applied in bottom-to-top order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassTwoMethodDecorators0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      class TestClass {
        @methodDeco1
        @methodDeco2
        doWork(): void {}
      }
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(2)
      expect(log[0]).assertEqual('methodDeco2')
      expect(log[1]).assertEqual('methodDeco1')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_1500
     * @tc.name      testClassThreeMethodDecorators0001
     * @tc.desc      Verify three decorators on method are all applied in bottom-to-top order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassThreeMethodDecorators0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      class TestClass {
        @methodDeco1
        @methodDeco2
        @methodDeco3
        run(): void {}
      }
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(3)
      expect(log[0]).assertEqual('methodDeco3')
      expect(log[1]).assertEqual('methodDeco2')
      expect(log[2]).assertEqual('methodDeco1')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_1600
     * @tc.name      testClassIdentifierAndFactoryMixed0001
     * @tc.desc      Verify identifier and factory decorators mixed together in correct order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassIdentifierAndFactoryMixed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @identifierDeco
      @factoryDeco()
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(3)
      expect(log[0]).assertEqual('factoryDecoEval')
      expect(log[1]).assertEqual('factoryDecoCall')
      expect(log[2]).assertEqual('identifierDeco')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_1700
     * @tc.name      testClassFactoryAndIdentifierMixed0001
     * @tc.desc      Verify factory and identifier decorators mixed together in correct order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassFactoryAndIdentifierMixed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @factoryDeco2()
      @identifierDeco2
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(3)
      expect(log[0]).assertEqual('factoryDeco2Eval')
      expect(log[1]).assertEqual('identifierDeco2')
      expect(log[2]).assertEqual('factoryDeco2Call')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_1800
     * @tc.name      testClassMultiFactoryParamSideEffect0001
     * @tc.desc      Verify multiple factory params side effects are recorded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMultiFactoryParamSideEffect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(factoryParamCounter).assertEqual(0)
      @multiParamFactory()
      class TestClass {}
      void new TestClass()
      expect(factoryParamCounter).assertEqual(1)
      const log = getExecutionLog()
      expect(log[0]).assertEqual('multiParamFactoryEval')
      expect(log[1]).assertEqual('multiParamFactoryCall')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_1900
     * @tc.name      testClassMultiDecoratorCallOrder0001
     * @tc.desc      Verify identifier decorators call order is bottom-to-top (no separate eval phase).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMultiDecoratorCallOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @callDeco1
      @callDeco2
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(2)
      expect(log[0]).assertEqual('callDeco2')
      expect(log[1]).assertEqual('callDeco1')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_2000
     * @tc.name      testClassCommentsBetweenDecorators0001
     * @tc.desc      Verify comments and blank lines between decorators do not affect order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassCommentsBetweenDecorators0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @commentDeco1
      @commentDeco2
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(2)
      expect(log[0]).assertEqual('commentDeco2')
      expect(log[1]).assertEqual('commentDeco1')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_2100
     * @tc.name      testClassFactoryParamsLeftToRight0001
     * @tc.desc      Verify factory parameters are evaluated left to right.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassFactoryParamsLeftToRight0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @leftToRightDeco(leftToRightEval())
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log[0]).assertEqual('leftToRightEval')
      expect(log[1]).assertEqual('leftToRight')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_2200
     * @tc.name      testClassMultiParamPrimitiveSideEffect0001
     * @tc.desc      Verify multiple primitive params side effects are evaluated in order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMultiParamPrimitiveSideEffect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(paramEvalCounter).assertEqual(0)
      @multiParamDeco(firstParamEval(), secondParamEval())
      class TestClass {}
      void new TestClass()
      expect(paramEvalCounter).assertEqual(2)
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_2300
     * @tc.name      testClassParamAsIIFE0001
     * @tc.desc      Verify factory parameter as IIFE is evaluated immediately.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassParamAsIIFE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @IIFEDeco(paramIIFE())
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log[0]).assertEqual('paramIIFE')
      expect(log[1]).assertEqual('IIFEDeco_42')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_2400
     * @tc.name      testClassParamAsNestedCall0001
     * @tc.desc      Verify factory parameter as nested call: outer call enters before its nested inner call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassParamAsNestedCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @nestedCallDeco(outerCall())
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log[0]).assertEqual('outerCall')
      expect(log[1]).assertEqual('innerCall')
      expect(log[2]).assertEqual('nestedCallDeco_nested')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_2500
     * @tc.name      testClassParamArrowFunctionNotExecuted0001
     * @tc.desc      Verify arrow function as param definition is not executed during eval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassParamArrowFunctionNotExecuted0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arrowSideEffect = 0
      @arrowNotExecuted(() => { arrowSideEffect++ })
      class TestClass {}
      void new TestClass()
      expect(arrowSideEffect).assertEqual(0)
      const log = getExecutionLog()
      expect(log[0]).assertEqual('arrowNotExecuted')
      expect(log[1]).assertEqual('arrowDeco')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_2600
     * @tc.name      testClassParamNormalFunctionNotExecuted0001
     * @tc.desc      Verify normal function as param is not executed during eval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassParamNormalFunctionNotExecuted0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @normalFuncNotExecuted(normalFuncForDecorator)
      class TestClass {}
      void new TestClass()
      expect(normalFuncSideEffect).assertEqual(0)
      const log = getExecutionLog()
      expect(log[0]).assertEqual('normalFuncNotExecuted')
      expect(log[1]).assertEqual('normalFuncDeco')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_2700
     * @tc.name      testClassFactoryBodySideEffect0001
     * @tc.desc      Verify factory body side effect is recorded during evaluation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassFactoryBodySideEffect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(factoryBodyCounter).assertEqual(0)
      @factoryBodyDeco()
      class TestClass {}
      void new TestClass()
      expect(factoryBodyCounter).assertEqual(1)
      const log = getExecutionLog()
      expect(log[0]).assertEqual('factoryBodyEval')
      expect(log[1]).assertEqual('factoryBodyCall')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_2800
     * @tc.name      testClassReturnedDecoratorSideEffect0001
     * @tc.desc      Verify returned decorator side effect occurs during invocation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassReturnedDecoratorSideEffect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(returnedCounter).assertEqual(0)
      @returnedSideEffectDeco()
      class TestClass {}
      void new TestClass()
      expect(returnedCounter).assertEqual(1)
      const log = getExecutionLog()
      expect(log[0]).assertEqual('returnedSideEffectEval')
      expect(log[1]).assertEqual('returnedSideEffectCall')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_2900
     * @tc.name      testClassFactoryAndReturnedSideEffectOrder0001
     * @tc.desc      Verify factory side effect before returned decorator side effect.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassFactoryAndReturnedSideEffectOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(factoryOrderBodyCounter).assertEqual(0)
      expect(factoryOrderReturnedCounter).assertEqual(0)
      @factoryOrderDeco()
      class TestClass {}
      void new TestClass()
      expect(factoryOrderBodyCounter).assertEqual(1)
      expect(factoryOrderReturnedCounter).assertEqual(1)
      const log = getExecutionLog()
      expect(log[0]).assertEqual('factoryOrderEval')
      expect(log[1]).assertEqual('factoryOrderCall')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_3000
     * @tc.name      testClassMultiFactoriesSideEffect0001
     * @tc.desc      Verify multiple factories side effects are recorded in correct order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMultiFactoriesSideEffect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @factoryA()
      @factoryB()
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log.length).assertEqual(4)
      expect(log[0]).assertEqual('factoryA_Eval')
      expect(log[1]).assertEqual('factoryB_Eval')
      expect(log[2]).assertEqual('factoryB_Call')
      expect(log[3]).assertEqual('factoryA_Call')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_3100
     * @tc.name      testClassNestedFactoryCall0001
     * @tc.desc      Verify nested factory call evaluates inner then outer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassNestedFactoryCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @outerFactory()
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log[0]).assertEqual('outerFactoryEval')
      expect(log[1]).assertEqual('innerFactoryEval')
      expect(log[2]).assertEqual('innerFactoryCall')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_3200
     * @tc.name      testClassFactoryReturnsDecoratorCalled0001
     * @tc.desc      Verify factory returns decorator which is then called.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassFactoryReturnsDecoratorCalled0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @returnInner()
      class TestClass {}
      void new TestClass()
      const log = getExecutionLog()
      expect(log[0]).assertEqual('returnInnerEval')
      expect(log[1]).assertEqual('returnDecoratorEval')
      expect(log[2]).assertEqual('returnDecoratorCall')
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_3300
     * @tc.name      testClassClassDecoNotExecuteConstructor0001
     * @tc.desc      Verify class decorator does not execute constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassClassDecoNotExecuteConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let ctorCount: number = 0
      @classNoCtorDeco
      class TestClass {
        constructor() {
          ctorCount++
        }
      }
      const log = getExecutionLog()
      expect(log.length).assertEqual(1)
      expect(log[0]).assertEqual('classNoCtorDeco')
      expect(ctorCount).assertEqual(0)
      const instance: TestClass = new TestClass()
      void instance
      expect(ctorCount).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_3400
     * @tc.name      testClassPropertyDecoNotExecuteInit0001
     * @tc.desc      Verify property decorator does not execute field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoNotExecuteInit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let initCount: number = 0
      class TestClass {
        @propNoInitDeco
        value: number = (() => {
          initCount++
          return 0
        })()
      }
      const log = getExecutionLog()
      expect(log.length).assertEqual(1)
      expect(log[0]).assertEqual('propNoInitDeco')
      expect(initCount).assertEqual(0)
      const instance: TestClass = new TestClass()
      void instance
      expect(initCount).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DECORATOR_EXECUTION_ORDER_3500
     * @tc.name      testClassMethodDecoNotExecuteBody0001
     * @tc.desc      Verify method decorator does not execute method body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoNotExecuteBody0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bodyCount: number = 0
      class TestClass {
        @methodNoBodyDeco
        run(): void {
          bodyCount++
        }
      }
      const log = getExecutionLog()
      expect(log.length).assertEqual(1)
      expect(log[0]).assertEqual('methodNoBodyDeco')
      expect(bodyCount).assertEqual(0)
      const instance: TestClass = new TestClass()
      instance.run()
      expect(bodyCount).assertEqual(1)
    })
  })
}
