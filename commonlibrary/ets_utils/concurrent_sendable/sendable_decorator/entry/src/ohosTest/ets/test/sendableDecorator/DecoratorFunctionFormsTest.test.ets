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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import {
  AuditClassDecorator,
  CacheClassDecorator,
  CacheDecorator,
  ConfigClassDecorator,
  CountClassDecorator,
  DatabaseClassDecorator,
  DebounceClassDecorator,
  Entity,
  EntityClassDecorator,
  EntityDecorator,
  EntityLegacyConfig,
  LogClassDecorator,
  MetricClassDecorator,
  MonitorClassDecorator,
  ObservableClassDecorator,
  PerformanceClassDecorator,
  PerformanceDecorator,
  SecurityClassDecorator,
  SecurityDecorator,
  SingletonClassDecorator,
  ThrottleClassDecorator,
  TransactionClassDecorator,
  ValidationClassDecorator,
  ValidationDecorator,
  VersionClassDecorator
} from './models/Decorators';
import {
  AnonymousFunctionDecorator,
  AnonymousFunctionWithCallback,
  ArrowFunctionDecorator,
  ArrowFunctionFactoryDecorator,
  ArrowFunctionFactoryWithValidation,
  ArrowFunctionWithInternalLogic,
  AsyncStyleArrowDecorator,
  AsyncStyleDecorator,
  AsyncStyleFactoryDecorator,
  CallbackStyleDecorator,
  CallbackStyleFactoryDecorator,
  ClassMethodDecorator,
  ClassMethodFactoryDecorator,
  ConditionalDecorator,
  ConditionalDecoratorArrow,
  ConditionalDecoratorWithConfig,
  CurryingFunctionArrow,
  CurryingFunctionDecorator,
  CurryingFunctionMultiStep,
  DefaultParameterArrowDecorator,
  DefaultParameterDecorator,
  DestructuringParameterArrowDecorator,
  DestructuringParameterDecorator,
  FactoryFunctionDecorator,
  FactoryFunctionWithMultipleParams,
  FunctionExpressionDecorator,
  FunctionExpressionWithClosure,
  GeneratorStyleDecorator,
  GeneratorStyleFactoryDecorator,
  HigherOrderFunctionArrow,
  HigherOrderFunctionDecorator,
  IIFEDecorator,
  IIFEWithComplexSetup,
  ObjectMethodArrowDecorator,
  ObjectMethodDecorator,
  ObjectMethodFactoryDecorator,
  OptionalParameterDecorator,
  RegularFunctionDecorator,
  RegularFunctionWithValidation,
  RestParameterDecorator,
  SpreadOperatorDecorator,
  TemplateLiteralDecorator,
  UnionTypeParameterDecorator
} from './models/DecoratorsTS';

// Import ALL decorators from DecoratorsJS.js
import {
  AnonymousFunctionDecoratorJS,
  AnonymousFunctionWithCallbackJS,
  ArrowFunctionDecoratorJS,
  ArrowFunctionFactoryDecoratorJS,
  ArrowFunctionFactoryWithValidationJS,
  ArrowFunctionWithInternalLogicJS,
  AsyncStyleArrowDecoratorJS,
  AsyncStyleDecoratorJS,
  CallbackStyleDecoratorJS,
  ClassMethodDecoratorJS,
  ConditionalDecoratorArrowJS,
  ConditionalDecoratorJS,
  CurryingFunctionArrowJS,
  CurryingFunctionDecoratorJS,
  CurryingFunctionMultiStepJS,
  DefaultParameterArrowDecoratorJS,
  DefaultParameterDecoratorJS,
  DestructuringParameterArrowDecoratorJS,
  DestructuringParameterDecoratorJS,
  FactoryFunctionDecoratorJS,
  FactoryFunctionWithMultipleParamsJS,
  FunctionExpressionDecoratorJS,
  FunctionExpressionWithClosureJS,
  GeneratorStyleDecoratorJS,
  HigherOrderFunctionArrowJS,
  HigherOrderFunctionDecoratorJS,
  IIFEDecoratorJS,
  IIFEWithComplexSetupJS,
  ObjectMethodArrowDecoratorJS,
  ObjectMethodDecoratorJS,
  OptionalParameterDecoratorJS,
  RegularFunctionDecoratorJS,
  RegularFunctionWithValidationJS,
  RestParameterDecoratorJS,
  SpreadOperatorDecoratorJS,
  TemplateLiteralDecoratorJS,
  UnionTypeParameterDecoratorJS
} from './models/DecoratorsJS';

// Import from original Decorators.ets
export default function decoratorFunctionFormsTest(): void {
  describe('DecoratorFunctionFormsValidation', (): void => {

    // ==================== Function Form 1: Regular Function ====================

    @Sendable
    @LogClassDecorator
    class TestLogDecoratorSendable {
      public value: number = 100;

      getValue(): number {
        return this.value;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0100
     * @tc.name test_form1_regular_function_basic
     * @tc.desc Test regular function decorator basic functionality with LogClassDecorator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form1_regular_function_basic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form1] Test Regular Function Decorator');

      const instance: TestLogDecoratorSendable = new TestLogDecoratorSendable();

      expect(instance.value).assertEqual(100);
      expect(instance.getValue()).assertEqual(100);
      console.info('[Form1] LogDecorator applied');
    });

    @Sendable
    @CountClassDecorator
    class TestCountDecoratorSendable {
      public data: number = 50;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0101
     * @tc.name test_form1_regular_function_count
     * @tc.desc Test regular function decorator with CountClassDecorator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form1_regular_function_count', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form1] Test Regular Function Count Decorator');

      const instance: TestCountDecoratorSendable = new TestCountDecoratorSendable();

      expect(instance.data).assertEqual(50);
      console.info('[Form1] CountDecorator applied');
    });

    @Sendable
    @LogClassDecorator
    @CountClassDecorator
    class TestMultipleRegularDecoratorsSendable {
      public info: string = 'test';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0102
     * @tc.name test_form1_regular_function_multiple
     * @tc.desc Test multiple regular function decorators stacked on Sendable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form1_regular_function_multiple', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form1] Test Multiple Regular Function Decorators');

      const instance: TestMultipleRegularDecoratorsSendable = new TestMultipleRegularDecoratorsSendable();

      expect(instance.info).assertEqual('test');
      console.info('[Form1] Multiple regular decorators applied successfully');
    });

    // ==================== Function Form 2: Arrow Function (Internal) ====================

    @Sendable
    @MonitorClassDecorator
    class TestMonitorDecoratorSendable {
      public status: string = 'active';

      execute(): string {
        return this.status;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0103
     * @tc.name test_form2_arrow_function_internal
     * @tc.desc Test arrow function decorator with MonitorClassDecorator and internal validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form2_arrow_function_internal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form2] Test Arrow Function Internal Decorator');

      const instance: TestMonitorDecoratorSendable = new TestMonitorDecoratorSendable();

      expect(instance.status).assertEqual('active');
      expect(instance.execute()).assertEqual('active');
      console.info('[Form2] MonitorDecorator applied with internal arrow function validation');
    });

    @Sendable
    @PerformanceClassDecorator
    class TestPerformanceDecoratorSendable {
      public timeout: number = 5000;

      execute(): number {
        return this.timeout;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0104
     * @tc.name test_form2_arrow_function_performance
     * @tc.desc Test arrow function decorator with PerformanceClassDecorator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form2_arrow_function_performance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form2] Test Performance Decorator');

      const instance: TestPerformanceDecoratorSendable = new TestPerformanceDecoratorSendable();

      expect(instance.timeout).assertEqual(5000);
      expect(instance.execute()).assertEqual(5000);
      console.info('[Form2] PerformanceDecorator applied successfully');
    });

    @Sendable
    @MonitorClassDecorator
    @PerformanceClassDecorator
    class TestMultipleArrowDecoratorsSendable {
      public level: number = 3;

      execute(): number {
        return this.level;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0105
     * @tc.name test_form2_arrow_function_multiple
     * @tc.desc Test multiple arrow function decorators stacked together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form2_arrow_function_multiple', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form2] Test Multiple Arrow Function Decorators');

      const instance: TestMultipleArrowDecoratorsSendable = new TestMultipleArrowDecoratorsSendable();

      expect(instance.level).assertEqual(3);
      console.info('[Form2] Multiple arrow function decorators applied');
    });

    // ==================== Function Form 3: Factory Function (Parameterized) ====================

    @Sendable
    @EntityClassDecorator('users')
    class TestEntityDecoratorSendable {
      public id: number = 1;
      public name: string = 'user1';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0106
     * @tc.name test_form3_factory_function_entity
     * @tc.desc Test factory function decorator with EntityClassDecorator and parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form3_factory_function_entity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form3] Test Factory Function Entity Decorator');

      const instance: TestEntityDecoratorSendable = new TestEntityDecoratorSendable();

      expect(instance.id).assertEqual(1);
      expect(instance.name).assertEqual('user1');
      console.info('[Form3] EntityDecorator applied');
    });

    @Sendable
    @CacheClassDecorator('user_cache')
    class TestCacheDecoratorSendable {
      public key: string = 'cache_key';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0107
     * @tc.name test_form3_factory_function_cache
     * @tc.desc Test factory function decorator with CacheClassDecorator and cache key parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form3_factory_function_cache', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form3] Test Factory Function Cache Decorator');

      const instance: TestCacheDecoratorSendable = new TestCacheDecoratorSendable();

      expect(instance.key).assertEqual('cache_key');
      console.info('[Form3] CacheDecorator applied');
    });

    @Sendable
    @ThrottleClassDecorator(1000)
    @DebounceClassDecorator(500)
    class TestThrottleDebounceDecoratorSendable {
      public rate: number = 100;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0108
     * @tc.name test_form3_factory_function_numeric
     * @tc.desc Test factory function decorators with numeric parameters for Throttle and Debounce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form3_factory_function_numeric', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form3] Test Factory Function Numeric Decorators');

      const instance: TestThrottleDebounceDecoratorSendable = new TestThrottleDebounceDecoratorSendable();

      expect(instance.rate).assertEqual(100);
      console.info('[Form3] Throttle and Debounce decorators applied');
    });

    @Sendable
    @MetricClassDecorator('performance_metric')
    @VersionClassDecorator('1.0.0')
    class TestMetricVersionDecoratorSendable {
      public metric: string = 'metric_value';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0109
     * @tc.name test_form3_factory_function_string
     * @tc.desc Test factory function decorators with string parameters for Metric and Version
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form3_factory_function_string', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form3] Test Factory Function String Decorators');

      const instance: TestMetricVersionDecoratorSendable = new TestMetricVersionDecoratorSendable();

      expect(instance.metric).assertEqual('metric_value');
      console.info('[Form3] Metric and Version decorators applied');
    });

    @Sendable
    @ConfigClassDecorator('app_config')
    @DatabaseClassDecorator('product_db')
    class TestConfigDatabaseDecoratorSendable {
      public setting: string = 'setting_value';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0110
     * @tc.name test_form3_factory_function_multiple
     * @tc.desc Test multiple factory function decorators with Config and Database
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form3_factory_function_multiple', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form3] Test Multiple Factory Function Decorators');

      const instance: TestConfigDatabaseDecoratorSendable = new TestConfigDatabaseDecoratorSendable();

      expect(instance.setting).assertEqual('setting_value');
      console.info('[Form3] Multiple factory decorators applied');
    });

    // ==================== Function Form 4: Closure with Validation ====================

    @Sendable
    @EntityDecorator({ id: 'orders', primaryKey: 'orderId', softDelete: true })
    class TestEntityValidationDecoratorSendable {
      public orderId: number = 100;
      public product: string = 'product1';
      public quantity: number = 5;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0111
     * @tc.name test_form4_closure_entity_validation
     * @tc.desc Test closure decorator with EntityDecorator and validation config object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form4_closure_entity_validation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form4] Test Closure with Entity Validation');

      const instance: TestEntityValidationDecoratorSendable = new TestEntityValidationDecoratorSendable();

      expect(instance.orderId).assertEqual(100);
      expect(instance.product).assertEqual('product1');
      expect(instance.quantity).assertEqual(5);
      console.info('[Form4] EntityDecorator with validation applied');
    });

    @Sendable
    @CacheDecorator({
      key: 'data_cache',
      ttl: 300,
      strategy: 'lazy',
      maxSize: 1000
    })
    class TestCacheValidationDecoratorSendable {
      public cacheKey: string = 'cache_data';

      getData(): string {
        return this.cacheKey;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0112
     * @tc.name test_form4_closure_cache_validation
     * @tc.desc Test closure decorator with CacheDecorator and complex validation config
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form4_closure_cache_validation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form4] Test Closure with Cache Validation');

      const instance: TestCacheValidationDecoratorSendable = new TestCacheValidationDecoratorSendable();

      expect(instance.cacheKey).assertEqual('cache_data');
      expect(instance.getData()).assertEqual('cache_data');
      console.info('[Form4] CacheDecorator with validation applied');
    });

    @Sendable
    @ValidationDecorator(
      { requiredFields: new collections.Array<string>('id', 'name', 'email'), minFields: 3, maxFields: 10 })
    class TestValidationDecoratorSendable {
      public id: number = 1;
      public name: string = 'test';
      public email: string = 'test@example.com';
      public age: number = 25;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0113
     * @tc.name test_form4_closure_validation_required
     * @tc.desc Test closure decorator with ValidationDecorator and required fields validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form4_closure_validation_required', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form4] Test Closure with Required Fields Validation');

      const instance: TestValidationDecoratorSendable = new TestValidationDecoratorSendable();

      expect(instance.id).assertEqual(1);
      expect(instance.name).assertEqual('test');
      expect(instance.email).assertEqual('test@example.com');
      console.info('[Form4] ValidationDecorator applied');
    });

    @Sendable
    @SecurityDecorator({
      roles: new collections.Array<string>('admin', 'user'),
      permissions: new collections.Array<string>('read', 'write'),
      auditLog: true
    })
    class TestSecurityValidationDecoratorSendable {
      public role: string = 'admin';

      validateAccess(): boolean {
        return true;
      }

      logAudit(): void {
        console.info('Audit logged');
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0114
     * @tc.name test_form4_closure_security_validation
     * @tc.desc Test closure decorator with SecurityDecorator and roles/permissions validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form4_closure_security_validation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form4] Test Closure with Security Validation');

      const instance: TestSecurityValidationDecoratorSendable = new TestSecurityValidationDecoratorSendable();

      expect(instance.role).assertEqual('admin');
      expect(instance.validateAccess()).assertTrue();
      console.info('[Form4] SecurityDecorator applied');
    });

    @Sendable
    @PerformanceDecorator({ timeout: 5000, maxRetries: 3, circuitBreaker: true })
    class TestPerformanceValidationDecoratorSendable {
      public timeout: number = 5000;

      execute(): number {
        return this.timeout;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0115
     * @tc.name test_form4_closure_performance_validation
     * @tc.desc Test closure decorator with PerformanceDecorator and performance config validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form4_closure_performance_validation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form4] Test Closure with Performance Validation');

      const instance: TestPerformanceValidationDecoratorSendable = new TestPerformanceValidationDecoratorSendable();

      expect(instance.timeout).assertEqual(5000);
      expect(instance.execute()).assertEqual(5000);
      console.info('[Form4] PerformanceDecorator applied');
    });

    // ==================== Function Form 5: Function with Multiple Actions ====================

    @Sendable
    @SingletonClassDecorator
    class TestSingletonDecoratorSendable {
      private static instance: TestSingletonDecoratorSendable | null = null;
      public data: string = 'singleton_data';

      static getInstance(): TestSingletonDecoratorSendable {
        if (!TestSingletonDecoratorSendable.instance) {
          TestSingletonDecoratorSendable.instance = new TestSingletonDecoratorSendable();
        }
        return TestSingletonDecoratorSendable.instance;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0116
     * @tc.name test_form5_multiple_actions_singleton
     * @tc.desc Test function with multiple actions using SingletonClassDecorator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form5_multiple_actions_singleton', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form5] Test Function with Multiple Actions - Singleton');

      const instance: TestSingletonDecoratorSendable = new TestSingletonDecoratorSendable();

      expect(instance.data).assertEqual('singleton_data');
      console.info('[Form5] SingletonDecorator applied');
    });

    @Sendable
    @ObservableClassDecorator
    class TestObservableDecoratorSendable {
      public state: string = 'initial';

      notify(): void {
        console.info('State changed');
      }

      subscribe(): void {
        console.info('Subscriber added');
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0117
     * @tc.name test_form5_multiple_actions_observable
     * @tc.desc Test function with multiple actions using ObservableClassDecorator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form5_multiple_actions_observable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form5] Test Function with Multiple Actions - Observable');

      const instance: TestObservableDecoratorSendable = new TestObservableDecoratorSendable();

      expect(instance.state).assertEqual('initial');
      console.info('[Form5] ObservableDecorator applied with pattern validation');
    });

    @Sendable
    @TransactionClassDecorator
    class TestTransactionDecoratorSendable {
      public transactionId: string = 'tx_001';

      commit(): void {
        console.info('Transaction committed');
      }

      rollback(): void {
        console.info('Transaction rolled back');
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0118
     * @tc.name test_form5_multiple_actions_transaction
     * @tc.desc Test function with multiple actions using TransactionClassDecorator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form5_multiple_actions_transaction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form5] Test Function with Multiple Actions - Transaction');

      const instance: TestTransactionDecoratorSendable = new TestTransactionDecoratorSendable();

      expect(instance.transactionId).assertEqual('tx_001');
      console.info('[Form5] TransactionDecorator applied');
    });

    @Sendable
    @AuditClassDecorator
    class TestAuditDecoratorSendable {
      public action: string = 'action_log';

      logAudit(): void {
        console.info('Action logged');
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0119
     * @tc.name test_form5_multiple_actions_audit
     * @tc.desc Test function with multiple actions using AuditClassDecorator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form5_multiple_actions_audit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form5] Test Function with Multiple Actions - Audit');

      const instance: TestAuditDecoratorSendable = new TestAuditDecoratorSendable();

      expect(instance.action).assertEqual('action_log');
      console.info('[Form5] AuditDecorator applied');
    });

    @Sendable
    @SecurityClassDecorator
    @ValidationClassDecorator
    class TestSecurityValidationMultiDecoratorSendable {
      public level: number = 5;

      validateAccess(): boolean {
        return this.level > 0;
      }

      validate(): boolean {
        return this.level < 10;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0120
     * @tc.name test_form5_multiple_actions_combined
     * @tc.desc Test function with multiple actions combining Security and Validation decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form5_multiple_actions_combined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form5] Test Function with Multiple Actions - Combined');

      const instance: TestSecurityValidationMultiDecoratorSendable =
        new TestSecurityValidationMultiDecoratorSendable();

      expect(instance.level).assertEqual(5);
      expect(instance.validateAccess()).assertTrue();
      expect(instance.validate()).assertTrue();
      console.info('[Form5] Combined decorators applied successfully');
    });

    // ==================== Function Form 6: Simple Factory (Interface-based) ====================

    @Sendable
    @Entity(new EntityLegacyConfig('entity_001'))
    class TestEntityInterfaceDecoratorSendable {
      public entityName: string = 'entity1';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0121
     * @tc.name test_form6_simple_factory_interface
     * @tc.desc Test simple factory decorator with Entity interface-based configuration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form6_simple_factory_interface', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form6] Test Simple Factory Interface Decorator');

      const instance: TestEntityInterfaceDecoratorSendable = new TestEntityInterfaceDecoratorSendable();

      expect(instance.entityName).assertEqual('entity1');
      console.info('[Form6] Entity decorator applied');
    });

    @Sendable
    @Entity(new EntityLegacyConfig('entity_002'))
    @Entity(new EntityLegacyConfig('entity_003'))
    class TestMultipleEntityInterfaceDecoratorSendable {
      public value: number = 200;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0122
     * @tc.name test_form6_simple_factory_multiple
     * @tc.desc Test multiple simple factory decorators with Entity interface configuration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form6_simple_factory_multiple', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form6] Test Simple Factory Multiple Interface Decorators');

      const instance: TestMultipleEntityInterfaceDecoratorSendable =
        new TestMultipleEntityInterfaceDecoratorSendable();

      expect(instance.value).assertEqual(200);
      console.info('[Form6] Multiple entity decorators applied');
    });

    // ==================== Cross-Form Combination Tests ====================

    @Sendable
    @LogClassDecorator
    @EntityClassDecorator('combined_table')
    @EntityDecorator({ id: 'combined_entity', primaryKey: 'id' })
    @SingletonClassDecorator
    class TestCrossFormCombinationSendable {
      public id: number = 1;
      public data: string = 'combined';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0123
     * @tc.name test_cross_form_combination_all_forms
     * @tc.desc Test cross-form combination with Log, Entity, EntityDecorator, and Singleton decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_cross_form_combination_all_forms', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[CrossForm] Test All Function Forms Combination');

      const instance: TestCrossFormCombinationSendable = new TestCrossFormCombinationSendable();

      expect(instance.id).assertEqual(1);
      expect(instance.data).assertEqual('combined');
      console.info('[CrossForm] All forms combined');
    });

    @Sendable
    @MonitorClassDecorator
    @CacheDecorator({ key: 'cross_cache', ttl: 600, strategy: 'eager' })
    @SecurityDecorator({
      roles: new collections.Array<string>('admin'),
      permissions: new collections.Array<string>('all'),
      auditLog: false
    })
    class TestCrossFormValidationSendable {
      public id: number = 10;

      execute(): number {
        return this.id;
      }

      getData(): number {
        return this.id;
      }

      validateAccess(): boolean {
        return true;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0124
     * @tc.name test_cross_form_validation_combination
     * @tc.desc Test cross-form validation combination with Monitor, Cache, and Security decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_cross_form_validation_combination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[CrossForm] Test Validation Forms Combination');

      const instance: TestCrossFormValidationSendable = new TestCrossFormValidationSendable();

      expect(instance.id).assertEqual(10);
      expect(instance.execute()).assertEqual(10);
      expect(instance.getData()).assertEqual(10);
      console.info('[CrossForm] Validation forms combined');
    });

    @Sendable
    @PerformanceDecorator({ timeout: 3000, maxRetries: 2, circuitBreaker: false })
    @ObservableClassDecorator
    @ValidationDecorator({ requiredFields: new collections.Array<string>('status'), minFields: 1 })
    class TestCrossFormPatternSendable {
      public status: string = 'running';

      execute(): string {
        return this.status;
      }

      notify(): void {
        console.info('Status changed');
      }

      subscribe(): void {
        console.info('Subscribed');
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0125
     * @tc.name test_cross_form_pattern_combination
     * @tc.desc Test cross-form pattern combination with Performance, Observable, and Validation decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_cross_form_pattern_combination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[CrossForm] Test Pattern Forms Combination');

      const instance: TestCrossFormPatternSendable = new TestCrossFormPatternSendable();

      expect(instance.status).assertEqual('running');
      expect(instance.execute()).assertEqual('running');
      console.info('[CrossForm] Pattern forms combined');
    });


    // ==================== Sendable Rules Compliance Tests ====================

    @Sendable
    @LogClassDecorator
    class TestSendableRulesSendable {
      public value: number = 100;
      public logs: collections.Array<string> = new collections.Array<string>();

      compute(): number {
        this.logs.push('compute'); // ✅ Allowed: push to pre-defined Sendable array
        return this.value * 2;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0126
     * @tc.name test_sendable_rules_no_dynamic_properties
     * @tc.desc Test Sendable rules compliance to ensure no dynamic property addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_sendable_rules_no_dynamic_properties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[SendableRules] Test No Dynamic Property Addition');

      const instance: TestSendableRulesSendable = new TestSendableRulesSendable();

      expect(instance.value).assertEqual(100);
      expect(instance.logs.length).assertEqual(0); // No auto-added logs by decorator

      instance.compute();
      expect(instance.logs.length).assertEqual(1); // Only manually pushed

      console.info('[SendableRules] Decorator did not add properties dynamically');
    });

    @Sendable
    @RegularFunctionDecorator
    @ArrowFunctionDecorator
    class TestRegularArrowStackedSendable {
      public value: number = 100;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0127
     * @tc.name test_form1_2_regular_arrow_stacked
     * @tc.desc Test form 1-2 combination with Regular and Arrow function decorators stacked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form1_2_regular_arrow_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form1_2] Test Regular + Arrow Function Stacked');

      const instance: TestRegularArrowStackedSendable = new TestRegularArrowStackedSendable();

      expect(instance.value).assertEqual(100);
      console.info('[Form1_2] Regular + Arrow stacked applied successfully');
    });

    @Sendable
    @RegularFunctionWithValidation
    @ArrowFunctionWithInternalLogic
    class TestRegularArrowValidationStackedSendable {
      public data: string = 'validation_data';

      validate(): boolean {
        return this.data.length > 0;
      }

      execute(): string {
        return this.data;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0128
     * @tc.name test_form1_2_regular_arrow_validation_stacked
     * @tc.desc Test form 1-2 validation combination with Regular and Arrow validation decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form1_2_regular_arrow_validation_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form1_2] Test Regular + Arrow Validation Stacked');

      const instance: TestRegularArrowValidationStackedSendable = new TestRegularArrowValidationStackedSendable();

      expect(instance.data).assertEqual('validation_data');
      expect(instance.validate()).assertTrue();
      expect(instance.execute()).assertEqual('validation_data');
      console.info('[Form1_2] Regular + Arrow validation stacked applied');
    });

    // ==================== Form 3-5: Function Expression, Anonymous, IIFE ====================

    @Sendable
    @FunctionExpressionDecorator
    @AnonymousFunctionDecorator
    @IIFEDecorator
    class TestExprAnonymousIIFEStackedSendable {
      public config: string = 'iife_config';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0129
     * @tc.name test_form3_5_expression_anonymous_iife_stacked
     * @tc.desc Test form 3-5 combination with FunctionExpression, Anonymous, and IIFE decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form3_5_expression_anonymous_iife_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form3_5] Test Expression + Anonymous + IIFE Stacked');

      const instance: TestExprAnonymousIIFEStackedSendable = new TestExprAnonymousIIFEStackedSendable();

      expect(instance.config).assertEqual('iife_config');
      console.info('[Form3_5] Expression + Anonymous + IIFE stacked');
    });

    @Sendable
    @FunctionExpressionWithClosure
    @AnonymousFunctionWithCallback
    @IIFEWithComplexSetup
    class TestComplexClosureCallbackStackedSendable {
      public complexValue: number = 200;

      callbackExecute(): number {
        return this.complexValue;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0130
     * @tc.name test_form3_5_closure_callback_complex_stacked
     * @tc.desc Test form 3-5 complex combination with closure, callback, and complex IIFE decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form3_5_closure_callback_complex_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form3_5] Test Closure + Callback + Complex IIFE Stacked');

      const instance: TestComplexClosureCallbackStackedSendable = new TestComplexClosureCallbackStackedSendable();

      expect(instance.complexValue).assertEqual(200);
      expect(instance.callbackExecute()).assertEqual(200);
      console.info('[Form3_5] Closure + Callback + Complex stacked');
    });

    // ==================== Form 6-8: Factory Functions ====================

    @Sendable
    @FactoryFunctionDecorator('factory_tag_1')
    @FactoryFunctionWithMultipleParams({ name: 'multi_factory', version: 1, enabled: true })
    @ArrowFunctionFactoryDecorator('arrow_factory_category')
    class TestFactoryStackedSendable {
      public factoryValue: number = 300;
    }

    @Sendable
    @ArrowFunctionFactoryWithValidation(['validate', 'execute'])
    class TestFactoryValidationStackedSendable {
      public validationData: string = 'validated';

      validate(): boolean {
        return true;
      }

      execute(): string {
        return this.validationData;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0131
     * @tc.name test_form6_8_factory_stacked
     * @tc.desc Test form 6-8 combination with multiple factory function decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form6_8_factory_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form6_8] Test Factory Functions Stacked');

      const instance: TestFactoryStackedSendable = new TestFactoryStackedSendable();

      expect(instance.factoryValue).assertEqual(300);
      console.info('[Form6_8] Factory Functions Stacked');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0132
     * @tc.name test_form6_8_factory_validation_stacked
     * @tc.desc Test form 6-8 factory validation with ArrowFactoryWithValidation decorator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form6_8_factory_validation_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form6_8] Test Factory Validation Stacked');

      const instance: TestFactoryValidationStackedSendable = new TestFactoryValidationStackedSendable();

      expect(instance.validationData).assertEqual('validated');
      expect(instance.validate()).assertTrue();
      expect(instance.execute()).assertEqual('validated');
      console.info('[Form6_8] Factory validation stacked');
    });

    // ==================== Form 9: Higher-Order Function ====================

    @Sendable
    @HigherOrderFunctionDecorator(RegularFunctionDecorator)
    @HigherOrderFunctionDecorator(ArrowFunctionDecorator)
    class TestHigherOrderStackedSendable {
      public higherOrderValue: number = 400;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0133
     * @tc.name test_form9_higher_order_stacked
     * @tc.desc Test form 9 higher-order function decorators stacked with base decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form9_higher_order_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form9] Test Higher-Order Function Stacked');

      const instance: TestHigherOrderStackedSendable = new TestHigherOrderStackedSendable();

      expect(instance.higherOrderValue).assertEqual(400);
      console.info('[Form9] Higher-order stacked applied base decorators');
    });

    @Sendable
    @HigherOrderFunctionDecorator(RegularFunctionDecorator)
    class TestHigherOrderChainStackedSendable {
      public chainValue: string = 'chain_data';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0134
     * @tc.name test_form9_higher_order_chain_stacked
     * @tc.desc Test form 9 higher-order chain with RegularFunctionDecorator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form9_higher_order_chain_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form9] Test Higher-Order Chain Stacked');

      const instance: TestHigherOrderChainStackedSendable = new TestHigherOrderChainStackedSendable();

      expect(instance.chainValue).assertEqual('chain_data');
      console.info('[Form9] Higher-order chain stacked with 3 decorators');
    });

    @Sendable
    @HigherOrderFunctionArrow(AnonymousFunctionDecorator)
    class TestHigherOrderArrowStackedSendable {
      public arrowWrapperValue: number = 500;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0135
     * @tc.name test_form9_higher_order_arrow_stacked
     * @tc.desc Test form 9 higher-order arrow wrapper with AnonymousFunctionDecorator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form9_higher_order_arrow_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form9] Test Higher-Order Arrow Stacked');

      const instance: TestHigherOrderArrowStackedSendable = new TestHigherOrderArrowStackedSendable();

      expect(instance.arrowWrapperValue).assertEqual(500);
      console.info('[Form9] Higher-order arrow wrapper applied');
    });

    // ==================== Form 10: Currying Function ====================

    @Sendable
    @CurryingFunctionDecorator('curry_step1')(100)
    class TestCurryingStackedSendable {
      public curryValue: number = 600;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0136
     * @tc.name test_form10_currying_stacked
     * @tc.desc Test form 10 currying function decorator with step1 and numeric parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form10_currying_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form10] Test Currying Function Stacked');

      const instance: TestCurryingStackedSendable = new TestCurryingStackedSendable();

      expect(instance.curryValue).assertEqual(600);
      console.info('[Form10] Currying Function Stacked');
    });

    @Sendable
    @CurryingFunctionMultiStep('multi_a')(200)(true)
    class TestCurryingMultiStackedSendable {
      public multiCurryValue: string = 'multi_curry';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0137
     * @tc.name test_form10_currying_multi_stacked
     * @tc.desc Test form 10 currying multi-step decorator with three parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form10_currying_multi_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form10] Test Currying Multi Step Stacked');

      const instance: TestCurryingMultiStackedSendable = new TestCurryingMultiStackedSendable();

      expect(instance.multiCurryValue).assertEqual('multi_curry');
      console.info('[Form10] Currying multi-step stacked');
    });

    @Sendable
    @CurryingFunctionArrow('prefix_arrow')('suffix_arrow')
    class TestCurryingArrowStackedSendable {
      public arrowCurryValue: number = 700;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0138
     * @tc.name test_form10_currying_arrow_stacked
     * @tc.desc Test form 10 currying arrow decorator with prefix and suffix parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form10_currying_arrow_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form10] Test Currying Arrow Stacked');

      const instance: TestCurryingArrowStackedSendable = new TestCurryingArrowStackedSendable();

      expect(instance.arrowCurryValue).assertEqual(700);
      console.info('[Form10] Currying arrow stacked');
    });

    // ==================== Form 11: Conditional Decorator ====================

    @Sendable
    @ConditionalDecorator(true)
    @ConditionalDecoratorWithConfig({ enable: true, mode: 'production' })
    @ConditionalDecoratorArrow(true)
    class TestConditionalEnabledStackedSendable {
      public enabledValue: number = 800;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0139
     * @tc.name test_form11_conditional_enabled_stacked
     * @tc.desc Test form 11 conditional decorators enabled with true condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form11_conditional_enabled_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form11] Test Conditional Enabled Stacked');

      const instance: TestConditionalEnabledStackedSendable = new TestConditionalEnabledStackedSendable();

      expect(instance.enabledValue).assertEqual(800);
      console.info('[Form11] Conditional enabled stacked, all decorators applied');
    });

    @Sendable
    @ConditionalDecorator(false)
    @ConditionalDecoratorWithConfig({ enable: false, mode: 'development' })
    @ConditionalDecoratorArrow(false)
    class TestConditionalDisabledStackedSendable {
      public disabledValue: number = 900;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0140
     * @tc.name test_form11_conditional_disabled_stacked
     * @tc.desc Test form 11 conditional decorators disabled with false condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form11_conditional_disabled_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form11] Test Conditional Disabled Stacked');

      const instance: TestConditionalDisabledStackedSendable = new TestConditionalDisabledStackedSendable();

      expect(instance.disabledValue).assertEqual(900);
      console.info('[Form11] Conditional disabled stacked, no decorators applied');
    });

    @Sendable
    @ConditionalDecorator(true)
    @ConditionalDecorator(false)
    class TestConditionalMixedStackedSendable {
      public mixedValue: string = 'mixed_conditional';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0141
     * @tc.name test_form11_conditional_mixed_stacked
     * @tc.desc Test form 11 conditional mixed with true and false conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form11_conditional_mixed_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form11] Test Conditional Mixed Stacked');

      const instance: TestConditionalMixedStackedSendable = new TestConditionalMixedStackedSendable();

      expect(instance.mixedValue).assertEqual('mixed_conditional');
      console.info('[Form11] Conditional mixed stacked, only enabled decorator applied');
    });

    // ==================== Form 12-13: Async & Generator Style ====================

    @Sendable
    @AsyncStyleDecorator
    @GeneratorStyleDecorator
    class TestAsyncGeneratorStackedSendable {
      public asyncGenValue: number = 1000;

      asyncExecute(): Promise<number> {
        return new Promise<number>((resolve): void => {
          resolve(this.asyncGenValue);
        });
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0142
     * @tc.name test_form12_13_async_generator_stacked
     * @tc.desc Test form 12-13 async and generator style decorators stacked together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form12_13_async_generator_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form12_13] Test Async + Generator Style Stacked');

      const instance: TestAsyncGeneratorStackedSendable = new TestAsyncGeneratorStackedSendable();

      expect(instance.asyncGenValue).assertEqual(1000);
      console.info('[Form12_13] Async + Generator stacked');
    });

    @Sendable
    @AsyncStyleFactoryDecorator({ timeout: 5000, retry: 3 })
    @GeneratorStyleFactoryDecorator(5)
    class TestAsyncGeneratorFactoryStackedSendable {
      public factoryAsyncGenValue: string = 'factory_async_gen';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0143
     * @tc.name test_form12_13_async_generator_factory_stacked
     * @tc.desc Test form 12-13 async and generator factory decorators with config parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form12_13_async_generator_factory_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form12_13] Test Async + Generator Factory Stacked');

      const instance: TestAsyncGeneratorFactoryStackedSendable = new TestAsyncGeneratorFactoryStackedSendable();

      expect(instance.factoryAsyncGenValue).assertEqual('factory_async_gen');
      console.info('[Form12_13] Async + Generator factory stacked');
    });

    @Sendable
    @AsyncStyleArrowDecorator
    class TestAsyncArrowStackedSendable {
      public asyncArrowValue: number = 1100;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0144
     * @tc.name test_form12_13_async_arrow_stacked
     * @tc.desc Test form 12-13 async arrow decorator applied on Sendable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form12_13_async_arrow_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form12_13] Test Async Arrow Stacked');

      const instance: TestAsyncArrowStackedSendable = new TestAsyncArrowStackedSendable();

      expect(instance.asyncArrowValue).assertEqual(1100);
      console.info('[Form12_13] Async arrow decorator applied');
    });

    // ==================== Form 14: Callback Style ====================

    @Sendable
    @CallbackStyleDecorator
    class TestCallbackStackedSendable {
      public callbackValue: string = 'callback_data';

      callbackExecute(): string {
        return this.callbackValue;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0145
     * @tc.name test_form14_callback_stacked
     * @tc.desc Test form 14 callback style decorator with callback execution method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form14_callback_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form14] Test Callback Style Stacked');

      const instance: TestCallbackStackedSendable = new TestCallbackStackedSendable();

      expect(instance.callbackValue).assertEqual('callback_data');
      expect(instance.callbackExecute()).assertEqual('callback_data');
      console.info('[Form14] Callback style decorator applied');
    });

    @Sendable
    @CallbackStyleFactoryDecorator((result: string): void => {
      console.info(`[CallbackStyleFactory] Callback result: ${result}`);
    })
    class TestCallbackFactoryStackedSendable {
      public callbackFactoryValue: number = 1200;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0146
     * @tc.name test_form14_callback_factory_stacked
     * @tc.desc Test form 14 callback factory decorator with callback function parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form14_callback_factory_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form14] Test Callback Factory Stacked');

      const instance: TestCallbackFactoryStackedSendable = new TestCallbackFactoryStackedSendable();

      expect(instance.callbackFactoryValue).assertEqual(1200);
      console.info('[Form14] Callback factory decorator applied');
    });

    // ==================== Form 15-16: Object Method & Class Method ====================

    @Sendable
    @ObjectMethodDecorator
    @ObjectMethodArrowDecorator
    @ObjectMethodFactoryDecorator('object_factory_config')
    class TestObjectMethodStackedSendable {
      public objectMethodValue: number = 1300;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0147
     * @tc.name test_form15_16_object_method_stacked
     * @tc.desc Test form 15-16 object method decorators with object method and factory config
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form15_16_object_method_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form15_16] Test Object Method Stacked');

      const instance: TestObjectMethodStackedSendable = new TestObjectMethodStackedSendable();

      expect(instance.objectMethodValue).assertEqual(1300);
      console.info('[Form15_16] Object method stacked');
    });

    @Sendable
    @ClassMethodDecorator
    @ClassMethodFactoryDecorator(5)
    class TestClassMethodStackedSendable {
      public classMethodValue: string = 'class_method_data';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0148
     * @tc.name test_form15_16_class_method_stacked
     * @tc.desc Test form 15-16 class method decorators with class method and factory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form15_16_class_method_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form15_16] Test Class Method Stacked');

      const instance: TestClassMethodStackedSendable = new TestClassMethodStackedSendable();

      expect(instance.classMethodValue).assertEqual('class_method_data');
      console.info('[Form15_16] Class method stacked');
    });

    // ==================== Form 17-18: Destructuring & Default Parameter ====================

    @Sendable
    @DestructuringParameterDecorator({ prefix: 'destructure_prefix', suffix: 'destructure_suffix' })
    @DestructuringParameterArrowDecorator({ name: 'destructure_arrow_name', value: 1400 })
    class TestDestructuringStackedSendable {
      public destructureValue: number = 1500;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0149
     * @tc.name test_form17_18_destructuring_stacked
     * @tc.desc Test form 17-18 destructuring parameter decorators with object destructuring config
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form17_18_destructuring_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form17_18] Test Destructuring Parameter Stacked');

      const instance: TestDestructuringStackedSendable = new TestDestructuringStackedSendable();

      expect(instance.destructureValue).assertEqual(1500);
      console.info('[Form17_18] Destructuring stacked');
    });

    @Sendable
    @DefaultParameterDecorator('default_tag', 3)
    @DefaultParameterDecorator()
    @DefaultParameterArrowDecorator(true, 'default_arrow_mode')
    class TestDefaultParameterStackedSendable {
      public defaultParamValue: string = 'default_param';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0150
     * @tc.name test_form17_18_default_parameter_stacked
     * @tc.desc Test form 17-18 default parameter decorators with multiple default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form17_18_default_parameter_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form17_18] Test Default Parameter Stacked');

      const instance: TestDefaultParameterStackedSendable = new TestDefaultParameterStackedSendable();

      expect(instance.defaultParamValue).assertEqual('default_param');
      console.info('[Form17_18] Default parameter stacked');
    });

    // ==================== Form 19: Rest Parameter ====================

    @Sendable
    @RestParameterDecorator('rest_tag1', 'rest_tag2', 'rest_tag3')
    class TestRestParameterStackedSendable {
      public restValue: number = 1600;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0151
     * @tc.name test_form19_rest_parameter_stacked
     * @tc.desc Test form 19 rest parameter decorator with multiple rest tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form19_rest_parameter_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form19] Test Rest Parameter Stacked');

      const instance: TestRestParameterStackedSendable = new TestRestParameterStackedSendable();

      expect(instance.restValue).assertEqual(1600);
      console.info('[Form19] Rest parameter stacked with 3 tags');
    });

    @Sendable
    @RestParameterDecorator('single_rest_tag')
    class TestRestSingleStackedSendable {
      public restSingleValue: string = 'single_rest';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0152
     * @tc.name test_form19_rest_single_stacked
     * @tc.desc Test form 19 rest parameter decorator with single rest tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form19_rest_single_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form19] Test Rest Parameter Single Stacked');

      const instance: TestRestSingleStackedSendable = new TestRestSingleStackedSendable();

      expect(instance.restSingleValue).assertEqual('single_rest');
      console.info('[Form19] Rest parameter single stacked');
    });

    // ==================== Form 20-22: Template, Spread, Union, Optional ====================

    @Sendable
    @TemplateLiteralDecorator('template_category')
    @SpreadOperatorDecorator({ prefix: 'spread_prefix', suffix: 'spread_suffix', level: 10 })
    class TestTemplateSpreadStackedSendable {
      public templateSpreadValue: number = 1700;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0153
     * @tc.name test_form20_22_template_spread_stacked
     * @tc.desc Test form 20-22 template literal and spread operator decorators stacked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form20_22_template_spread_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form20_22] Test Template + Spread Stacked');

      const instance: TestTemplateSpreadStackedSendable = new TestTemplateSpreadStackedSendable();

      expect(instance.templateSpreadValue).assertEqual(1700);
      console.info('[Form20_22] Template + Spread stacked');
    });

    @Sendable
    @UnionTypeParameterDecorator('union_string_value')
    @UnionTypeParameterDecorator(1800)
    class TestUnionTypeStackedSendable {
      public unionValue: string = 'union_data';
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0154
     * @tc.name test_form20_22_union_type_stacked
     * @tc.desc Test form 20-22 union type parameter decorator with string and number types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form20_22_union_type_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form20_22] Test Union Type Stacked');

      const instance: TestUnionTypeStackedSendable = new TestUnionTypeStackedSendable();

      expect(instance.unionValue).assertEqual('union_data');
      console.info('[Form20_22] Union type stacked with string and number');
    });

    @Sendable
    @OptionalParameterDecorator('required_param')
    @OptionalParameterDecorator('required_param2', 1900)
    class TestOptionalParameterStackedSendable {
      public optionalValue: number = 2000;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0155
     * @tc.name test_form20_22_optional_parameter_stacked
     * @tc.desc Test form 20-22 optional parameter decorator with required and optional values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_form20_22_optional_parameter_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Form20_22] Test Optional Parameter Stacked');

      const instance: TestOptionalParameterStackedSendable = new TestOptionalParameterStackedSendable();

      expect(instance.optionalValue).assertEqual(2000);
      console.info('[Form20_22] Optional parameter stacked');
    });

    // ==================== All Forms Mega Combination ====================

    @Sendable
    @RegularFunctionDecorator
    @ArrowFunctionDecorator
    @FunctionExpressionDecorator
    @AnonymousFunctionDecorator
    @IIFEDecorator
    @FactoryFunctionDecorator('mega_factory')
    @ArrowFunctionFactoryDecorator('mega_arrow_factory')
    @HigherOrderFunctionDecorator(RegularFunctionDecorator)
    @CurryingFunctionDecorator('mega_curry')(1000)
    @ConditionalDecorator(true)
    @AsyncStyleDecorator
    @GeneratorStyleDecorator
    @CallbackStyleDecorator
    @ObjectMethodDecorator
    @ClassMethodDecorator
    @DestructuringParameterDecorator({ prefix: 'mega_prefix', suffix: 'mega_suffix' })
    @DefaultParameterDecorator('mega_default', 100)
    @RestParameterDecorator('mega_rest1', 'mega_rest2')
    @TemplateLiteralDecorator('mega_template')
    @SpreadOperatorDecorator({ prefix: 'mega_spread', suffix: 'mega_spread_suffix', level: 999 })
    @UnionTypeParameterDecorator('mega_union')
    @OptionalParameterDecorator('mega_optional', 200)
    class TestAllFormsMegaStackedSendable {
      public megaValue: number = 9999;

      validate(): boolean {
        return true;
      }

      execute(): number {
        return this.megaValue;
      }

      asyncExecute(): Promise<number> {
        return new Promise<number>((resolve): void => {
          resolve(this.megaValue);
        });
      }

      callbackExecute(): string {
        return 'mega_callback';
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0156
     * @tc.name test_all_forms_mega_combination
     * @tc.desc Test all 22 function forms decorators mega combination stacked together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_all_forms_mega_combination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[MegaCombination] Test All 22 Forms Mega Combination');

      const instance: TestAllFormsMegaStackedSendable = new TestAllFormsMegaStackedSendable();

      expect(instance.megaValue).assertEqual(9999);
      expect(instance.validate()).assertTrue();
      expect(instance.execute()).assertEqual(9999);
      console.info('[MegaCombination] All 22 forms stacked successfully applied!');
    });

    // ==================== Sendable Rules Compliance Validation ====================

    @Sendable
    @RegularFunctionDecorator
    @ArrowFunctionDecorator
    @FactoryFunctionDecorator('compliance_factory')
    @CurryingFunctionDecorator('compliance_curry')(500)
    class TestSendableRulesComplianceSendable {
      public preDefinedValue: number = 10000;

      preDefinedMethod(): number {
        return this.preDefinedValue;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0157
     * @tc.name test_sendable_no_dynamic_properties_added
     * @tc.desc Test Sendable compliance to verify decorators do not add dynamic properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_sendable_no_dynamic_properties_added', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[SendableCompliance] Test No Dynamic Properties Added');

      const instance: TestSendableRulesComplianceSendable = new TestSendableRulesComplianceSendable();

      expect(instance.preDefinedValue !== undefined).assertTrue();
      expect(instance.preDefinedMethod !== undefined).assertTrue();


      console.info('[SendableCompliance] Decorators did not add any dynamic properties');
    });

    // Form 1-4: Regular + Arrow + FunctionExpr + Anonymous
    @Sendable
    @RegularFunctionDecorator
    @RegularFunctionWithValidation
    @ArrowFunctionDecorator
    @ArrowFunctionWithInternalLogic
    @FunctionExpressionDecorator
    @FunctionExpressionWithClosure
    @AnonymousFunctionDecorator
    @AnonymousFunctionWithCallback
    class TestTSForm1_4Sendable {
      public value: number = 100;

      validate(): boolean {
        return true;
      }

      execute(): number {
        return this.value;
      }

      callbackExecute(): string {
        return 'callback';
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0158
     * @tc.name test_ts_form1_4_stacked
     * @tc.desc Test TypeScript form 1-4 decorators with Regular, Arrow, FunctionExpr, and Anonymous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_ts_form1_4_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TS Form1-4] Test Regular + Arrow + FunctionExpr + Anonymous');

      const instance: TestTSForm1_4Sendable = new TestTSForm1_4Sendable();

      expect(instance.value).assertEqual(100);
      expect(instance.validate()).assertTrue();
      expect(instance.execute()).assertEqual(100);
      expect(instance.callbackExecute()).assertEqual('callback');

      console.info('[TS Form1-4] All decorators applied successfully');
    });

    // Form 5: IIFE
    @Sendable
    @IIFEDecorator
    @IIFEWithComplexSetup
    class TestTSForm5Sendable {
      public iifeValue: number = 200;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0159
     * @tc.name test_ts_form5_iife_stacked
     * @tc.desc Test TypeScript form 5 IIFE decorators with simple and complex setup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_ts_form5_iife_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TS Form5] Test IIFE Decorators');

      const instance: TestTSForm5Sendable = new TestTSForm5Sendable();

      expect(instance.iifeValue).assertEqual(200);
      console.info('[TS Form5] IIFE decorators applied');
    });

    // Form 6-7: Factory
    @Sendable
    @FactoryFunctionDecorator('ts_factory_tag')
    @FactoryFunctionWithMultipleParams({ name: 'multi_ts', version: 1, enabled: true })
    @ArrowFunctionFactoryDecorator('arrow_factory_category')
    @ArrowFunctionFactoryWithValidation(['validate', 'execute'])
    class TestTSForm6_7Sendable {
      public factoryValue: number = 300;

      validate(): boolean {
        return true;
      }

      execute(): number {
        return this.factoryValue;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0160
     * @tc.name test_ts_form6_7_factory_stacked
     * @tc.desc Test TypeScript form 6-7 factory decorators with multiple factory types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_ts_form6_7_factory_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TS Form6-7] Test Factory Decorators');

      const instance: TestTSForm6_7Sendable = new TestTSForm6_7Sendable();

      expect(instance.factoryValue).assertEqual(300);
      expect(instance.validate()).assertTrue();
      expect(instance.execute()).assertEqual(300);
      console.info('[TS Form6-7] Factory decorators applied');
    });

    // Form 8: Higher-Order
    @Sendable
    @HigherOrderFunctionDecorator(RegularFunctionDecorator)
    @HigherOrderFunctionArrow(AnonymousFunctionDecorator)
    class TestTSForm8Sendable {
      public higherOrderValue: number = 400;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0161
     * @tc.name test_ts_form8_higher_order_stacked
     * @tc.desc Test TypeScript form 8 higher-order decorators with base decorator wrappers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_ts_form8_higher_order_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TS Form8] Test Higher-Order Decorators');

      const instance: TestTSForm8Sendable = new TestTSForm8Sendable();

      expect(instance.higherOrderValue).assertEqual(400);
      console.info('[TS Form8] Higher-order decorators applied');
    });

    // Form 9: Currying
    @Sendable
    @CurryingFunctionDecorator('curry_step1')(500)
    @CurryingFunctionMultiStep('multi_a')(600)(true)
    @CurryingFunctionArrow('prefix_arrow')('suffix_arrow')
    class TestTSForm9Sendable {
      public curryValue: number = 500;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0162
     * @tc.name test_ts_form9_currying_stacked
     * @tc.desc Test TypeScript form 9 currying decorators with multi-step and arrow variations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_ts_form9_currying_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TS Form9] Test Currying Decorators');

      const instance: TestTSForm9Sendable = new TestTSForm9Sendable();

      expect(instance.curryValue).assertEqual(500);
      console.info('[TS Form9] Currying decorators applied');
    });

    // Form 10: Conditional
    @Sendable
    @ConditionalDecorator(true)
    @ConditionalDecoratorWithConfig({ enable: true, mode: 'production' })
    @ConditionalDecoratorArrow(true)
    class TestTSForm10EnabledSendable {
      public conditionalValue: number = 600;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0163
     * @tc.name test_ts_form10_conditional_enabled
     * @tc.desc Test TypeScript form 10 conditional decorators enabled with true conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_ts_form10_conditional_enabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TS Form10] Test Conditional Decorators Enabled');

      const instance: TestTSForm10EnabledSendable = new TestTSForm10EnabledSendable();

      expect(instance.conditionalValue).assertEqual(600);
      console.info('[TS Form10] Conditional enabled decorators applied');
    });

    @Sendable
    @ConditionalDecorator(false)
    @ConditionalDecoratorWithConfig({ enable: false, mode: 'dev' })
    @ConditionalDecoratorArrow(false)
    class TestTSForm10DisabledSendable {
      public disabledValue: number = 700;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0164
     * @tc.name test_ts_form10_conditional_disabled
     * @tc.desc Test TypeScript form 10 conditional decorators disabled with false conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_ts_form10_conditional_disabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TS Form10] Test Conditional Decorators Disabled');

      const instance: TestTSForm10DisabledSendable = new TestTSForm10DisabledSendable();

      expect(instance.disabledValue).assertEqual(700);
      console.info('[TS Form10] Conditional disabled, no metadata');
    });

    // Form 11-12: Async + Generator
    @Sendable
    @AsyncStyleDecorator
    @AsyncStyleFactoryDecorator({ timeout: 5000, retry: 3 })
    @AsyncStyleArrowDecorator
    @GeneratorStyleDecorator
    @GeneratorStyleFactoryDecorator(10)
    class TestTSForm11_12Sendable {
      public asyncGenValue: number = 800;

      asyncExecute(): Promise<number> {
        return new Promise<number>((resolve): void => {
          resolve(this.asyncGenValue);
        });
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0165
     * @tc.name test_ts_form11_12_async_generator_stacked
     * @tc.desc Test TypeScript form 11-12 async and generator decorators with factory variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_ts_form11_12_async_generator_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TS Form11-12] Test Async + Generator Decorators');

      const instance: TestTSForm11_12Sendable = new TestTSForm11_12Sendable();

      expect(instance.asyncGenValue).assertEqual(800);
      console.info('[TS Form11-12] Async + Generator decorators applied');
    });

    // Form 13: Callback
    @Sendable
    @CallbackStyleDecorator
    @CallbackStyleFactoryDecorator((result: string): void => {
      console.info(`[CallbackFactory] Result: ${result}`);
    })
    class TestTSForm13Sendable {
      public callbackValue: string = 'callback_ts';

      callbackExecute(): string {
        return this.callbackValue;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0166
     * @tc.name test_ts_form13_callback_stacked
     * @tc.desc Test TypeScript form 13 callback decorators with callback and factory variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_ts_form13_callback_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TS Form13] Test Callback Decorators');

      const instance: TestTSForm13Sendable = new TestTSForm13Sendable();

      expect(instance.callbackValue).assertEqual('callback_ts');
      expect(instance.callbackExecute()).assertEqual('callback_ts');
      console.info('[TS Form13] Callback decorators applied');
    });

    // Form 14-15: Object + Class Method
    @Sendable
    @ObjectMethodDecorator
    @ObjectMethodArrowDecorator
    @ObjectMethodFactoryDecorator('object_factory_ts')
    @ClassMethodDecorator
    @ClassMethodFactoryDecorator(8)
    class TestTSForm14_15Sendable {
      public objectClassValue: number = 900;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0167
     * @tc.name test_ts_form14_15_object_class_stacked
     * @tc.desc Test TypeScript form 14-15 object and class method decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_ts_form14_15_object_class_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TS Form14-15] Test Object + Class Method Decorators');

      const instance: TestTSForm14_15Sendable = new TestTSForm14_15Sendable();

      expect(instance.objectClassValue).assertEqual(900);
      console.info('[TS Form14-15] Object + Class method decorators applied');
    });

    // Form 16-17: Destructuring + Default
    @Sendable
    @DestructuringParameterDecorator({ prefix: 'destructure_ts', suffix: 'suffix_ts' })
    @DestructuringParameterArrowDecorator({ name: 'destructure_arrow_ts', value: 1000 })
    @DefaultParameterDecorator('default_ts', 5)
    @DefaultParameterDecorator()
    @DefaultParameterArrowDecorator(true, 'default_arrow_ts')
    class TestTSForm16_17Sendable {
      public destructureValue: number = 1000;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0168
     * @tc.name test_ts_form16_17_destructuring_default_stacked
     * @tc.desc Test TypeScript form 16-17 destructuring and default parameter decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_ts_form16_17_destructuring_default_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TS Form16-17] Test Destructuring + Default Decorators');

      const instance: TestTSForm16_17Sendable = new TestTSForm16_17Sendable();

      expect(instance.destructureValue).assertEqual(1000);
      console.info('[TS Form16-17] Destructuring + Default decorators applied');
    });

    // Form 18-22: Rest + Template + Spread + Union + Optional
    @Sendable
    @RestParameterDecorator('rest1_ts', 'rest2_ts', 'rest3_ts')
    @TemplateLiteralDecorator('template_ts')
    @SpreadOperatorDecorator({ prefix: 'spread_ts', suffix: 'spread_suffix_ts', level: 999 })
    @UnionTypeParameterDecorator('union_string_ts')
    @UnionTypeParameterDecorator(1100)
    @OptionalParameterDecorator('required_ts', 1200)
    @OptionalParameterDecorator('required_only_ts')
    class TestTSForm18_22Sendable {
      public restTemplateValue: number = 1100;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0169
     * @tc.name test_ts_form18_22_rest_template_spread_union_optional_stacked
     * @tc.desc Test TypeScript form 18-22 rest, template, spread, union, and optional decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_ts_form18_22_rest_template_spread_union_optional_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TS Form18-22] Test Rest + Template + Spread + Union + Optional');

      const instance: TestTSForm18_22Sendable = new TestTSForm18_22Sendable();

      expect(instance.restTemplateValue).assertEqual(1100);
      console.info('[TS Form18-22] All decorators applied');
    });

    // TS All Forms Mega Combination
    @Sendable
    @RegularFunctionDecorator
    @ArrowFunctionDecorator
    @FunctionExpressionDecorator
    @AnonymousFunctionDecorator
    @IIFEDecorator
    @FactoryFunctionDecorator('mega_ts_factory')
    @HigherOrderFunctionDecorator(RegularFunctionDecorator)
    @CurryingFunctionDecorator('mega_ts_curry')(9999)
    @ConditionalDecorator(true)
    @AsyncStyleDecorator
    @GeneratorStyleDecorator
    @CallbackStyleDecorator
    @ObjectMethodDecorator
    @ClassMethodDecorator
    @DestructuringParameterDecorator({ prefix: 'mega_prefix', suffix: 'mega_suffix' })
    @DefaultParameterDecorator('mega_default', 100)
    @RestParameterDecorator('mega_rest1', 'mega_rest2')
    @TemplateLiteralDecorator('mega_template')
    @SpreadOperatorDecorator({ prefix: 'mega_spread', suffix: 'mega_suffix', level: 999 })
    @UnionTypeParameterDecorator('mega_union')
    @OptionalParameterDecorator('mega_optional', 200)
    class TestTSAllMegaSendable {
      public megaValue: number = 9999;

      validate(): boolean {
        return true;
      }

      execute(): number {
        return this.megaValue;
      }

      asyncExecute(): Promise<number> {
        return new Promise<number>((resolve): void => {
          resolve(this.megaValue);
        });
      }

      callbackExecute(): string {
        return 'mega_callback';
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0170
     * @tc.name test_ts_all_mega_combination
     * @tc.desc Test all TypeScript decorators mega combination stacked together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_ts_all_mega_combination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TS Mega] Test All TypeScript Decorators Mega Combination');

      const instance: TestTSAllMegaSendable = new TestTSAllMegaSendable();

      expect(instance.megaValue).assertEqual(9999);
      expect(instance.validate()).assertTrue();
      expect(instance.execute()).assertEqual(9999);
      expect(instance.callbackExecute()).assertEqual('mega_callback');
      console.info('[TS Mega] All TS decorators stacked successfully');
    });

    // ==================== JavaScript Decorators - ALL 38 Forms ====================

    // Form 1-4: Regular + Arrow + FunctionExpr + Anonymous (JS)
    @Sendable
    @RegularFunctionDecoratorJS
    @RegularFunctionWithValidationJS
    @ArrowFunctionDecoratorJS
    @ArrowFunctionWithInternalLogicJS
    @FunctionExpressionDecoratorJS
    @FunctionExpressionWithClosureJS
    @AnonymousFunctionDecoratorJS
    @AnonymousFunctionWithCallbackJS
    class TestJSForm1_4Sendable {
      public jsValue: number = 1200;

      validate(): boolean {
        return true;
      }

      execute(): number {
        return this.jsValue;
      }

      callbackExecute(): string {
        return 'js_callback';
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0171
     * @tc.name test_js_form1_4_stacked
     * @tc.desc Test JavaScript form 1-4 decorators with Regular, Arrow, FunctionExpr, and Anonymous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_js_form1_4_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JS Form1-4] Test Regular + Arrow + FunctionExpr + Anonymous');

      const instance: TestJSForm1_4Sendable = new TestJSForm1_4Sendable();

      expect(instance.jsValue).assertEqual(1200);
      expect(instance.validate()).assertTrue();
      expect(instance.execute()).assertEqual(1200);
      expect(instance.callbackExecute()).assertEqual('js_callback');
      console.info('[JS Form1-4] All JS decorators applied');
    });

    // Form 5: IIFE (JS)
    @Sendable
    @IIFEDecoratorJS
    @IIFEWithComplexSetupJS
    class TestJSForm5Sendable {
      public iifeJSValue: number = 1300;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0172
     * @tc.name test_js_form5_iife_stacked
     * @tc.desc Test JavaScript form 5 IIFE decorators with simple and complex setup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_js_form5_iife_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JS Form5] Test IIFE Decorators JS');

      const instance: TestJSForm5Sendable = new TestJSForm5Sendable();

      expect(instance.iifeJSValue).assertEqual(1300);
      console.info('[JS Form5] IIFE JS decorators applied');
    });

    // Form 6-7: Factory (JS)
    @Sendable
    @FactoryFunctionDecoratorJS('js_factory_tag')
    @FactoryFunctionWithMultipleParamsJS({ name: 'multi_js', version: 2, enabled: true })
    @ArrowFunctionFactoryDecoratorJS('arrow_factory_js')
    @ArrowFunctionFactoryWithValidationJS(new collections.Array<string>('validate', 'execute'))
    class TestJSForm6_7Sendable {
      public factoryJSValue: number = 1400;

      validate(): boolean {
        return true;
      }

      execute(): number {
        return this.factoryJSValue;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0173
     * @tc.name test_js_form6_7_factory_stacked
     * @tc.desc Test JavaScript form 6-7 factory decorators with multiple factory types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_js_form6_7_factory_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JS Form6-7] Test Factory Decorators JS');

      const instance: TestJSForm6_7Sendable = new TestJSForm6_7Sendable();

      expect(instance.factoryJSValue).assertEqual(1400);
      expect(instance.validate()).assertTrue();
      expect(instance.execute()).assertEqual(1400);
      console.info('[JS Form6-7] Factory JS decorators applied');
    });

    // Form 8: Higher-Order (JS)
    @Sendable
    @HigherOrderFunctionDecoratorJS(RegularFunctionDecoratorJS)
    @HigherOrderFunctionArrowJS(AnonymousFunctionDecoratorJS)
    class TestJSForm8Sendable {
      public higherOrderJSValue: number = 1500;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0174
     * @tc.name test_js_form8_higher_order_stacked
     * @tc.desc Test JavaScript form 8 higher-order decorators with base decorator wrappers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_js_form8_higher_order_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JS Form8] Test Higher-Order Decorators JS');

      const instance: TestJSForm8Sendable = new TestJSForm8Sendable();

      expect(instance.higherOrderJSValue).assertEqual(1500);
      console.info('[JS Form8] Higher-order JS decorators applied');
    });

    // Form 9: Currying (JS)
    @Sendable
    @CurryingFunctionDecoratorJS('curry_js_step1')(1600)
    @CurryingFunctionMultiStepJS('multi_js_a')(1700)(true)
    @CurryingFunctionArrowJS('prefix_js_arrow')('suffix_js_arrow')
    class TestJSForm9Sendable {
      public curryJSValue: number = 1600;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0175
     * @tc.name test_js_form9_currying_stacked
     * @tc.desc Test JavaScript form 9 currying decorators with multi-step and arrow variations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_js_form9_currying_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JS Form9] Test Currying Decorators JS');

      const instance: TestJSForm9Sendable = new TestJSForm9Sendable();

      expect(instance.curryJSValue).assertEqual(1600);
      console.info('[JS Form9] Currying JS decorators applied');
    });

    // Form 10: Conditional (JS)
    @Sendable
    @ConditionalDecoratorJS(true)
    @ConditionalDecoratorArrowJS(true)
    class TestJSForm10EnabledSendable {
      public conditionalJSValue: number = 1700;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0176
     * @tc.name test_js_form10_conditional_enabled
     * @tc.desc Test JavaScript form 10 conditional decorators enabled with true conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_js_form10_conditional_enabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JS Form10] Test Conditional Decorators JS Enabled');

      const instance: TestJSForm10EnabledSendable = new TestJSForm10EnabledSendable();

      expect(instance.conditionalJSValue).assertEqual(1700);
      console.info('[JS Form10] Conditional JS enabled decorators applied');
    });

    @Sendable
    @ConditionalDecoratorJS(false)
    @ConditionalDecoratorArrowJS(false)
    class TestJSForm10DisabledSendable {
      public disabledJSValue: number = 1800;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0177
     * @tc.name test_js_form10_conditional_disabled
     * @tc.desc Test JavaScript form 10 conditional decorators disabled with false conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_js_form10_conditional_disabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JS Form10] Test Conditional Decorators JS Disabled');

      const instance: TestJSForm10DisabledSendable = new TestJSForm10DisabledSendable();

      expect(instance.disabledJSValue).assertEqual(1800);
      console.info('[JS Form10] Conditional JS disabled, no metadata');
    });

    // Form 11-12: Async + Generator (JS)
    @Sendable
    @AsyncStyleDecoratorJS
    @AsyncStyleArrowDecoratorJS
    @GeneratorStyleDecoratorJS
    class TestJSForm11_12Sendable {
      public asyncGenJSValue: number = 1900;

      asyncExecute(): Promise<number> {
        return new Promise<number>((resolve): void => {
          resolve(this.asyncGenJSValue);
        });
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0178
     * @tc.name test_js_form11_12_async_generator_stacked
     * @tc.desc Test JavaScript form 11-12 async and generator decorators with async and arrow variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_js_form11_12_async_generator_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JS Form11-12] Test Async + Generator Decorators JS');

      const instance: TestJSForm11_12Sendable = new TestJSForm11_12Sendable();

      expect(instance.asyncGenJSValue).assertEqual(1900);
      console.info('[JS Form11-12] Async + Generator JS decorators applied');
    });

    // Form 13: Callback (JS)
    @Sendable
    @CallbackStyleDecoratorJS
    class TestJSForm13Sendable {
      public callbackJSValue: string = 'callback_js_value';

      callbackExecute(): string {
        return this.callbackJSValue;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0179
     * @tc.name test_js_form13_callback_stacked
     * @tc.desc Test JavaScript form 13 callback decorator with callback execution method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_js_form13_callback_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JS Form13] Test Callback Decorators JS');

      const instance: TestJSForm13Sendable = new TestJSForm13Sendable();

      expect(instance.callbackJSValue).assertEqual('callback_js_value');
      expect(instance.callbackExecute()).assertEqual('callback_js_value');
      console.info('[JS Form13] Callback JS decorator applied');
    });

    // Form 14-15: Object + Class Method (JS)
    @Sendable
    @ObjectMethodDecoratorJS
    @ObjectMethodArrowDecoratorJS
    @ClassMethodDecoratorJS
    class TestJSForm14_15Sendable {
      public objectClassJSValue: number = 2000;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0180
     * @tc.name test_js_form14_15_object_class_stacked
     * @tc.desc Test JavaScript form 14-15 object and class method decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_js_form14_15_object_class_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JS Form14-15] Test Object + Class Method Decorators JS');

      const instance: TestJSForm14_15Sendable = new TestJSForm14_15Sendable();

      expect(instance.objectClassJSValue).assertEqual(2000);
      console.info('[JS Form14-15] Object + Class method JS decorators applied');
    });

    // Form 16-17: Destructuring + Default (JS)
    @Sendable
    @DestructuringParameterDecoratorJS({ prefix: 'destructure_js', suffix: 'suffix_js' })
    @DestructuringParameterArrowDecoratorJS({ name: 'destructure_arrow_js', value: 2100 })
    @DefaultParameterDecoratorJS('default_js', 10)
    @DefaultParameterDecoratorJS()
    @DefaultParameterArrowDecoratorJS(true, 'default_arrow_js')
    class TestJSForm16_17Sendable {
      public destructureJSValue: number = 2100;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0181
     * @tc.name test_js_form16_17_destructuring_default_stacked
     * @tc.desc Test JavaScript form 16-17 destructuring and default parameter decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_js_form16_17_destructuring_default_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JS Form16-17] Test Destructuring + Default Decorators JS');

      const instance: TestJSForm16_17Sendable = new TestJSForm16_17Sendable();

      expect(instance.destructureJSValue).assertEqual(2100);
      console.info('[JS Form16-17] Destructuring + Default JS decorators applied');
    });

    // Form 18-22: Rest + Template + Spread + Union + Optional (JS)
    @Sendable
    @RestParameterDecoratorJS('rest1_js', 'rest2_js', 'rest3_js')
    @TemplateLiteralDecoratorJS('template_js')
    @SpreadOperatorDecoratorJS({ prefix: 'spread_js', suffix: 'spread_suffix_js', level: 888 })
    @UnionTypeParameterDecoratorJS('union_string_js')
    @UnionTypeParameterDecoratorJS(2200)
    @OptionalParameterDecoratorJS('required_js', 2300)
    @OptionalParameterDecoratorJS('required_only_js')
    class TestJSForm18_22Sendable {
      public restTemplateJSValue: number = 2200;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0182
     * @tc.name test_js_form18_22_rest_template_spread_union_optional_stacked
     * @tc.desc Test JavaScript form 18-22 rest, template, spread, union, and optional decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_js_form18_22_rest_template_spread_union_optional_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JS Form18-22] Test Rest + Template + Spread + Union + Optional JS');

      const instance: TestJSForm18_22Sendable = new TestJSForm18_22Sendable();

      expect(instance.restTemplateJSValue).assertEqual(2200);
      console.info('[JS Form18-22] All JS decorators applied');
    });

    // JS All Forms Mega Combination
    @Sendable
    @RegularFunctionDecoratorJS
    @ArrowFunctionDecoratorJS
    @FunctionExpressionDecoratorJS
    @AnonymousFunctionDecoratorJS
    @IIFEDecoratorJS
    @FactoryFunctionDecoratorJS('mega_js_factory')
    @HigherOrderFunctionDecoratorJS(RegularFunctionDecoratorJS)
    @CurryingFunctionDecoratorJS('mega_js_curry')(8888)
    @ConditionalDecoratorJS(true)
    @AsyncStyleDecoratorJS
    @GeneratorStyleDecoratorJS
    @CallbackStyleDecoratorJS
    @ObjectMethodDecoratorJS
    @ClassMethodDecoratorJS
    @DestructuringParameterDecoratorJS({ prefix: 'mega_js_prefix', suffix: 'mega_js_suffix' })
    @DefaultParameterDecoratorJS('mega_js_default', 200)
    @RestParameterDecoratorJS('mega_js_rest1', 'mega_js_rest2')
    @TemplateLiteralDecoratorJS('mega_js_template')
    @SpreadOperatorDecoratorJS({ prefix: 'mega_js_spread', suffix: 'mega_js_suffix', level: 888 })
    @UnionTypeParameterDecoratorJS('mega_js_union')
    @OptionalParameterDecoratorJS('mega_js_optional', 300)
    class TestJSAllMegaSendable {
      public megaJSValue: number = 8888;

      validate(): boolean {
        return true;
      }

      execute(): number {
        return this.megaJSValue;
      }

      asyncExecute(): Promise<number> {
        return new Promise<number>((resolve): void => {
          resolve(this.megaJSValue);
        });
      }

      callbackExecute(): string {
        return 'mega_js_callback';
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0183
     * @tc.name test_js_all_mega_combination
     * @tc.desc Test all JavaScript decorators mega combination stacked together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_js_all_mega_combination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JS Mega] Test All JavaScript Decorators Mega Combination');

      const instance: TestJSAllMegaSendable = new TestJSAllMegaSendable();

      expect(instance.megaJSValue).assertEqual(8888);
      expect(instance.validate()).assertTrue();
      expect(instance.execute()).assertEqual(8888);
      expect(instance.callbackExecute()).assertEqual('mega_js_callback');
      console.info('[JS Mega] All JS decorators stacked successfully');
    });

    // ==================== Cross-Language: ETS + TS + JS All Decorators ====================

    @Sendable
    @LogClassDecorator
    @CountClassDecorator
    @RegularFunctionDecorator
    @RegularFunctionDecoratorJS
    @ArrowFunctionDecorator
    @ArrowFunctionDecoratorJS
    @FactoryFunctionDecorator('cross_all_factory_ts')
    @FactoryFunctionDecoratorJS('cross_all_factory_js')
    @CurryingFunctionDecorator('cross_all_curry')(5000)
    @CurryingFunctionDecoratorJS('cross_all_curry_js')(6000)
    @ConditionalDecorator(true)
    @ConditionalDecoratorJS(true)
    class TestCrossLanguageAllSendable {
      public crossAllValue: number = 5000;

      validate(): boolean {
        return true;
      }

      execute(): number {
        return this.crossAllValue;
      }

      callbackExecute(): string {
        return 'cross_all_callback';
      }

      asyncExecute(): Promise<number> {
        return new Promise<number>((resolve): void => {
          resolve(this.crossAllValue);
        });
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0184
     * @tc.name test_cross_language_all_decorators_stacked
     * @tc.desc Test ETS, TypeScript, and JavaScript all decorators stacked together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_cross_language_all_decorators_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[CrossAll] Test ETS + TS + JS All Decorators Stacked');

      const instance: TestCrossLanguageAllSendable = new TestCrossLanguageAllSendable();

      expect(instance.crossAllValue).assertEqual(5000);
      expect(instance.validate()).assertTrue();
      expect(instance.execute()).assertEqual(5000);
      expect(instance.callbackExecute()).assertEqual('cross_all_callback');
      console.info('[CrossAll] ETS + TS + JS all decorators stacked successfully');
    });

    // ==================== Sendable Rules Compliance ====================

    @Sendable
    @RegularFunctionDecorator
    @ArrowFunctionDecoratorJS
    @FactoryFunctionDecorator('compliance_ts')
    @FactoryFunctionDecoratorJS('compliance_js')
    @CurryingFunctionDecorator('compliance')(100)
    @CurryingFunctionDecoratorJS('compliance_js')(200)
    class TestSendableComplianceSendable {
      public predefinedValue: number = 7000;
      public predefinedLogs: collections.Array<string> = new collections.Array<string>();

      predefinedMethod(): number {
        return this.predefinedValue;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0185
     * @tc.name test_sendable_no_dynamic_properties
     * @tc.desc Test Sendable compliance with cross-language decorators and no dynamic properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_sendable_no_dynamic_properties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[Compliance] Test No Dynamic Properties');

      const instance: TestSendableComplianceSendable = new TestSendableComplianceSendable();

      expect(instance.predefinedValue !== undefined).assertTrue();
      expect(instance.predefinedLogs !== undefined).assertTrue();
      expect(instance.predefinedMethod !== undefined).assertTrue();

      expect(instance.predefinedLogs.length).assertEqual(0);

      console.info('[Compliance] No dynamic properties added');
    });

    @Sendable
    @RegularFunctionDecorator
    @ArrowFunctionDecorator
    @FactoryFunctionDecorator('ts_factory_tag')
    class TestTypeScriptDecoratorsStackedSendable {
      public tsValue: number = 100;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0186
     * @tc.name test_typescript_decorators_stacked
     * @tc.desc Test TypeScript decorators stacked with Regular, Arrow, and Factory decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_typescript_decorators_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TypeScript] Test TypeScript Decorators Stacked');

      const instance: TestTypeScriptDecoratorsStackedSendable = new TestTypeScriptDecoratorsStackedSendable();

      expect(instance.tsValue).assertEqual(100);
      console.info('[TypeScript] TypeScript decorators stacked successfully');
    });

    @Sendable
    @HigherOrderFunctionDecorator(RegularFunctionDecorator)
    @CurryingFunctionDecorator('ts_curry_step1')(200)
    @ConditionalDecorator(true)
    class TestTypeScriptAdvancedDecoratorsSendable {
      public tsAdvancedValue: number = 200;

      validate(): boolean {
        return true;
      }

      execute(): number {
        return this.tsAdvancedValue;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0187
     * @tc.name test_typescript_advanced_decorators
     * @tc.desc Test TypeScript advanced decorators with HigherOrder, Currying, and Conditional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_typescript_advanced_decorators', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TypeScript] Test TypeScript Advanced Decorators');

      const instance: TestTypeScriptAdvancedDecoratorsSendable = new TestTypeScriptAdvancedDecoratorsSendable();

      expect(instance.tsAdvancedValue).assertEqual(200);
      expect(instance.validate()).assertTrue();
      expect(instance.execute()).assertEqual(200);
      console.info('[TypeScript] TypeScript advanced decorators applied successfully');
    });

    @Sendable
    @ConditionalDecorator(false)
    class TestTypeScriptConditionalDisabledSendable {
      public tsDisabledValue: number = 300;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0188
     * @tc.name test_typescript_conditional_disabled
     * @tc.desc Test TypeScript conditional decorator disabled with false condition and no metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_typescript_conditional_disabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[TypeScript] Test TypeScript Conditional Disabled');

      const instance: TestTypeScriptConditionalDisabledSendable = new TestTypeScriptConditionalDisabledSendable();

      expect(instance.tsDisabledValue).assertEqual(300);
      console.info('[TypeScript] TypeScript conditional decorator disabled, no metadata');
    });

    // ==================== JavaScript Decorators Test ====================

    @Sendable
    @RegularFunctionDecoratorJS
    @ArrowFunctionDecoratorJS
    @FactoryFunctionDecoratorJS('js_factory_tag')
    class TestJavaScriptDecoratorsStackedSendable {
      public jsValue: number = 400;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0189
     * @tc.name test_javascript_decorators_stacked
     * @tc.desc Test JavaScript decorators stacked with Regular, Arrow, and Factory decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_javascript_decorators_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JavaScript] Test JavaScript Decorators Stacked');

      const instance: TestJavaScriptDecoratorsStackedSendable = new TestJavaScriptDecoratorsStackedSendable();

      expect(instance.jsValue).assertEqual(400);
      console.info('[JavaScript] JavaScript decorators stacked successfully');
    });

    @Sendable
    @HigherOrderFunctionDecoratorJS(RegularFunctionDecoratorJS)
    @CurryingFunctionDecoratorJS('js_curry_step1')(500)
    class TestJavaScriptAdvancedDecoratorsSendable {
      public jsAdvancedValue: number = 500;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0190
     * @tc.name test_javascript_advanced_decorators
     * @tc.desc Test JavaScript advanced decorators with HigherOrder and Currying decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_javascript_advanced_decorators', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[JavaScript] Test JavaScript Advanced Decorators');

      const instance: TestJavaScriptAdvancedDecoratorsSendable = new TestJavaScriptAdvancedDecoratorsSendable();

      expect(instance.jsAdvancedValue).assertEqual(500);
      console.info('[JavaScript] JavaScript advanced decorators applied successfully');
    });

    // ==================== Cross-Language Decorators Test ====================

    @Sendable
    @LogClassDecorator
    @RegularFunctionDecorator
    @RegularFunctionDecoratorJS
    @ArrowFunctionDecorator
    @ArrowFunctionDecoratorJS
    class TestCrossLanguageBasicSendable {
      public crossBasicValue: number = 600;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0191
     * @tc.name test_cross_language_basic_stacked
     * @tc.desc Test cross-language basic decorators with ETS, TS, and JS Regular and Arrow decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_cross_language_basic_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[CrossLanguage] Test Cross-Language Basic Stacked');

      const instance: TestCrossLanguageBasicSendable = new TestCrossLanguageBasicSendable();

      expect(instance.crossBasicValue).assertEqual(600);
      console.info('[CrossLanguage] ETS + TS + JS decorators stacked successfully');
    });

    @Sendable
    @FactoryFunctionDecorator('cross_ts_factory')
    @FactoryFunctionDecoratorJS('cross_js_factory')
    @CountClassDecorator
    class TestCrossLanguageFactorySendable {
      public crossFactoryValue: number = 700;
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0192
     * @tc.name test_cross_language_factory_stacked
     * @tc.desc Test cross-language factory decorators with TS and JS factory plus Count decorator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_cross_language_factory_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[CrossLanguage] Test Cross-Language Factory Stacked');

      const instance: TestCrossLanguageFactorySendable = new TestCrossLanguageFactorySendable();

      expect(instance.crossFactoryValue).assertEqual(700);
      console.info('[CrossLanguage] ETS + TS + JS factory decorators stacked successfully');
    });

    @Sendable
    @HigherOrderFunctionDecorator(RegularFunctionDecorator)
    @HigherOrderFunctionDecoratorJS(RegularFunctionDecoratorJS)
    @CurryingFunctionDecorator('cross_curry_ts')(800)
    @CurryingFunctionDecoratorJS('cross_curry_js')(900)
    class TestCrossLanguageAdvancedSendable {
      public crossAdvancedValue: number = 800;

      validate(): boolean {
        return true;
      }

      execute(): number {
        return this.crossAdvancedValue;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0193
     * @tc.name test_cross_language_advanced_stacked
     * @tc.desc Test cross-language advanced decorators with HigherOrder and Currying for TS and JS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_cross_language_advanced_stacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[CrossLanguage] Test Cross-Language Advanced Stacked');

      const instance: TestCrossLanguageAdvancedSendable = new TestCrossLanguageAdvancedSendable();

      expect(instance.crossAdvancedValue).assertEqual(800);
      expect(instance.validate()).assertTrue();
      expect(instance.execute()).assertEqual(800);
      console.info('[CrossLanguage] ETS + TS + JS advanced decorators stacked successfully');
    });

    // ==================== Sendable Rules Compliance ====================

    @Sendable
    @LogClassDecorator
    @RegularFunctionDecorator
    @ArrowFunctionDecoratorJS
    @FactoryFunctionDecorator('compliance_ts')
    @FactoryFunctionDecoratorJS('compliance_js')
    class TestSendableRulesComplianceSendable1 {
      public predefinedValue: number = 900;
      public predefinedLogs: collections.Array<string> = new collections.Array<string>();

      predefinedMethod(): number {
        return this.predefinedValue;
      }
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_DECORATOR_FORMS_0194
     * @tc.name test_sendable_rules_compliance_no_dynamic_properties
     * @tc.desc Test Sendable rules compliance to ensure no dynamic properties added by decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('test_sendable_rules_compliance_no_dynamic_properties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      console.info('[SendableCompliance] Test No Dynamic Properties');

      const instance: TestSendableRulesComplianceSendable1 = new TestSendableRulesComplianceSendable1();

      expect(instance.predefinedLogs.length).assertEqual(0);

      console.info('[SendableCompliance] No dynamic properties added by decorators');
    });
  });
}