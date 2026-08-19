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

// Decorators for Sendable test - Rich Implementation with Various Function Forms
// IMPORTANT: Decorators modifying Sendable classes MUST conform to Sendable rules:
// - Cannot dynamically add properties (violates Sendable rule)
// - Cannot dynamically delete properties (violates Sendable rule)
// - Cannot dynamically replace methods (violates Sendable rule)
// - Can record complex metadata (configs serialized to strings)
// - Can validate class structure at compile-time (prototype inspection)
// - Can receive configuration parameters (factory pattern)



import { collections } from '@kit.ArkTS';

// Global counters for decorator statistics
let DECORATOR_LOG_COUNTER: number = 0;
let DECORATOR_CALL_COUNT: number = 0;
let DECORATOR_INSTANCE_COUNT: number = 0;

// Metadata storage for decorators (Sendable-compliant: use primitive types)
export const CLASS_DECORATOR_METADATA: collections.Map<string, boolean> = new collections.Map<string, boolean>();
export const CLASS_CONFIG_METADATA: collections.Map<string, string> = new collections.Map<string, string>();
export const CLASS_VALIDATION_METADATA: collections.Map<string, string> = new collections.Map<string, string>();
const PROPERTY_DECORATOR_METADATA: collections.Map<string, string> = new collections.Map<string, string>();
const METHOD_DECORATOR_METADATA: collections.Map<string, string> = new collections.Map<string, string>();

// ==================== Configuration Interfaces ====================

export interface EntityConfig {
  id: string;
  tableName?: string;
  primaryKey?: string;
  indexes?: collections.Array<string>;
  softDelete?: boolean;
}

export interface CacheConfig {
  key: string;
  ttl: number;
  strategy: 'lazy' | 'eager' | 'write-through';
  maxSize?: number;
}

export interface ValidationConfig {
  requiredFields: collections.Array<string>;
  minFields?: number;
  maxFields?: number;
}

export interface SecurityConfig {
  roles: collections.Array<string>;
  permissions: collections.Array<string>;
  auditLog: boolean;
}

export interface PerformanceConfig {
  timeout: number;
  maxRetries: number;
  circuitBreaker: boolean;
}

// ==================== Function Form 1: Regular Function ====================

export function LogClassDecorator(target: Function): void {
  console.info(`[LogClassDecorator] Applied to class: ${target.name}`);
  CLASS_DECORATOR_METADATA.set(target.name + '_LogClassDecorator', true);
  DECORATOR_LOG_COUNTER++;
}

export function CountClassDecorator(target: Function): void {
  DECORATOR_CALL_COUNT++;
  CLASS_DECORATOR_METADATA.set(target.name + '_CountClassDecorator', true);
}

export function TraceClassDecorator(target: Function): void {
  CLASS_DECORATOR_METADATA.set(target.name + '_TraceClassDecorator', true);
}

// ==================== Function Form 2: Arrow Function (Internal) ====================

export function MonitorClassDecorator(target: Function): void {
  const logMonitorApplied = (): void => {
    console.info(`[MonitorClassDecorator] Monitoring enabled for: ${target.name}`);
  };

  const validateClassStructure = (): boolean => {
    return target.prototype.hasOwnProperty('execute') || target.prototype.hasOwnProperty('run');
  };

  logMonitorApplied();

  if (!validateClassStructure()) {
    console.warn(`[MonitorClassDecorator] WARN: ${target.name} should implement execute() or run() for monitoring`);
  }

  CLASS_DECORATOR_METADATA.set(target.name + '_MonitorClassDecorator', true);
}

export function PerformanceClassDecorator(target: Function): void {
  const checkMethods = (): void => {
    if (!target.prototype.hasOwnProperty('execute')) {
      console.warn(`[PerformanceClassDecorator] WARN: ${target.name} should implement execute() for performance tracking`);
    }
  };

  checkMethods();
  CLASS_DECORATOR_METADATA.set(target.name + '_PerformanceClassDecorator', true);
}

// ==================== Function Form 3: Factory Function (Parameterized) ====================

export function EntityClassDecorator(tableName: string): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_Entity_' + tableName, true);
    CLASS_CONFIG_METADATA.set(target.name + '_EntityConfig', `table:${tableName}`);
    console.info(`[EntityClassDecorator] ${target.name} mapped to table '${tableName}'`);
  };
}

export function CacheClassDecorator(cacheKey: string): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_Cache_' + cacheKey, true);
    CLASS_CONFIG_METADATA.set(target.name + '_CacheConfig', `key:${cacheKey}`);
  };
}

export function ConfigClassDecorator(configName: string): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_Config_' + configName, true);
    CLASS_CONFIG_METADATA.set(target.name + '_ConfigName', configName);
  };
}

export function DatabaseClassDecorator(tableName: string): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_Database_' + tableName, true);
    CLASS_CONFIG_METADATA.set(target.name + '_DatabaseConfig', `table:${tableName}`);
  };
}

export function ThrottleClassDecorator(delay: number): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_Throttle_' + delay.toString(), true);
    CLASS_CONFIG_METADATA.set(target.name + '_ThrottleConfig', `delay:${delay}`);
  };
}

export function DebounceClassDecorator(delay: number): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_Debounce_' + delay.toString(), true);
    CLASS_CONFIG_METADATA.set(target.name + '_DebounceConfig', `delay:${delay}`);
  };
}

export function MetricClassDecorator(metricName: string): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_Metric_' + metricName, true);
    CLASS_CONFIG_METADATA.set(target.name + '_MetricConfig', `metric:${metricName}`);
  };
}

export function VersionClassDecorator(version: string): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_Version_' + version, true);
    CLASS_CONFIG_METADATA.set(target.name + '_VersionConfig', `version:${version}`);
  };
}

// ==================== Function Form 4: Closure with Validation ====================

export function EntityDecorator(config: EntityConfig): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_EntityDecorator', true);

    const configStr = `table:${config.tableName},primaryKey:${config.primaryKey},softDelete:${config.softDelete || false}`;
    CLASS_CONFIG_METADATA.set(target.name + '_EntityConfig', configStr);

    const validatePrimaryKey = (): void => {
      if (!target.prototype.hasOwnProperty(config.primaryKey)) {
        // throw new Error(`[EntityDecorator] ERROR: ${target.name} missing primaryKey '${config.primaryKey}'`);
      }
    };

    const validateIndexes = (): void => {
      if (config.indexes && config.indexes.length > 0) {
        const missingIndexes: collections.Array<string> = new collections.Array<string>();
        for (const field of config.indexes) {
          if (!target.prototype.hasOwnProperty(field)) {
            missingIndexes.push(field);
          }
        }
        if (missingIndexes.length > 0) {
          console.warn(`[EntityDecorator] WARN: ${target.name} missing indexes: ${missingIndexes.join(',')}`);
        }
      }
    };

    validatePrimaryKey();
    validateIndexes();

    console.info(`[EntityDecorator] ${target.name} mapped to table '${config.tableName}' (primaryKey: ${config.primaryKey})`);
  };
}

export function CacheDecorator(config: CacheConfig): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_CacheDecorator', true);

    const configStr = `key:${config.key},ttl:${config.ttl},strategy:${config.strategy},maxSize:${config.maxSize || 0}`;
    CLASS_CONFIG_METADATA.set(target.name + '_CacheConfig', configStr);

    const validateTTL = (): void => {
      if (config.ttl <= 0) {
        throw new Error(`[CacheDecorator] ERROR: ttl must be positive (got ${config.ttl})`);
      }
    };

    const validateMethods = (): void => {
      if (!target.prototype.hasOwnProperty('getData')) {
        console.warn(`[CacheDecorator] WARN: ${target.name} should implement getData() for caching`);
      }
    };

    validateTTL();
    validateMethods();

    console.info(`[CacheDecorator] ${target.name} configured with strategy '${config.strategy}', ttl=${config.ttl}s`);
  };
}

export function ValidationDecorator(config: ValidationConfig): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_ValidationDecorator', true);

    const configStr = `requiredFields:${config.requiredFields.length},min:${config.minFields || 0},max:${config.maxFields || 0}`;
    CLASS_VALIDATION_METADATA.set(target.name + '_ValidationConfig', configStr);

    const validateRequiredFields = (): void => {
      const missingFields: collections.Array<string> = new collections.Array<string>();
      for (const field of config.requiredFields) {
        if (!target.prototype.hasOwnProperty(field)) {
          missingFields.push(field);
        }
      }
      if (missingFields.length > 0) {
        // throw new Error(`[ValidationDecorator] ERROR: ${target.name} missing required fields: ${missingFields.join(',')}`);
      }
    };

    validateRequiredFields();

    console.info(`[ValidationDecorator] ${target.name} validated with ${config.requiredFields.length} required fields`);
  };
}

export function SecurityDecorator(config: SecurityConfig): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_SecurityDecorator', true);

    const configStr = `roles:${config.roles.join(',')},permissions:${config.permissions.join(',')},auditLog:${config.auditLog}`;
    CLASS_CONFIG_METADATA.set(target.name + '_SecurityConfig', configStr);

    const validateRoles = (): void => {
      if (config.roles.length === 0) {
        // throw new Error(`[SecurityDecorator] ERROR: roles cannot be empty`);
      }
    };

    const validateAuditMethod = (): void => {
      if (config.auditLog && !target.prototype.hasOwnProperty('logAudit')) {
        console.warn(`[SecurityDecorator] WARN: ${target.name} should implement logAudit() for audit logging`);
      }
    };

    validateRoles();
    validateAuditMethod();

    console.info(`[SecurityDecorator] ${target.name} secured with roles: ${config.roles.join(',')}`);
  };
}

export function PerformanceDecorator(config: PerformanceConfig): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_PerformanceDecorator', true);

    const configStr = `timeout:${config.timeout},maxRetries:${config.maxRetries},circuitBreaker:${config.circuitBreaker}`;
    CLASS_CONFIG_METADATA.set(target.name + '_PerformanceConfig', configStr);

    const validateTimeout = (): void => {
      if (config.timeout <= 0) {
        // throw new Error(`[PerformanceDecorator] ERROR: timeout must be positive (got ${config.timeout})`);
      }
    };

    const validateRetries = (): void => {
      if (config.maxRetries < 0) {
        // throw new Error(`[PerformanceDecorator] ERROR: maxRetries cannot be negative (got ${config.maxRetries})`);
      }
    };

    validateTimeout();
    validateRetries();

    console.info(`[PerformanceDecorator] ${target.name} timeout=${config.timeout}ms, maxRetries=${config.maxRetries}`);
  };
}

// ==================== Function Form 5: Function with Multiple Actions ====================

export function SingletonClassDecorator(target: Function): void {
  CLASS_DECORATOR_METADATA.set(target.name + '_SingletonClassDecorator', true);
  DECORATOR_INSTANCE_COUNT++;

  console.info(`[SingletonClassDecorator] ${target.name} registered as singleton (instance count: ${DECORATOR_INSTANCE_COUNT})`);
}

export function ObservableClassDecorator(target: Function): void {
  CLASS_DECORATOR_METADATA.set(target.name + '_ObservableClassDecorator', true);

  const validateObservableMethods = (): void => {
    const hasNotify: boolean = target.prototype.hasOwnProperty('notify') as boolean;
    const hasSubscribe: boolean = target.prototype.hasOwnProperty('subscribe') as boolean;

    if (!hasNotify || !hasSubscribe) {
      console.warn(`[ObservableClassDecorator] WARN: ${target.name} should implement notify() and subscribe() for observable pattern`);
    }
  };

  validateObservableMethods();
}

export function TransactionClassDecorator(target: Function): void {
  CLASS_DECORATOR_METADATA.set(target.name + '_TransactionClassDecorator', true);

  const validateTransactionMethods = (): void => {
    if (!target.prototype.hasOwnProperty('commit') || !target.prototype.hasOwnProperty('rollback')) {
      console.warn(`[TransactionClassDecorator] WARN: ${target.name} should implement commit() and rollback() for transaction support`);
    }
  };

  validateTransactionMethods();
}

export function AuditClassDecorator(target: Function): void {
  CLASS_DECORATOR_METADATA.set(target.name + '_AuditClassDecorator', true);

  const validateAuditMethod = (): void => {
    if (!target.prototype.hasOwnProperty('logAudit')) {
      console.warn(`[AuditClassDecorator] WARN: ${target.name} should implement logAudit() for audit logging`);
    }
  };

  validateAuditMethod();
}

export function SecurityClassDecorator(target: Function): void {
  CLASS_DECORATOR_METADATA.set(target.name + '_SecurityClassDecorator', true);

  const validateSecurityMethods = (): void => {
    if (!target.prototype.hasOwnProperty('validateAccess')) {
      console.warn(`[SecurityClassDecorator] WARN: ${target.name} should implement validateAccess() for security checks`);
    }
  };

  validateSecurityMethods();
}

export function ValidationClassDecorator(target: Function): void {
  CLASS_DECORATOR_METADATA.set(target.name + '_ValidationClassDecorator', true);

  const validateValidationMethods = (): void => {
    if (!target.prototype.hasOwnProperty('validate')) {
      console.warn(`[ValidationClassDecorator] WARN: ${target.name} should implement validate() for field validation`);
    }
  };

  validateValidationMethods();
}

// ==================== Function Form 6: Simple Factory (Interface-based) ====================

export class EntityLegacyConfig {
  public id: string = '';
  
  constructor(id: string) {
    this.id = id;
  }
}

export function Entity(config: EntityLegacyConfig): (target: Function) => void {
  return (target: Function): void => {
    CLASS_DECORATOR_METADATA.set(target.name + '_Entity_' + config.id, true);
    CLASS_CONFIG_METADATA.set(target.name + '_EntityId', config.id);
  };
}

// ==================== Property Decorators ====================

export function LogPropertyDecorator(target: Object, propertyKey: string): void {
  PROPERTY_DECORATOR_METADATA.set(propertyKey + '_LogPropertyDecorator', 'applied');
}

export function Column(columnName: string): (target: Object, propertyKey: string) => void {
  return (target: Object, propertyKey: string): void => {
    PROPERTY_DECORATOR_METADATA.set(propertyKey + '_Column_' + columnName, columnName);
  };
}

export function Indexed(target: Object, propertyKey: string): void {
  PROPERTY_DECORATOR_METADATA.set(propertyKey + '_Indexed', 'indexed');
}

export function Unique(target: Object, propertyKey: string): void {
  PROPERTY_DECORATOR_METADATA.set(propertyKey + '_Unique', 'unique');
}

export function PrimaryKey(target: Object, propertyKey: string): void {
  PROPERTY_DECORATOR_METADATA.set(propertyKey + '_PrimaryKey', 'primary');
}

export function NotNull(target: Object, propertyKey: string): void {
  PROPERTY_DECORATOR_METADATA.set(propertyKey + '_NotNull', 'not_null');
}

export function Required(target: Object, propertyKey: string): void {
  PROPERTY_DECORATOR_METADATA.set(propertyKey + '_Required', 'required');
}

export function Encrypted(target: Object, propertyKey: string): void {
  PROPERTY_DECORATOR_METADATA.set(propertyKey + '_Encrypted', 'encrypted');
}

export function RangePropertyDecorator(min: number, max: number): (target: Object, propertyKey: string) => void {
  return (target: Object, propertyKey: string): void => {
    PROPERTY_DECORATOR_METADATA.set(propertyKey + '_Range_' + min.toString() + '_' + max.toString(),
      'range:' + min.toString() + '-' + max.toString());
  };
}

export function CachedPropertyDecorator(cacheKey: string): (target: Object, propertyKey: string) => void {
  return (target: Object, propertyKey: string): void => {
    PROPERTY_DECORATOR_METADATA.set(propertyKey + '_Cached_' + cacheKey, cacheKey);
  };
}

// ==================== Method Decorators ====================
// IMPORTANT: Cannot wrap/replace methods in Sendable classes (violates Sendable rule)

export function LogMethodDecorator(target: Object, propertyKey: string, descriptor: Object): void {
  METHOD_DECORATOR_METADATA.set(propertyKey + '_LogMethodDecorator', 'applied');
}

export function MeasureMethodDecorator(target: Object, propertyKey: string, descriptor: Object): void {
  METHOD_DECORATOR_METADATA.set(propertyKey + '_MeasureMethodDecorator', 'applied');
}

export function CacheMethodDecorator(cacheKey: string): (target: Object, propertyKey: string, descriptor: Object) => void {
  return (target: Object, propertyKey: string, descriptor: Object): void => {
    METHOD_DECORATOR_METADATA.set(propertyKey + '_Cache_' + cacheKey, cacheKey);
  };
}

export function ThrottleMethodDecorator(delay: number): (target: Object, propertyKey: string, descriptor: Object) => void {
  return (target: Object, propertyKey: string, descriptor: Object): void => {
    METHOD_DECORATOR_METADATA.set(propertyKey + '_Throttle_' + delay.toString(), 'throttle:' + delay.toString());
  };
}

export function DebounceMethodDecorator(delay: number): (target: Object, propertyKey: string, descriptor: Object) => void {
  return (target: Object, propertyKey: string, descriptor: Object): void => {
    METHOD_DECORATOR_METADATA.set(propertyKey + '_Debounce_' + delay.toString(), 'debounce:' + delay.toString());
  };
}

export function RetryMethodDecorator(retries: number): (target: Object, propertyKey: string, descriptor: Object) => void {
  return (target: Object, propertyKey: string, descriptor: Object): void => {
    METHOD_DECORATOR_METADATA.set(propertyKey + '_Retry_' + retries.toString(), 'retry:' + retries.toString());
  };
}

export function ValidateMethodDecorator(target: Object, propertyKey: string, descriptor: Object): void {
  METHOD_DECORATOR_METADATA.set(propertyKey + '_ValidateMethodDecorator', 'validate');
}

export function TransactionMethodDecorator(target: Object, propertyKey: string, descriptor: Object): void {
  METHOD_DECORATOR_METADATA.set(propertyKey + '_TransactionMethodDecorator', 'transaction');
}

export function AuditMethodDecorator(target: Object, propertyKey: string, descriptor: Object): void {
  METHOD_DECORATOR_METADATA.set(propertyKey + '_AuditMethodDecorator', 'audit');
}

export function SecurityMethodDecorator(target: Object, propertyKey: string, descriptor: Object): void {
  METHOD_DECORATOR_METADATA.set(propertyKey + '_SecurityMethodDecorator', 'security');
}

export function TraceMethodDecorator(target: Object, propertyKey: string, descriptor: Object): void {
  METHOD_DECORATOR_METADATA.set(propertyKey + '_TraceMethodDecorator', 'trace');
}

export function ReadOnlyMethodDecorator(target: Object, propertyKey: string, descriptor: Object): void {
  METHOD_DECORATOR_METADATA.set(propertyKey + '_ReadOnlyMethodDecorator', 'readonly');
}

export function PermissionMethodDecorator(permission: string): (target: Object, propertyKey: string, descriptor: Object) => void {
  return (target: Object, propertyKey: string, descriptor: Object): void => {
    METHOD_DECORATOR_METADATA.set(propertyKey + '_Permission_' + permission, permission);
  };
}

// ==================== Metadata Accessor Functions ====================

export function isDecoratorApplied(className: string, decoratorName: string): boolean {
  return CLASS_DECORATOR_METADATA.has(className + '_' + decoratorName);
}

export function getPropertyMetadata(propertyKey: string): string | undefined {
  return PROPERTY_DECORATOR_METADATA.get(propertyKey + '_LogPropertyDecorator');
}

export function getMethodMetadata(methodKey: string): string | undefined {
  return METHOD_DECORATOR_METADATA.get(methodKey + '_LogMethodDecorator');
}

export function getDecoratorLogCounter(): number {
  return DECORATOR_LOG_COUNTER;
}

export function getDecoratorCallCount(): number {
  return DECORATOR_CALL_COUNT;
}

export function getDecoratorInstanceCount(): number {
  return DECORATOR_INSTANCE_COUNT;
}

export function getClassConfig(className: string, configType: string): string | undefined {
  return CLASS_CONFIG_METADATA.get(className + '_' + configType);
}

export function getValidationConfig(className: string): string | undefined {
  return CLASS_VALIDATION_METADATA.get(className + '_ValidationConfig');
}